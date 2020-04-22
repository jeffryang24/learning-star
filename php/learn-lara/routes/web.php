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

Route::get('/', function () {
    $tasks = [
        'Go to office',
        'Playing games',
        'Working hard'
    ];

    $name = 'Jeffry';

    return view('welcome', compact('tasks', 'name'));
});

Route::get('posts', 'PostController@index');
Route::get('home', function() {
    return redirect('/posts');
});

Route::get('posts/create', 'PostController@create');

Route::get('posts/{month}/{year}', 'PostController@showByMonth');

Route::get('posts/{post}', 'PostController@show');

Route::post('posts', 'PostController@store');

Route::post('posts/{post}/comment', 'CommentController@store');

Route::get('tasks', 'TasksController@index');

Route::get('tasks/{task}', 'TasksController@show');

Route::get('about', function () {
    return view('about');
});

Route::get('register', 'AuthController@register');

Route::post('register', 'AuthController@doRegister');
Route::get('login', 'AuthController@login')->middleware('guest')->name('login');
Route::post('login', 'AuthController@doLogin');
Route::get('logout', 'AuthController@doLogout');