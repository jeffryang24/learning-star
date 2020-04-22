@extends('layouts.master')

@section('content')
    <div class="col-md-8 blog-main">
        <h1>Create your post</h1>
        <hr>
        <form method="POST" action="/posts">
            {{ csrf_field() }}
            <div class="form-group">
                <label for="txtTitle">Title</label>
                <input type="text" class="form-control" id="txtTitle" placeholder="Enter title" name="title">
            </div>
            <div class="form-group">
                <label for="txtBody">Body</label>
                <textarea name="body" id="txtBody" cols="30" rows="10"  class="form-control" placeholder="Enter body"></textarea>
            </div>
            
            <div class="form-group">
                <button type="submit" class="btn btn-primary">Publish</button>
            </div>

            @include('layouts.errors')
        </form>
    </div>
@endsection