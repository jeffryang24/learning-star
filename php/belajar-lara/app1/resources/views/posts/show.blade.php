@extends('layouts.master')

@section('content')
    <div class="blog-post">
        <h2 class="blog-post-title">{{ $pgs->post->title }}</h2>
        <p class="blog-post-meta">{{ $pgs->post->created_at->toFormattedDateString() }} by <a href="#">{{ $pgs->post->users->name }}</a></p>
        <p>
            {{ $pgs->post->body }}
        </p>

        <hr>

        <div class="comments">
            <ul class="list-group">
            @foreach($pgs->post->comments as $c)
                <li class="list-group-item">
                    <strong>
                        {{ $c->created_at->diffForHumans() }}: &nbsp;
                    </strong>
                    {{ $c->body }}
                </li>
            @endforeach
            </ul>
        </div>

        <hr>

        <div class="card">
            <div class="card-block">
                <form action="/post/{{ $pgs->post->id }}/comments" method="POST">
                    {{ csrf_field() }}
                    <div class="form-group">
                        <textarea name="body" placeholder="Your comment here!" rows="3" class="form-control"></textarea>
                    
                    </div>

                    <div class="form-group">
                        <button class="btn btn-primary" type="submit">
                            Add Comment
                        </button>
                    </div>

                    <div class="form-group">
                        @include('layouts.error')
                    </div>
                </form>
            </div>
        </div>
    </div><!-- /.blog-post -->
@endsection