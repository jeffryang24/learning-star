@foreach ($posts as $p)
<div class="blog-post">
    <a href="/posts/{{ $p->id }}"><h2 class="blog-post-title">{{ $p->title }}</h2></a>
    <p class="blog-post-meta">{{ $p->created_at->toFormattedDateString() }} by <a href="#">{{ $p->user->name }}</a></p>

    <p>{{ $p->body }}</p>
</div><!-- /.blog-post -->
@endforeach