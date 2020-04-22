<?php

use Illuminate\Database\Seeder;

class CommentsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('comments')->insert([
            [
                'post_id' => 3,
                'body' => 'Wow!! I hope it will crash soon!!',
                'user_id' => 1,
                'created_at' => date('Y-m-d H:i:s')
            ], [
                'post_id' => 3,
                'body' => 'FUD... FUD everywhere!!!',
                'user_id' => 1,
                'created_at' => date('Y-m-d H:i:s')
            ], [
                'post_id' => 2,
                'body' => 'Fedora will beat ubuntu soon!',
                'user_id' => 1,
                'created_at' => date('Y-m-d H:i:s')
            ]
        ]);
    }
}
