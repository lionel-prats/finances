<?php 

namespace Model;

class Wallet extends ActiveRecord {

    protected static $tabla = 'wallets';
    protected static $columnasDB = ['id','wallet','date','id_user', 'id_account'];

    public $id;
    // private $customProperties = [];
    public $wallet = [];
    public $date;
    public $id_user;
    public $id_account;

    public function __construct($args = null) {
        $this->id = $args['id'] ?? null;
        if($args){
            foreach ($args as $key => $value) {
                if ($key !== 'date' && $key !== 'id_user' && $key !== 'id_account') {
                    // $this->customProperties[$key] = $value;
                    $this->wallet[$key] = $value;
                }
            }
            $this->wallet = serialize($this->wallet);
        }
        $this->date = $args['date'] ?? '';
        $this->id_user = $args['id_user'] ?? '';
        $this->id_account = $args['id_account'] ?? '';
        
    }

    /* public function __set($name, $value) {
        $this->customProperties[$name] = $value;
    }

    public function __get($name) {
        if (array_key_exists($name, $this->customProperties)) {
            return $this->customProperties[$name];
        }
        return 'null';
    } */
}

