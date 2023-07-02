<?php

namespace Model;

class User extends ActiveRecord {
    protected static $tabla = 'users';
    protected static $columnasDB = ['id','nickname','email','password','token','confirmed'];

    public $id;
    public $nickname;
    public $email;
    public $password;
    public $token;
    public $confirmed;

    public function __construct($args = [])
    {
        $this->id = $args['id'] ?? null;
        $this->nickname = $args['nickname'] ?? '';
        $this->email = $args['email'] ?? '';
        $this->password = $args['password'] ?? '';
        $this->token = $args['token'] ?? '';
        $this->confirmed = $args['confirmed'] ?? '0';
    }
    public function validarLogin() {
        if(!$this->email || !filter_var($this->email, FILTER_VALIDATE_EMAIL)) {
            self::$alertas["error"][] = "El formato del email ingresado es incorrecto";
        } elseif( !$this->password || strlen($this->password) < 6 ) {
            self::$alertas["error"][] = "Credenciales inválidas";
            $this->email = '';
        } 
        return self::$alertas;
    }
    // validador formulario de creacion de cuenta
    public function validarNuevaCuenta() {
        if(!$this->nombre) {
            self::$alertas["error"][] = "El nombre es obligatorio"; 
        }
        if(!$this->email) {
            self::$alertas["error"][] = "El email es obligatorio";
        } elseif(!filter_var($this->email, FILTER_VALIDATE_EMAIL)) {
            self::$alertas["error"][] = "El email ingresado no es válido";
        }
        if((!$this->password || strlen($this->password) < 6) || (!$this->password2 || strlen($this->password2) < 6)) {
            self::$alertas["error"][] = "El password es obligatorio para ambos campos, de una longitud mínima de 6 caracteres y deben coincidir";
        } elseif($this->password !== $this->password2) {
            self::$alertas["error"][] = "Los passwords ingresados no coinciden";
        }
        return self::$alertas;
    }
    
    public function validarEmail() {
        if(!$this->email) {
            self::$alertas["error"][] = "El email es obligatorio";
        } elseif(!filter_var($this->email, FILTER_VALIDATE_EMAIL)) {
            self::$alertas["error"][] = "El email ingresado no es válido";
        }
        return self::$alertas; 
    }
    public function validarPassword() {
        if( (!$this->password || strlen($this->password) < 6) || (!$this->password2 || strlen($this->password2) < 6) ) {
            self::$alertas["error"][] = "El password es obligatorio para ambos campos, de una longitud mínima de 6 caracteres y deben coincidir";
        } elseif($this->password !== $this->password2) {
            self::$alertas["error"][] = "Los passwords ingresados no coinciden";
        }
        return self::$alertas; 
    }
    // hashear password
    public function hashPassword() {
        $this->password = password_hash($this->password, PASSWORD_BCRYPT);
        return;
    }
    // token para creacion de cuenta
    public function creartoken() {
        $this->token = md5(uniqid());
        return;
    }
    public function comprobarPassword($password) { 
        $resultado = password_verify($password, $this->password);
        return $resultado;
    }
}