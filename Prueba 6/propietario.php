<?php
    include_once 'db.php';
    class Propietario extends DB {
        function obtenerPropietarios() {
            $query = $this -> connect() -> query('SELECT * FROM propietario');
            return $query;
        }
    }
?>