<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProductsController;
use App\Http\Controllers\ContactController;
use App\Http\Controllers\AboutController;
use App\Http\Controllers\CartController;
use App\Http\Controllers\CheckoutController;
use App\Http\Controllers\FeedbackController;

/* Admin Controllers */
use App\Http\Controllers\Admin\DashboardController;
use App\Http\Controllers\Admin\ProductController;
use App\Http\Controllers\Admin\OrderController;
use App\Http\Controllers\Admin\CustomerController;
use App\Http\Controllers\Admin\UserController;

/*
|--------------------------------------------------------------------------
| PUBLIC PAGES
|--------------------------------------------------------------------------
*/
Route::get('/', [ProductsController::class, 'index'])->name('home');
Route::get('/products', [ProductsController::class, 'allProducts'])->name('products.index');
Route::get('/products/{id}', [ProductsController::class, 'show'])->name('products.show');

Route::get('/contact', [ContactController::class, 'index'])->name('contact');
Route::get('/about', [AboutController::class, 'index'])->name('about');

/*
|--------------------------------------------------------------------------
| AUTHENTICATED USER ROUTES
|--------------------------------------------------------------------------
*/
Route::middleware(['auth:sanctum', config('jetstream.auth_session')])->group(function () {

    // Profile
    Route::view('/user/profile', 'profile.show')->name('profile.show');

    // Cart
    Route::get('/cart', [CartController::class, 'index'])->name('cart.index');
    Route::post('/cart/add/{id}', [CartController::class, 'add'])->name('cart.add');
    Route::post('/cart/update', [CartController::class, 'update'])->name('cart.update');
    Route::delete('/cart/remove/{key}', [CartController::class, 'remove'])
        ->where('key', '.*')
        ->name('cart.remove');

    // Checkout
    Route::get('/checkout', [CheckoutController::class, 'index'])->name('checkout.index');
    Route::post('/checkout/process', [CheckoutController::class, 'store'])->name('checkout.store');
    Route::get('/checkout/success/{orderId}', [CheckoutController::class, 'success'])
        ->name('checkout.success');

    // Feedback
    Route::post('/feedback', [FeedbackController::class, 'store'])->name('feedback.store');
});

/*
|--------------------------------------------------------------------------
| ADMIN ROUTES (DASHBOARD + MANAGEMENT)
|--------------------------------------------------------------------------
*/
Route::middleware([
    'auth:sanctum',
    config('jetstream.auth_session'),
    'verified',
    'admin'
])->group(function () {

    // Dashboard
    Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard');

    Route::prefix('admin')->name('admin.')->group(function () {

        // Products
        Route::get('/products', [ProductController::class, 'index'])->name('products.index');
        Route::get('/products/create', [ProductController::class, 'create'])->name('products.create');
        Route::get('/products/{id}/edit', [ProductController::class, 'edit'])->name('products.edit');
        Route::post('/products', [ProductController::class, 'store'])->name('products.store');
        Route::put('/products/{id}', [ProductController::class, 'update'])->name('products.update');
        Route::delete('/products/{id}', [ProductController::class, 'destroy'])->name('products.destroy');

        // Orders
        Route::get('/orders', [OrderController::class, 'index'])->name('orders.index');
        Route::post('/orders/{id}/accept', [OrderController::class, 'accept'])->name('orders.accept');
        Route::delete('/orders/{id}', [OrderController::class, 'destroy'])->name('orders.destroy');

        // Customers
        Route::get('/customers', [CustomerController::class, 'index'])->name('customers.index');
        Route::delete('/customers/{id}', [CustomerController::class, 'destroy'])->name('customers.destroy');

        // Users
        Route::get('/users', [UserController::class, 'index'])->name('users.index');
        Route::post('/users/{id}/toggle-type', [UserController::class, 'toggleType'])->name('users.toggleType');
    });
});