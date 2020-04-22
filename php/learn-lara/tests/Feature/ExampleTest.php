<?php

namespace Tests\Feature;

use Tests\TestCase;
use Illuminate\Foundation\Testing\RefreshDatabase;
use App\Post;

class ExampleTest extends TestCase
{
    use RefreshDatabase;
    /**
     * A basic test example.
     *
     * @return void
     */
    public function testBasicTest()
    {
        $response = $this->get('/');

        $response->assertStatus(200);
    }

    public function testTitle() {
        $this->get('/posts')->assertSee('From the Firehose');
    }

    public function testArchive() {
        $first = factory(Post::class)->create();
        $second = factory(Post::class)->create([
            'created_at' => \Carbon\Carbon::now()->subMonth()
        ]);

        $posts = Post::archives();

        //$this->assertCount(2, $posts);

        $this->assertEquals([
            [
                'year' => (string)$first->created_at->format('Y'),
                'month' => (string)$first->created_at->format('F'),
                'total_post' => 1
            ],

            [
                'year' => $second->created_at->format('Y'),
                'month' => $second->created_at->format('F'),
                'total_post' => 1
            ],
        ], $posts);
    }
}
