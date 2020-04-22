<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Tasks</title>
</head>
<body>
    <ul>
        @foreach ($tasks as $t)
            <li><a href="/tasks/{{$t->id}}">{{$t->body}}</a></li>
        @endforeach
    </ul>
</body>
</html>