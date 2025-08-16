@extends('layouts.app')

@section('title', 'Projects')

@section('content')
<h2 class="mb-4">My Projects</h2>
<div class="row mb-4 ">
    <div class="col-md-6 col-lg-4 mt-4 ">
        <div class="card shadow-sm mb-4 h-100">
            <div class="card-body">
                <h5 class="card-title">
                    <i class="bi bi-shield-lock-fill text-primary me-2"></i> E-KYC Portal
                </h5>
                <p class="card-text text-muted">
                    Developed a secure E-KYC Portal using Core PHP and MySQL, enabling customer verification through third-party APIs. The system validates customer documents (e.g., Aadhaar, PAN) in real time, streamlining the digital onboarding process and reducing manual verification efforts.
                </p>
            </div>
        </div>
    </div>

    <div class="col-md-6 col-lg-4 mt-4">
        <div class="card shadow-sm mb-4 h-100">
            <div class="card-body">
                <h5 class="card-title">
                    <i class="bi bi-calendar-check-fill text-success me-2"></i> Leave Management System
                </h5>
                <p class="card-text text-muted">
                    Built an Employee Leave Management System with Laravel (backend), MySQL (database), and React (frontend). The platform allows employees to apply for leaves, which are automatically routed to department managers. Implemented background jobs using Laravel Queues to send email notifications to managers upon leave submission, ensuring seamless and timely communication.
                </p>
            </div>
        </div>
    </div>

    <div class="col-md-6 col-lg-4 mt-4">
        <div class="card shadow-sm mb-4 h-100">
            <div class="card-body">
                <h5 class="card-title">
                    <i class="bi bi-people-fill text-warning me-2"></i> HR Management Web Application
                </h5>
                <p class="card-text text-muted">
                    Created a comprehensive HR Management Web Application using Laravel/PHP, MySQL, and JavaScript, empowering HR teams to manage employee records, upload documents, generate salary slips, and export reports in CSV format. Key features include full CRUD operations, role-based access control (RBAC), live search, and pagination for efficient data management.
                </p>
            </div>
        </div>
    </div>

    <div class="col-md-6 col-lg-4 mt-4">
        <div class="card shadow-sm mb-4 h-100">
            <div class="card-body">
                <h5 class="card-title">
                    <i class="bi bi-box-seam-fill text-danger me-2"></i> ONT Stock Management Portal
                </h5>
                <p class="card-text text-muted">
                    Built an ONT Stock Management Portal using Laravel and MySQL, designed to help network and IT teams manage ONT (Optical Network Terminal) inventory. The system tracks stock levels, logs movement history, manages assigned devices, and provides real-time updates on stock availability across multiple locations.
                </p>
            </div>
        </div>
    </div>
</div>
@endsection
