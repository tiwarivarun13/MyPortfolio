<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProjectController;

Route::get('/', function () {
    return view('home');
})->name('home');

Route::get('/about', function () {
    return view('about');
})->name('about');

Route::get('/projects',function(){
    return view('project');
})->name('projects');


Route::get('/contact', function () {
    return view('contact');
})->name('contact');

Route::get('/resume', function(){
    return view('resume');
});
