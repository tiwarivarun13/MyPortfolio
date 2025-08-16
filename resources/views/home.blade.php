@extends('layouts.app')

@section('title', 'Home')

@section('content')
<div class="text-center mt-5">
    <h1 class="fw-bold">Hi, I'm Barun Tiwari 👋</h1>
    <p class="lead text-muted">A passionate Laravel Developer building modern web apps.</p>
    <a href="{{ url('/projects') }}" class="btn btn-lg btn-outline-primary mt-3">View My Projects</a>
</div>
@endsection
