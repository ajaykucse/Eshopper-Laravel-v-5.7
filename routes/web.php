<?php

Route::get('/admin/chat', function () {
    return view('admin.layouts.chat');
});
//Routes for public (home) page or index page
Route::get('/','IndexController@index');
//Routes for category Listing product pages
Route::get('/products/{url}','ProductsController@products');

Route::match(['get', 'post'], '/admin','AdminController@login');
//Routes for Authentication------------------------------------------------>

Auth::routes();
Route::get('/home', 'HomeController@index')->name('home');
Route::group(['middleware'=>['auth']],function(){
	Route::get('/admin/dashboard','AdminController@dashboard');
	Route::get('/admin/settings','AdminController@settings');
	Route::get('/admin/check-pwd','AdminController@checkPassword');
	Route::match(['get','post'], '/admin/update-pwd','AdminController@updatePassword');

	//Categories routes ('Admin')
	Route::match(['get','post'], '/admin/add-category','CategoryController@addCategory');
	Route::match(['get','post'], '/admin/edit-category/{id}','CategoryController@editCategory');
	Route::match(['get','post'], '/admin/delete-category/{id}','CategoryController@deleteCategory');
	Route::get('/admin/view-categories','CategoryController@viewCategories');

	//Products Routes (Admin)
	Route::match(['get','post'], '/admin/add-product','ProductsController@addProduct');
	Route::match(['get','post'], '/admin/edit-product/{id}','ProductsController@editProduct');
	Route::get('/admin/view-products','ProductsController@viewProducts');
	Route::get('/admin/delete-product/{id}','ProductsController@deleteProduct');
	Route::get('/admin/delete-product-image/{id}','ProductsController@deleteProductIimage');

	//Products Attributes Routes
	Route::match(['get','post'], '/admin/add-attributes/{id}','ProductsController@addAttributes');
	Route::get('/admin/delete-attribute/{id}','ProductsController@deleteAttribute');	
});

Route::get('/logout','AdminController@logout');
