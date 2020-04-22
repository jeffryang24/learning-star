@extends('layouts.master')

@section('content')
    <div class="col-md-8 blog-main">
        <h2>Register</h2>
        <form action="/register" method="post">
            {{ csrf_field() }}

            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" name="name" id="txtName" placeholder="Input your name here" class="form-control" required>
            </div>

            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" name="email" id="txtEmail" placeholder="Input your email here" class="form-control" required>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" name="password" id="txtPassword" placeholder="Input your password here" class="form-control" required>
            </div>

            <div class="form-group">
                    <label for="password_confirmation">Password Confirmation</label>
                    <input type="password" name="password_confirmation" id="txtPasswordConfirmation" placeholder="Input your password here" class="form-control" required>
                </div>

            <div class="form-group">
                <button type="submit" class="btn btn-primary">Register</button>
            </div>

            @include('layouts.errors')
        </form>
    </div>
@endsection