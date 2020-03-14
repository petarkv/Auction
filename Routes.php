<?php
    //use App\Core\Route;

    return[
        App\Core\Route::get('|^user/register/?$|', 'Main', 'getRegister'),
        App\Core\Route::post('|^user/register/?$|', 'Main', 'postRegister'),
        App\Core\Route::get('|^user/login/?$|', 'Main', 'getLogin'),
        App\Core\Route::post('|^user/login/?$|', 'Main', 'postLogin'),

        

        App\Core\Route::get('|^category/([0-9]+)/?$|', 'Category', 'show'),
        /*Route::get('|^category/([0-9]+)/delete/?$|','Category','delete'),*/

        App\Core\Route::get('|^auction/([0-9]+)/?$|', 'Auction', 'show'),

        # API rute:
        App\Core\Route::get('|^api/auction/([0-9]+)/?$|', 'ApiAuction', 'show'),
        App\Core\Route::get('|^api/bookmarks/?$|', 'ApiBookmark', 'getBookmarks'),
        App\Core\Route::get('|^api/bookmarks/add/([0-9]+)/?$|', 'ApiBookmark', 'addBookmark'),
        App\Core\Route::get('|^api/bookmarks/clear/?$|', 'ApiBookmark', 'clear'),

        # User Role Route:
        App\Core\Route::get('|^user/profile/?$|', 'UserDashboard', 'index'),

        App\Core\Route::get('|^user/categories/?$|', 'UserCategoryManagement', 'categories'),
        App\Core\Route::get('|^user/categories/edit/([0-9]+)/?$|', 'UserCategoryManagement', 'getEdit'),
        App\Core\Route::post('|^user/categories/edit/([0-9]+)/?$|', 'UserCategoryManagement', 'postEdit'),

        App\Core\Route::get('|^user/categories/add/?$|', 'UserCategoryManagement', 'getAdd'),
        App\Core\Route::post('|^user/categories/add/?$|', 'UserCategoryManagement', 'postAdd'),

        # Home Route:
        App\Core\Route::any('|^.*$|', 'Main', 'home')

        
    ];