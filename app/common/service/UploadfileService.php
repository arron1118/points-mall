<?php


namespace app\common\service;


use EasyAdmin\upload\driver\Alioss;
use EasyAdmin\upload\driver\Local;
use EasyAdmin\upload\driver\Qnoss;
use EasyAdmin\upload\driver\Txcos;
use think\db\exception\DbException;
use think\exception\FileException;
use think\facade\Config;
use think\facade\Filesystem;
use app\admin\model\SystemUploadfile as AttachmentModel;
use think\File;

class UploadfileService
{

    /**
     * 上传方式
     * @var string
     */
    protected $uploadType = 'local';

    /**
     * 上传配置文件
     * @var array
     */
    protected $uploadConfig;

    /**
     * 需要上传的文件对象
     * @var File
     */
    protected $file;

    /**
     * 保存上传文件的数据表
     * @var string
     */
    protected $tableName = 'system_uploadfile';

    /**
     * 上传完成的文件路径
     * @var string
     */
    protected $completeFilePath;

    /**
     * 上传完成的文件的URL
     * @var string
     */
    protected $completeFileUrl;

    public function __construct($file)
    {
        $this->file = $file;
    }

    public function upload()
    {
        if ($this->uploadType === 'local') {
            return $this->save();
        } else {
            $obj = null;
            if ($this->uploadType === 'alioss') {
                $obj = new Alioss();
            } elseif ($this->uploadType === 'qnoss') {
                $obj = new Qnoss();
            } elseif ($this->uploadType === 'txcos') {
                $obj = new Txcos();
            }

            return $obj->setUploadConfig($this->uploadConfig)
                ->setUploadType($this->uploadType)
                ->setTableName($this->tableName)
                ->setFile($this->file)
                ->save();
        }
    }

    public function save()
    {
        if (!$this->file) {
            return [
                'save' => false,
                'msg' => '上传失败：未找到文件',
                'url' => '',
            ];
        }

        try {

            $this->saveFile();

            try {
                // 保存上传记录
                $attachment = new AttachmentModel();
                $attachment->admin_id = session('admin.id') ?? 0;
                $attachment->company_id = session('company.id') ?? 0;
                $attachment->url = $this->completeFileUrl;
                $attachment->mime_type = $this->file->getOriginalMime();
                $attachment->file_ext = $this->file->getOriginalExtension();
                $attachment->upload_type = 'local';
                $attachment->sha1 = $this->file->sha1();
                $attachment->original_name = str_replace('.' . $this->file->getOriginalExtension(), '', $this->file->getOriginalName());
                $attachment->file_size = $this->file->getSize();

                // 如果是图片
                $imagesize = getimagesize($this->file->getRealPath());
                if ($imagesize) {
                    $attachment->image_width = $imagesize[0];
                    $attachment->image_height = $imagesize[1];
                }

                $attachment->save();
            } catch (DbException $dbException) {
                exit($dbException->getMessage());
            }
        } catch (FileException $e) {
            exit($e->getMessage());
        }

        return [
            'save' => true,
            'msg'  => '上传成功',
            'url'  => $this->completeFileUrl,
        ];
    }

    /**
     * 保存文件
     */
    public function saveFile()
    {
        $this->completeFilePath = Filesystem::disk('public')->putFile('upload', $this->file);
        $this->completeFileUrl = request()->domain() . '/' . str_replace(DIRECTORY_SEPARATOR, '/', $this->completeFilePath);
    }

    /**
     * 设置上传文件
     * @param $value
     * @return $this
     */
    public function setUploadConfig($value)
    {
        $this->uploadConfig = $value;
        return $this;
    }

    /**
     * 设置上传方式
     * @param $value
     * @return $this
     */
    public function setUploadType($value)
    {
        $this->uploadType = $value;
        return $this;
    }

    /**
     * 设置保存数据表
     * @param $value
     * @return $this
     */
    public function setTableName($value)
    {
        $this->tableName = $value;
        return $this;
    }

}
