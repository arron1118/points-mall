<?php
/**
 * copyright@Administrator
 * 2023/7/19 0019 16:14
 * email:arron1118@icloud.com
 */

use think\facade\Route;

//Route::miss('/');

Route::get('lottery', 'mall.lottery/index');

Route::group('account', function () {
    Route::get('/', 'member.user/index');
    Route::get('order', 'member.order/index');
    Route::get('address', 'member.address/index');
    Route::get('password', 'member.user/password');
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
});

Route::group('address', function () {
    Route::get('getAddressList', 'member.Address/getAddressList');
    Route::post('add', 'member.Address/add');
    Route::post('edit', 'member.Address/edit');
    Route::post('del', 'member.Address/del');
    Route::post('setDefaultAddress', 'member.Address/setDefaultAddress');
});
