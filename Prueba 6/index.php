<?php
    include_once 'apipropietarios.php';
    $api = new ApiPropietarios();

    $api -> getAll();
?>