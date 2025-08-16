@extends('layouts.app')

@section('title', 'Resume')

@section('content')
<h2 class="mb-4">My Resume</h2>
<p class="lead">Download my resume below:</p>
<a href="{{ asset('BARUN TIWARI_RESUME(PHP).pdf') }}" class="btn btn-success btn-lg" download>📄 Download Resume</a>
@endsection
