<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', 'PostsController@index')->name('home');
Route::get('/post/create', 'PostsController@create');
Route::post('/post', 'PostsController@publish');
Route::get('/post/{post}', 'PostsController@show');
Route::post('/post/{post}/comments', 'CommentsController@store');

Route::get('/register', 'AuthController@register');
Route::post('/register', 'AuthController@store');
Route::get('/login', 'AuthController@login');
Route::post('/logins', 'AuthController@logins');
Route::get('/logout', 'AuthController@logout');