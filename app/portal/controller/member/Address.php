<?php
/**
 * copyright@Administrator
 * 2023/7/20 0020 9:35
 * email:arron1118@icloud.com
 */

namespace app\portal\controller\member;

use app\common\model\AnalysisRegion;
use app\common\model\MemberAddress;
use app\portal\middleware\Auth;

class Address extends \app\common\controller\PortalController
{

    protected $middleware = [Auth::class];

    public function initialize()
    {
        parent::initialize();

        $this->model = new MemberAddress();
    }

    public function index()
    {
        return $this->view->fetch();
    }

    public function add()
    {
        $params = $this->request->param();

        $region = [];
        foreach ($params['region_list'] as $val) {
            $region[] = AnalysisRegion::where('id', $val)->value('region_name');
        }
        $params['receiver_province'] = $region[0];
        $params['receiver_city'] = $region[1];
        $params['receiver_district'] = $region[2];
        $params['user_id'] = $this->userInfo->id;

        $this->model->save($params) ? $this->success('添加成功') : $this->error('添加失败');
    }

    public function edit($id)
    {
        $params = $this->request->param();

        $region = [];
        foreach ($params['region_list'] as $val) {
            $region[] = AnalysisRegion::where('id', $val)->value('region_name');
        }
        $params['receiver_province'] = $region[0];
        $params['receiver_city'] = $region[1];
        $params['receiver_district'] = $region[2];

        $this->model->where('id', $id)->save($params) ? $this->success('修改成功') : $this->error('修改失败');
    }

    public function del($id)
    {
        if (!$id) {
            $this->error('参数错误');
        }

        $this->model::destroy($id);

        $this->success('删除成功');
    }

    public function setDefaultAddress($id)
    {
        if (!$id) {
            $this->error('参数错误');
        }

        $this->model->where('id', $id)->save(['is_default' => 1]);
        $this->model->where('id', '<>', $id)->save(['is_default' => 0]);

        $this->success('设置成功');
    }

    public function getAddressList()
    {
        $list = $this->model->where('user_id', $this->userInfo->id)->select();

        $this->success('success', $list->hidden(['user_id', 'remark', 'create_time', 'update_time', 'delete_time']));
    }

}
