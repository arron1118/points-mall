<?php /*a:2:{s:80:"D:\phpstudy_pro\WWW\points-mall-easyadmin\app\company\view\mall\lottery\add.html";i:1689322104;s:78:"D:\phpstudy_pro\WWW\points-mall-easyadmin\app\company\view\layout\default.html";i:1688630258;}*/ ?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title><?php echo sysconfig('site','site_name'); ?></title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" href="/static/admin/css/public.css?v=<?php echo htmlentities($version); ?>" media="all">
    <script>
        window.CONFIG = {
            ADMIN: "<?php echo htmlentities((isset($adminModuleName) && ($adminModuleName !== '')?$adminModuleName:'company')); ?>",
            CONTROLLER_JS_PATH: "<?php echo htmlentities((isset($thisControllerJsPath) && ($thisControllerJsPath !== '')?$thisControllerJsPath:'')); ?>",
            ACTION: "<?php echo htmlentities((isset($thisAction) && ($thisAction !== '')?$thisAction:'')); ?>",
            AUTOLOAD_JS: "<?php echo htmlentities((isset($autoloadJs) && ($autoloadJs !== '')?$autoloadJs:'false')); ?>",
            IS_SUPER_ADMIN: "<?php echo htmlentities((isset($isSuperAdmin) && ($isSuperAdmin !== '')?$isSuperAdmin:'false')); ?>",
            VERSION: "<?php echo htmlentities((isset($version) && ($version !== '')?$version:'1.0.0')); ?>",
            CSRF_TOKEN: "<?php echo token(); ?>",
        };
    </script>
    <script src="/static/plugs/layui-v2.5.6/layui.all.js?v=<?php echo htmlentities($version); ?>" charset="utf-8"></script>
    <script src="/static/plugs/require-2.3.6/require.js?v=<?php echo htmlentities($version); ?>" charset="utf-8"></script>
    <script src="/static/config-admin.js?v=<?php echo htmlentities($version); ?>" charset="utf-8"></script>
</head>
<body>
<div class="layuimini-container">
    <form id="app-form" class="layui-form layuimini-form">

        <div class="layui-form-item">
            <label class="layui-form-label">标题</label>
            <div class="layui-input-block">
                <input type="text" name="title" class="layui-input" lay-verify="required" placeholder="请输入标题" value="">
                <tip>填写标题。</tip>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">描述</label>
            <div class="layui-input-block">
                <textarea name="detail" rows="10" class="layui-textarea editor" placeholder="请输入商品描述"></textarea>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">奖品</label>
            <div class="layui-input-block">
                <table class="layui-table">
                    <thead>
                    <tr>
                        <th width="100">奖品类型</th>
                        <th width="80">商品</th>
                        <th width="220">图片</th>
                        <th>标题</th>
                        <th width="150">数额</th>
                        <th width="150">中奖概率</th>
                        <th width="150">数量</th>
                        <th width="50"></th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php $__FOR_START_1417715372__=0;$__FOR_END_1417715372__=12;for($i=$__FOR_START_1417715372__;$i < $__FOR_END_1417715372__;$i+=1){ ?>
                    <tr>
                        <td>
                            <select class="layui-select" lay-filter="select-type" name="prize_list[<?php echo htmlentities($i); ?>][type]">
                                <option value="">请选择</option>
                                <?php foreach($typeList as $key => $val): ?>
                                    <option value="<?php echo htmlentities($key); ?>"><?php echo htmlentities($val); ?></option>
                                <?php endforeach; ?>
                            </select>
                        </td>
                        <td>
                            <div class="layuimini-upload">
                                <input name="prize_list[<?php echo htmlentities($i); ?>][goods_id]" class="layui-input layui-col-xs6 prize-goods-id" type="hidden">
                                <button type="button" class="layui-btn layui-btn-sm layui-btn-normal select-goods" id="select_goods<?php echo htmlentities($i); ?>" data-goods-select="prize_list[<?php echo htmlentities($i); ?>][goods_id]" data-goods-number="one" disabled><i class="fa fa-list"></i> 选择商品</button>
                            </div>
                        </td>
                        <td>
                            <div class="layuimini-upload">
                                <input name="prize_list[<?php echo htmlentities($i); ?>][img]" class="layui-input layui-col-xs6 prize-img" type="hidden">
                                <img src="" style="max-width: 200px; max-height: 40px; " />
                                <div class="layuimini-upload-btn">
                                    <button type="button" class="layui-btn layui-btn-sm" data-image="prize_list[<?php echo htmlentities($i); ?>][img]" data-image-number="one" data-image-exts="png|jpg|ico|jpeg" data-image-icon="image"><i class="fa fa-upload"></i> 上传</button>
                                    <button type="button" class="layui-btn layui-btn-sm layui-btn-normal" id="select_logo<?php echo htmlentities($i); ?>" data-image-select="prize_list[<?php echo htmlentities($i); ?>][img]" data-image-number="one" data-image-mimetype="image/*"><i class="fa fa-list"></i> 选择</button>
                                </div>
                            </div>
                        </td>
                        <td>

                            <input name="prize_list[<?php echo htmlentities($i); ?>][title]" type="text" class="layui-input prize-title" value="" />
                        </td>
                        <td>
                            <input name="prize_list[<?php echo htmlentities($i); ?>][amount]" class="layui-input prize-amount" type="text" />
                        </td>
                        <td>
                            <input name="prize_list[<?php echo htmlentities($i); ?>][probability]" class="layui-input" type="text" />
                        </td>
                        <td>
                            <input name="prize_list[<?php echo htmlentities($i); ?>][quantity]" class="layui-input" type="text" />
                        </td>
                        <td>
                            <button type="button" class="layui-btn layui-btn-sm clear-prize-btn">清空</button>
                        </td>
                    </tr>
                    <?php } ?>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">日期范围</label>
            <div class="layui-input-block">
                <input type="text" autocomplete="off" id="startDate" class="layui-input" placeholder="日期范围" name="range_date" value="">
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">备注信息</label>
            <div class="layui-input-block">
                <textarea name="remark" class="layui-textarea"  placeholder="请输入备注信息"></textarea>
            </div>
        </div>

        <div class="hr-line"></div>
        <div class="layui-form-item text-center">
            <button type="submit" class="layui-btn layui-btn-normal layui-btn-sm" lay-submit>确认</button>
            <button type="reset" class="layui-btn layui-btn-primary layui-btn-sm">重置</button>
        </div>

    </form>
</div>

</body>
</html>
