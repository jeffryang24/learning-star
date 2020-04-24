@extends('layouts.master')

@section('content')
    <form method="POST" action="/post">
        {{ csrf_field() }}

        <div class="form-group">
            <label for="title">Title</label>
            <input type="text" class="form-control" id="title" name="title">
        </div>

        <div class="form-group">
            <label for="body">Body</label>
            <textarea class="form-control" id="body" name="body" rows="3"></textarea>
        </div>

        <div class="form-group">
            @include('layouts.error')
        </div>

        <button type="submit" class="btn btn-primary">Publish</button>
    </form>
@endsection