<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Posts;

class PostsController extends Controller
{

    public function __construct(){
        $this->middleware('auth')->except(['index', 'show']);
    }

    public function index(){
        $posts = Posts::latest()->get();

        $pgs = [
            'title' => 'Welcome to The BlogPost',
            'desc' => '',
            'posts' => $posts
        ];

        $pgs = (object)$pgs;

        return view('welcome', compact('pgs'));
    }

    public function create(){
        $pgs = [
            'title' => 'Content Publisher',
            'desc' => 'Publish your current content to BlogPost'
        ];

        $pgs = (object)$pgs;

        return view('posts.create', compact('pgs'));
    }

    public function publish(Request $request){

        $this->validate($request, [
            'title' => 'required|max:10',
            'body' => 'required',
        ]);

        Auth::user()->publish(new Posts([
            'body' => $request->body,
            'title' => $request->title
        ]));

        /*Posts::create([
            'body' => $request->body,
            'title' => $request->title,
            'users_id' => Auth::id()
        ]);*/

        return redirect('/');
    }

    public function show(Posts $post){
        $pgs = [
            'title' => $post->title,
            'desc' => '',
            'post' => $post
        ];

        $pgs = (object)$pgs;

        return view('posts.show', compact('pgs'));
    }
}
