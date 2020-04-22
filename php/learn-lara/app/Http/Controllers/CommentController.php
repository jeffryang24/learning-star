<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Post;
use App\Comment;

class CommentController extends Controller
{
    public function store(Post $post, Request $r) {
        $r->validate([
            'body' => 'required|min:5'
        ]);

        $post->addComment($r->body);

        return back();
    }
}
