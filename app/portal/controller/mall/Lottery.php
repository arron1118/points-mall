<?php
/**
 * copyright@Administrator
 * 2023/7/19 0019 10:37
 * email:arron1118@icloud.com
 */

namespace app\portal\controller\mall;

use app\common\model\MallLottery;
use app\common\model\MemberIntegralLogs;
use app\common\model\MemberLotteryLogs;
use app\common\model\MemberLotteryMessages;
use app\common\model\MemberLotteryPrizes;
use app\portal\middleware\Auth;

class Lottery extends \app\common\controller\PortalController
{

    protected $middleware = [Auth::class];

    protected $layout = 'layout/lottery_layout';


    protected function initialize()
    {
        parent::initialize();

        $this->model = new MallLottery();
    }

    public function index()
    {
        return $this->view->fetch();
    }

    public function info($id)
    {
        $lottery = $this->model->with(['lotteryPrizes'])->find($id);

        if ($lottery) {
            $lottery->detail = htmlspecialchars_decode($lottery->detail);
        }

        $this->success('success', $lottery->hidden(['lotteryPrizes.create_time', 'lotteryPrizes.update_time']));
    }

    public function receiveLottery()
    {
        if ($this->request->isPost()) {
            $post = $this->request->param();
            $lottery = $this->model->find($post['lottery_id']);
            ++$lottery->attend_num;  // 参与人数
            $lottery->save();

            $logs = $prize = $message = [
                'user_id' => $this->userInfo->id,
                'lottery_id' => $post['lottery_id'],
            ];

            // 抽奖记录
            $logs['lottery_detail'] = $lottery->toArray();
            (new MemberLotteryLogs())->save($logs);

            $appendText = '';
            switch ((int) $post['type']) {
                case 2:
                    $appendText = ' + ' . $post['amount'];
                    $this->userInfo->integral += $post['amount'];
                    $this->userInfo->save();

                    // 积分变动
                    (new MemberIntegralLogs())->save([
                        'user_id' => $this->userInfo->id,
                        'type' => 2,
                        'integral_amount' => $post['amount'],
                        'title' => '抽奖',
                    ]);
                    break;

                case 3:
                    $appendText = ' ￥ ' . $post['amount'];
                    $this->userInfo->balance += $post['amount'];
                    $this->userInfo->save();
                    break;

                case 4:
                    $prize['status'] = 0;
                    break;
            }

            $message['title'] = '抽奖';
            if ((int) $post['type'] !== 0) {
                $prize['lottery_detail'] = $lottery->toArray();
                $prize['prize_id'] = $post['id'];
                $prize['prize_detail'] = $post;
                (new MemberLotteryPrizes())->save($prize);

                $message['content'] = '恭喜您在参与“' . $lottery['title'] . '”抽奖中获得“' . $post['title'] . '”' . $appendText;
            } else {
                $message['content'] = '您在参与“' . $lottery['title'] . '”抽奖中获得遗憾未中奖，感谢您的参与！';
            }

            (new MemberLotteryMessages())->save($message);
            $this->success('success', $post);
        }
    }
}
