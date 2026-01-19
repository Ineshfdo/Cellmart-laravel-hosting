<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\ProductController;
use App\Http\Controllers\Api\UserController;
use App\Http\Controllers\Api\OrderController;

/*
|--------------------------------------------------------------------------
| PUBLIC API ROUTES
|--------------------------------------------------------------------------
*/
Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);
Route::get('/products', [ProductController::class, 'getAll']);

/*
|--------------------------------------------------------------------------
| PROTECTED API ROUTES (SANCTUM)
|--------------------------------------------------------------------------
*/
Route::middleware('auth:sanctum')->group(function () {

    Route::get('/user', [UserController::class, 'me']);

    // Products
    Route::get('/products/manage', [ProductController::class, 'index']);
    Route::post('/products', [ProductController::class, 'store']);
    Route::put('/products/{id}', [ProductController::class, 'update']);
    Route::delete('/products/{id}', [ProductController::class, 'destroy']);

    // Users (Admin via API if needed)
    Route::delete('/users/{id}', [UserController::class, 'destroy']);

    // Orders
    Route::post('/orders', [OrderController::class, 'store']);
    Route::delete('/orders/{id}', [OrderController::class, 'destroy']);
});