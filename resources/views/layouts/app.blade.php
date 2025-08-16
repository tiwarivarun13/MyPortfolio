<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Portfolio - @yield('title')</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        html, body {
            height: 100%; /* Full height */
            margin: 0;
        }
        body {
            display: flex;
            flex-direction: column; /* Stack items vertically */
            background: #f9f9f9;
        }
        .navbar {
            background: #6c5ce7;
        }
        .navbar-brand, .nav-link, .btn-back {
            color: #fff !important;
        }
        .card {
            transition: all 0.3s;
        }
        .card:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 20px rgba(0,0,0,0.1);
        }
        .content-wrapper {
            flex: 1; /* Take up remaining space */
        }
        footer {
            padding: 15px;
            background: #6c5ce7;
            color: #fff;
            text-align: center;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg shadow">
        <div class="container">
            <a class="navbar-brand fw-bold" href="{{ url('/') }}">My Portfolio</a>
            <div>
                <a href="{{ url('/projects') }}" class="nav-link d-inline ms-3">Projects</a>
                <a href="{{ url('/resume') }}" class="nav-link d-inline ms-3">Resume</a>
                <a href="{{ url('/contact') }}" class="nav-link d-inline ms-3">My Contact</a>
            </div>
        </div>
    </nav>

    <!-- Back Button -->
    <div class="container mt-3">
        <a href="javascript:history.back()" class="btn btn-sm btn-back btn-primary mb-3">⬅ Back</a>
    </div>

    <!-- Page Content -->
    <div class="container content-wrapper">
        @yield('content')
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; {{ date('Y') }} My Portfolio | Built with Laravel</p>
    </footer>
</body>
</html>
