@extends('layouts.master')

@section('content')
    <div class="col-md-8">
        <form method="POST" action="/logins">
            {{ csrf_field() }}

            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" name="email" id="email" class="form-control">
            </div>

            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" name="password" id="password" class="form-control">
            </div>

            <div class="form-group">
                <button type="submit" class="btn btn-primary">Register</button>
            </div>

            <div class="form-group">
                @include('layouts.error')
            </div>
        </form>
    </div>
@endsection