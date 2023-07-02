<?php

namespace Model;

class Account extends ActiveRecord {
    protected static $tabla = 'accounts';
    protected static $columnasDB = ['id','name','url','id_user'];

    public $id;
    public $name;
    public $url;
    public $id_user;

    public function __construct($args = [])
    {
        $this->id = $args['id'] ?? null;
        $this->name = $args['name'] ?? '';
        $this->url = $args['url'] ?? '';
        $this->id_user = $args['id_user'] ?? '';
    }

    public function validateAccount(){
        if(!$this->name)
            self::$alertas['error'][] = 'El nombre de la cuenta es obligatorio';
        return self::$alertas;
    }
}