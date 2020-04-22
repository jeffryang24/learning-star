@extends('layouts.master')

@section('content')
    <div class="col-md-8 blog-main">
        <h1>{{ $post->title }}</h1>
        <p>
            {{ $post->body }}
        </p>

        <hr>

        <div class="comments">
            <ul class="list-group"> 
                @foreach ($post->comments as $cot)
                    <li class="list-group-item">
                        <strong>
                            {{ $cot->created_at->diffForHumans() }}
                        </strong>
                        : {{ $cot->body }}
                    </li>
                @endforeach
            </ul>
        </div>

        <div class="card">
            <div class="card-block">
                <form action="/posts/{{ $post->id }}/comment" method="post">
                    {{ csrf_field() }}
                    <div class="form-group">
                        <textarea name="body" id="txtComment" class="form-control" placeholder="Your comment here" required></textarea>
                    </div>

                    <div class="form-group">
                        <button type="submit" class="btn btn-primary">Add Comment</button>
                    </div>

                    @include('layouts.errors')
                </form>
            </div>
        </div>
    </div>
@endsection