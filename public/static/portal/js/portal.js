// var BASE_URL = document.scripts[document.scripts.length - 1].src.substring(0, document.scripts[document.scripts.length - 1].src.lastIndexOf("/") + 1);
const BASE_URL = window.location.origin + '/static/'
window.BASE_URL = BASE_URL;
// 初始化控制器对应的JS自动加载
if ("undefined" != typeof CONFIG.AUTOLOAD_JS && CONFIG.AUTOLOAD_JS) {
    require([BASE_URL + CONFIG.CONTROLLER_JS_PATH], function (Controller) {
        if (eval('Controller.' + CONFIG.ACTION)) {
            eval('Controller.' + CONFIG.ACTION + '()');
        }
    });
}
