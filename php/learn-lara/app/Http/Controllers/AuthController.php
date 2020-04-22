<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;

class AuthController extends Controller
{
    public function register() {
        return view('auth.register');
    }

    public function login() {
        return view('auth.login');
    }

    public function doLogin(Request $r) {
        $r->validate([
            'email' => 'required',
            'password' => 'required'
        ]);

        if (!\Auth::attempt([
            'email' => $r->email,
            'password' => $r->password
        ])) {
            return back()->withErrors([
                'message' => 'Please check your username or password!'
            ]);
        }

        return redirect('/posts');
    }

    public function doLogout() {
        \Auth::logout();

        return redirect('/posts');
    }

    public function doRegister(Request $r) {
        $r->validate([
            'name' => 'required',
            'email' => 'required|email',
            'password' => 'required|confirmed'
        ]);

        $user = User::addUser($r->name, $r->email, $r->password);

        \Auth::login($user);

        return redirect('/posts');
    }
}
