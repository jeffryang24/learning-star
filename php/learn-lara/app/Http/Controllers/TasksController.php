<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Task;

class TasksController extends Controller
{
    public function index() {
        //$tasks = DB::table('tasks')->latest()->get();

        $tasks = Task::all();

        return view('tasks.index', compact('tasks'));
    }

    // conventional way
    // public function show($id) {
    //     //$task = DB::table('tasks')->find($id);

    //     $task = Task::find($id);

    //     return view('tasks.show', compact('task'));
    // }

    public function show(Task $task) {
        //$task = DB::table('tasks')->find($id);

        return view('tasks.show', compact('task'));
    }
}
