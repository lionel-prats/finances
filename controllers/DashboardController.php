<?php 

namespace Controllers;

use MVC\Router;
use Model\Account;

class DashboardController {
    public static function index(Router $router) {
        isAuth();
        $id= $_SESSION['id'];
        $currentAccounts = Account::belongsTo('id_user', $id);
        $router->render("dashboard/index", [
            'titulo' => 'Cuentas',
            'currentAccounts' => $currentAccounts
        ]);
    }
    public static function crear_cuenta(Router $router) {
        isAuth();
        $alertas= [];
        if($_SERVER['REQUEST_METHOD'] === 'POST') {
            $account = new Account($_POST);
            $alertas = $account->validateAccount();
            if(empty($alertas)){
                $account->name = strtolower($account->name);
                $account->url = md5(uniqid());
                $account->id_user = $_SESSION['id'];
                $account->guardar();
                header('Location: /cuenta?id=' . $account->url);
            }
        }
        $router->render("dashboard/crear-cuenta", [
            'titulo' => 'Crear Cuenta',
            'alertas' => $alertas
        ]);
    }
    public static function account(Router $router) {
        debuguear('desde account');
        // isAuth();
        // $token = s($_GET['id']);
        // if(!$token)
        //     header('Location: /dashboard');
        // $proyecto = Proyecto::where('url', $token); 
        // if(!$proyecto)
        //     header('Location: /dashboard');
        // if($proyecto->propietarioId !== $_SESSION['id'])
        //     header('Location: /dashboard');
        // $router->render("dashboard/proyecto", [
        //     'titulo' => $proyecto->proyecto
        // ]);
    }
    public static function perfil(Router $router) {
        // isAuth();
        // $router->render("dashboard/perfil", [
        //     'titulo' => 'Perfil'
        // ]);
    }
}