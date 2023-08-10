<?php 

namespace Controllers;

use MVC\Router;
use Model\Account;
use Model\Wallet;

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
    public static function wallet(Router $router) {
        isAuth();
        // billetera 30/06/2023
        // $args = array(
        //     'id_user' => 1,
        //     'id_account' => 3,
        //     'date' => '2023-06-30',
        //     'billetera' => '6750',
        //     'caja_chica' => '890',
        //     'caja_grande' => '15500',
        //     'banco_ciudad' => '1815.01',
        //     'banco_frances' => '100.3',
        //     'didi' => '3758.69',
        //     'mercado_pago' => '65962.31'
        // );
        // billetera 01/07/2023
        // $args = array(
        //     'id_user' => 1,
        //     'id_account' => 3,
        //     'date' => '2023-07-01',
        //     'billetera' => '4750',
        //     'caja_chica' => '890',
        //     'caja_grande' => '15500',
        //     'banco_ciudad' => '1815.01',
        //     'banco_frances' => '100.3',
        //     'didi' => '3441.93',
        //     'mercado_pago' => '41214.06'
        // );
        // billetera 14/07/2023
        $args = array(
            'id_user' => 1,
            'id_account' => 3,
            'date' => '2023-07-31',
            'billetera' => '5000',
            'caja_chica' => '640',
            'caja_grande' => '12800',
            'banco_ciudad' => '1.12',
            'banco_frances' => '100',
            'didi' => '0',
            'inversion' => '120000',
            'mercado_pago' => '73386.59',
            'reserva' => '5500'
        );
        $wallet = new Wallet($args);

        // debuguear(strlen('a:7:{s:9:"billetera";s:4:"4750";s:10:"caja_chica";s:3:"890";s:11:"caja_grande";s:5:"15500";s:12:"banco_ciudad";s:7:"1815.01";s:13:"banco_frances";s:5:"100.3";s:4:"didi";s:7:"3441.93";s:12:"mercado_pago";s:8:"41214.06";}'));
        $insert = 0;
        try {
            $wallet->guardar();
            $insert = 1; 
        } catch (\Throwable $th) {
            //debuguear("no se pudo");
            $insert = 2; 
        }
        // USE finances;
        // ALTER TABLE wallets AUTO_INCREMENT = 1;

        $router->render("dashboard/wallet", [
            'titulo' => 'Billetera',
            'wallet' => $wallet,
            'insert' => $insert
        ]);
    }
    public static function show_wallet(Router $router) {
        $wallet = Wallet::where('id_user', $_SESSION['id']);

        debuguear(unserialize($wallet->wallet));

        debuguear($wallet);
        
        $router->render("dashboard/wallet", [
            'titulo' => 'Billetera',
            'wallet' => $wallet

        ]);
        $router->render("dashboard/show-wallet", [
            'titulo' => 'Ver Billetera',
            'wallet' => $wallet
        ]);
    }
}