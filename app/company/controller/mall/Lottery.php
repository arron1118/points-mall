<?php

namespace app\company\controller\mall;

use app\admin\traits\Curd;
use app\common\model\MallLottery;
use app\common\model\MallLotteryPrizes;
use EasyAdmin\annotation\ControllerAnnotation;
use EasyAdmin\annotation\NodeAnotation;

/**
 * Lottery
 * @package app\company\controller\mall
 * @ControllerAnnotation(title="幸运抽奖管理")
 */
class Lottery extends \app\common\controller\CompanyController
{

    use Curd;

    protected function initialize()
    {
        parent::initialize();

        $this->model = new MallLottery();
    }

    /**
     * @NodeAnotation(title="列表")
     */
    public function index()
    {
        if ($this->request->isAjax()) {
            if (input('selectFields')) {
                return $this->selectList();
            }
            [$page, $limit, $where] = $this->buildTableParames();
            $count = $this->model
                ->with(['lotteryPrizes'])
                ->where($where)
                ->count();
            $list = $this->model
                ->with(['lotteryPrizes'])
                ->where($where)
                ->page($page, $limit)
                ->order($this->sort)
                ->select();
            $data = [
                'code'  => 0,
                'msg'   => '',
                'count' => $count,
                'data'  => $list,
            ];
            return json($data);
        }
        return $this->fetch();
    }

    /**
     * @NodeAnotation(title="添加")
     */
    public function add()
    {
        if ($this->request->isPost()) {
            $post = $this->request->post();
            $rule = [];
            $this->validate($post, $rule);
            try {
                $post['company_id'] = $this->userInfo->id;

                $prizes = [];
                foreach ($post['prize_list'] as $key => $value) {
                    if ($value['type'] === '') {
                        unset($post['prize_list'][$key]);
                    } else {
                        $prizes[] = $value;
                    }
                }

                if (empty($prizes)) {
                    $this->error('至少有填写一项奖项');
                }

                if ($post['range_date']) {
                    $range = explode(' - ', $post['range_date']);
                    $post['start_time'] = strtotime($range[0]);
                    $post['end_time'] = strtotime($range[1]);
                }

                $save = $this->model->save($post);

                if ($save) {
                    foreach ($prizes as $key => $val) {
                        $prizes[$key]['lottery_id'] = $this->model->id;
                    }
                    (new MallLotteryPrizes())->saveAll($prizes);
                }
            } catch (\Exception $e) {
                $this->error('保存失败:'.$e->getMessage());
            }
            $save ? $this->success('保存成功') : $this->error('保存失败');
        }

        $this->assign([
            'typeList' => (new MallLotteryPrizes())->getTypeList()
        ]);
        return $this->fetch();
    }

    /**
     * @NodeAnotation(title="编辑")
     */
    public function edit($id)
    {
        $row = $this->model->with(['lotteryPrizes'])->find($id);
        empty($row) && $this->error('数据不存在');
        if ($this->request->isPost()) {
            $post = $this->request->post();
            $rule = [];
            $this->validate($post, $rule);
            try {
                $prizes = [];
                foreach ($post['prize_list'] as $key => $value) {
                    if ($value['type'] === '') {
                        unset($post['prize_list'][$key]);
                    } else {
                        $prizes[] = $value;
                    }
                }

                if (empty($prizes)) {
                    $this->error('至少有填写一项奖项');
                }

                if ($post['range_date']) {
                    $range = explode(' - ', $post['range_date']);
                    $post['start_time'] = strtotime($range[0]);
                    $post['end_time'] = strtotime($range[1]);
                }

//                $save = $this->model->save($post);

                $save = false;
                if ($save) {
                    $row = $row->toArray();
                    $arr = array_diff(array_column($row['lotteryPrizes'], 'id'), array_column($prizes, 'id'));
                    $arr && MallLotteryPrizes::destroy(array_values($arr), true);

                    (new MallLotteryPrizes())->saveAll($prizes);
                }
            } catch (\Exception $e) {
                $this->error('保存失败');
            }
            $save ? $this->success('保存成功') : $this->error('保存失败', $post);
        }

        $row->range_time = $row->start_time && $row->end_time ? $row->start_time . ' - ' . $row->end_time : '';

//        dump($row->toArray());
        $this->assign([
            'typeList' => (new MallLotteryPrizes())->getTypeList(),
            'row' => $row,
        ]);
        return $this->fetch();
    }

}
