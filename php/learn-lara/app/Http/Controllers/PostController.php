<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Post;
use Carbon\Carbon;

class PostController extends Controller
{
    public function __construct() {
        $this->middleware('auth')->except(['index', 'show']);
    }

    public function index() {
        //$posts = Post::latest()->get();
        
        // For repository mode
        $posts = (new \App\Repositories\Posts)->all();

        //$archives = Post::selectRaw('year(created_at) as year, monthname(created_at) as month, count(*) as total_post')->groupBy('year', 'month')->orderByRaw('min(created_at)')->get()->toArray();

        $archives = Post::archives();

        return view('posts.index', compact('posts', 'archives'));
    }

    public function show(Post $post) {
        return view('posts.show', compact('post'));
    }

    public function showByMonth($month, $year) {
        $posts = Post::latest()->filter([
            'month' => $month,
            'year' => $year
        ])->get();


        $archives = Post::selectRaw('year(created_at) as year, monthname(created_at) as month, count(*) as total_post')->groupBy('year', 'month')->orderByRaw('min(created_at)')->get()->toArray();
        
        //$posts = $posts->whereMonth('created_at', Carbon::parse($month)->month)->whereYear('created_at', $year)->get();

        return view('posts.index', compact('posts', 'archives'));
    }

    public function create() {
        return view('posts.create');
    }

    public function store(Request $r) {
        // $post = new Post;
        // $post->title = $r->title;
        // $post->body = $r->body;
        // $post->save();

        $r->validate([
            'title' => 'required|max:150',
            'body' => 'required'
        ]);

        // Post::create([
        //     'title' => $r->title,
        //     'body' => $r->body,
        //     'user_id' => \Auth::id()
        // ]);

        \Auth::user()->publish(
            new Post([
                'title' => $r->title,
                'body' => $r->body
            ])
        );

        return redirect('/posts/create');
    }
}
