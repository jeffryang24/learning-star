<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use App\User;

class AuthController extends Controller
{

    public function __construct(){
        $this->middleware('guest')->except(['logout']);
    }

    public function logout(){
        Auth::logout();

        return redirect()->home();
    }

    public function login(){
        $pgs = [
            'title' => 'Sign In',
            'desc' => ''
        ];

        $pgs = (object)$pgs;

        return view('session.login', compact('pgs'));
    }

    public function logins(Request $req){

        if (!Auth::attempt([
            'email' => $req->email,
            'password' => $req->password
        ])){
            return back()->withErrors([
                'message' => 'Please check your credentials!'  
            ]);
        }

        return redirect()->home();
    }

    public function register(){
        $pgs = [
            'title' => 'Register User',
            'desc' => ''
        ];

        $pgs = (object)$pgs;
        return view ('session.register', compact('pgs'));
    }

    public function store(Request $req){
        $this->validate($req, [
            'name' => 'required',
            'email' => 'required|email',
            'password' => 'required|confirmed'
        ]);

        $user = User::create([
            'name' => $req->name,
            'email' => $req->email,
            'password' => Hash::make($req->password)
        ]); 

        Auth::login($user);

        return redirect()->home();
    }
}
