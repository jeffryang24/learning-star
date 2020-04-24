<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Posts;
use App\Comments;

class CommentsController extends Controller
{
    public function store(Posts $post, Request $req){

        $this->validate($req, [
            'body' => 'required|min:2'
        ]);
        
        $body = [
            'body' => $req->body,
            'posts_id' => $post->id,
            'user_id' => Auth::id()
        ];

        //$post->addComment($req->body);
        $post->addComment($body);
        return back();
    }
}
