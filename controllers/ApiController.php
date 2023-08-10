<?php 

namespace Controllers;

use Model\Account;

class ApiController {
    public static function show_user_accounts(){
        if($_SERVER['REQUEST_METHOD'] === 'POST'){
            $idUser = $_POST['user'];
            $currentAccounts = Account::belongsTo('id_user', $idUser);
            echo json_encode($currentAccounts);
        }
    }
}