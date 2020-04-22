<?php

use Illuminate\Database\Seeder;

class PostsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('posts')->insert([
            [
                'title' => 'Laravel 5.6 just released!',
                'body' => 'Let\'s see the new laravel on laravel.com',
                'user_id' => 1,
                'created_at' => date('Y-m-d H:i:s')
            ], [
                'title' => 'Fedora 27 such wow so powerfull',
                'body' => 'Fedora to de moon!!!',
                'user_id' => 1,
                'created_at' => date('Y-m-d H:i:s')
            ], [
                'title' => 'Bitcoin will crash soon',
                'body' => 'Kobayashi just sold 400 billion worth in bitcoin last day cause bitcoin\'s price suffers to 6000 USD',
                'user_id' => 1,
                'created_at' => date('Y-m-d H:i:s')
            ], [
                'title' => 'Dogecoin to the moon?',
                'body' => 'Let\'s see doge!! Such wow!!',
                'user_id' => 1,
                'created_at' => date('Y-m-d H:i:s')
            ]
        ]);
    }
}
