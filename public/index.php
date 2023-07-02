<?php 

require_once __DIR__ . '/../includes/app.php';

use MVC\Router;
use Controllers\LoginController;
use Controllers\DashboardController;
$router = new Router();

// Login
$router->get("/", [LoginController::class, "login"]); 
$router->post("/", [LoginController::class, "login"]); 
$router->get("/logout", [LoginController::class, "logout"]); 

// Dashboard
$router->get("/dashboard", [DashboardController::class, "index"]);
$router->get("/crear-cuenta", [DashboardController::class, "crear_cuenta"]); 
$router->post("/crear-cuenta", [DashboardController::class, "crear_cuenta"]); 
$router->get("/cuenta", [DashboardController::class, "account"]);

// Comprueba y valida las rutas, que existan y les asigna las funciones del Controlador
$router->comprobarRutas();