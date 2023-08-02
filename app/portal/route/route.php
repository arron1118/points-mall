<?php
/**
 * copyright@Administrator
 * 2023/7/19 0019 16:14
 * email:arron1118@icloud.com
 */

use think\facade\Route;

//Route::miss('/');

Route::group('lottery', function () {
    Route::get('/', 'mall.lottery/index');
    Route::get('info', 'mall.lottery/info');
    Route::post('receiveLottery', 'mall.lottery/receiveLottery');
});

Route::group('account', function () {
    Route::get('/', 'member.user/index');
    Route::get('order', 'member.orders/index');
    Route::get('getOrderList', 'member.orders/getOrderList');
    Route::get('address', 'member.address/index');
    Route::get('password', 'member.user/password');
    Route::post('resetPassword', 'member.user/resetPassword');
});

Route::get('login', 'Index/login');
Route::post('doLogin', 'Index/doLogin');

Route::get('register', 'Index/register');
Route::post('doRegister', 'Index/doRegister');
Route::get('registerSuccess', 'Index/registerSuccess');

Route::get('detail/:id?', 'mall.goods/detail');

Route::get('error', 'Error/index');

Route::group('goods', function () {
    Route::get('getDetail', 'mall.goods/getDetail');
    Route::get('getSpecs', 'mall.goods/getSpecs');
    Route::post('checkUserIntegral', 'mall.goods/checkUserIntegral');
});

Route::group('order', function () {
    Route::get('/', 'mall.orders/index');
    Route::post('getGoodsDetail', 'mall.orders/getGoodsDetail');
});

Route::group('address', function () {
    Route::get('getAddressList', 'member.Address/getAddressList');
    Route::post('add', 'member.Address/add');
    Route::post('edit', 'member.Address/edit');
    Route::post('del', 'member.Address/del');
    Route::post('setDefaultAddress', 'member.Address/setDefaultAddress');
});
