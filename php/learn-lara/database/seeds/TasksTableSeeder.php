<?php

use Illuminate\Database\Seeder;

class TasksTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('tasks')->insert([[
            'body' => 'Go to office',
            'completed' => true,
            'created_at' => date('Y-m-d H:i:s')
        ], [
            'body' => 'Eat junk food',
            'completed' => true,
            'created_at' => date('Y-m-d H:i:s')
        ], [
            'body' => 'Drink tequila',
            'completed' => false,
            'created_at' => date('Y-m-d H:i:s')
        ], [
            'body' => 'Watch wolf of wall street movie',
            'completed' => false,
            'created_at' => date('Y-m-d H:i:s')
        ], [
            'body' => 'Sleep Zzzz...',
            'completed' => true,
            'created_at' => date('Y-m-d H:i:s')
        ]]);
    }
}
