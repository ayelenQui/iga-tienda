<?php

use CodeIgniter\Router\RouteCollection;

/**
 * @var RouteCollection $routes
 */
$routes->get('/', 'Home::index');
$routes->group("api", static function($routes) {
    $routes->get("cursos", "CursosController::index");
    $routes->get("cursos/(:num)", "CursosController::show/$1");
});
