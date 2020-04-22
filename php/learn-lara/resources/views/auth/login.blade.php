@extends('layouts.master')

@section('content')
    <div class="col-md-8 blog-main">
        <h2>Login</h2>
        <form action="/login" method="post">
            {{ csrf_field() }}

            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" name="email" id="txtEmail" placeholder="Input your email here" class="form-control" required>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" name="password" id="txtPassword" placeholder="Input your password here" class="form-control" required>
            </div>

            <div class="form-group">
                <button type="submit" class="btn btn-primary">Login</button>
            </div>

            @include('layouts.errors')
        </form>
    </div>
@endsection