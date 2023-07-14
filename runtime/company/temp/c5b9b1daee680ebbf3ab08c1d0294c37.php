<?php /*a:2:{s:78:"D:\phpstudy_pro\WWW\points-mall-easyadmin\app\company\view\mall\goods\add.html";i:1688368985;s:78:"D:\phpstudy_pro\WWW\points-mall-easyadmin\app\company\view\layout\default.html";i:1688630258;}*/ ?>
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
<style type="text/css">
    .layui-form-checkbox { float: left; }
</style>
<div class="layuimini-container">
    <form id="app-form" class="layui-form layuimini-form">

        <div class="layui-form-item">
            <label class="layui-form-label required">积分商品</label>
            <div class="layui-input-block">
                <?php foreach([0 => '否', 1 => '是'] as $key => $vo): ?>
                    <input type="radio" name="is_integral_goods" value="<?php echo htmlentities($key); ?>" title="<?php echo htmlentities($vo); ?>" <?php if($key == 0): ?>checked=""<?php endif; ?>>
                <?php endforeach; ?>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">商品分类</label>
            <div class="layui-input-block">
                <select name="category_id" lay-filter="category" lay-verify="required">
                    <?php foreach($pidMenuList as $vo): ?>
                        <option value="<?php echo htmlentities($vo['id']); ?>"><?php echo $vo['category_name']; ?></option>
                    <?php endforeach; ?>
                </select>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">商品标题</label>
            <div class="layui-input-block">
                <input type="text" name="title" class="layui-input" lay-verify="required" placeholder="请输入商品标题" value="">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">副标题</label>
            <div class="layui-input-block">
                <input type="text" name="sub_title" class="layui-input" placeholder="副标题" value="">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label required">商品LOGO</label>
            <div class="layui-input-block layuimini-upload">
                <input name="logo" class="layui-input layui-col-xs6" lay-verify="required" placeholder="请上传分类图片" value="">
                <div class="layuimini-upload-btn">
                    <span><a class="layui-btn" data-upload="logo" data-upload-number="one" data-upload-exts="png|jpg|ico|jpeg" data-upload-icon="image"><i class="fa fa-upload"></i> 上传</a></span>
                    <span><a class="layui-btn layui-btn-normal" id="select_logo" data-upload-select="logo" data-upload-number="one" data-upload-mimetype="image/*"><i class="fa fa-list"></i> 选择</a></span>
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label required">商品图片</label>
            <div class="layui-input-block layuimini-upload">
                <input name="images" class="layui-input layui-col-xs6" lay-verify="required" placeholder="请上传商品图片" value="">
                <div class="layuimini-upload-btn">
                    <span><a class="layui-btn" data-upload="images" data-upload-number="more" data-upload-exts="png|jpg|ico|jpeg" data-upload-icon="image"><i class="fa fa-upload"></i> 上传</a></span>
                    <span><a class="layui-btn layui-btn-normal" id="select_images" data-upload-select="images" data-upload-number="more" data-upload-mimetype="image/*"><i class="fa fa-list"></i> 选择</a></span>
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">商品属性</label>
            <div class="property-list">
            </div>
            <div class="layui-input-block">
                <button type="button" class="layui-btn layui-btn-normal add-property-item">添加属性</button>
            </div>

            <tip>例：品牌：Apple/苹果</tip>
        </div>

        <div class="layui-form-item attribute-block">
            <label class="layui-form-label">销售属性</label>
            <div id="attribute-content">

            </div>
            <div class="attribute-list-table" style="display: none;">
                <div class="layui-input-block">
                    <div class="layui-form-item">
                        <label class="layui-form-label">销售规格</label>
                        <div class="layui-form-block">
                            <table class="layui-table">
                                <thead>
                                <tr>
                                    <th>颜色分类</th>
                                    <th>市场价</th>
                                    <th>折扣价</th>
                                    <th>积分</th>
                                    <th>数量*</th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">总数量</label>
            <div class="layui-input-inline">
                <input type="text" name="total_stock" class="layui-input" placeholder="0" value="0">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">积分</label>
            <div class="layui-input-inline">
                <input type="text" name="integral" class="layui-input" placeholder="请输入积分" value="">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">市场价格</label>
            <div class="layui-input-inline">
                <input type="text" name="market_price" class="layui-input" placeholder="请输入市场价格" value="">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">折扣价格</label>
            <div class="layui-input-inline">
                <input type="text" name="discount_price" class="layui-input" placeholder="请输入折扣价格" value="">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">虚拟销量</label>
            <div class="layui-input-inline">
                <input type="text" name="virtual_sales" class="layui-input" placeholder="请输入虚拟销量" value="">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">商品描述</label>
            <div class="layui-input-block">
                <textarea name="detail" rows="20" class="layui-textarea editor" placeholder="请输入商品描述"></textarea>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">分类排序</label>
            <div class="layui-input-inline">
                <input type="number" name="sort" class="layui-input" placeholder="请输入分类排序" value="0">
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">备注信息</label>
            <div class="layui-input-block">
                <textarea name="remark" class="layui-textarea" placeholder="请输入备注信息"></textarea>
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
