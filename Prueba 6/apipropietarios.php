<?php
include_once 'propietario.php';
class ApiPropietarios {
    function getAll() {
        $propietario = new Propietario();
        $propietarios = array();
        $propietarios["items"] = array();
        $respuesta = $propietario -> obtenerPropietarios();
        if($respuesta -> rowCount()) {
            while($row = $respuesta -> fetch(PDO::FETCH_ASSOC)) {
                $item = array(
                    'id' => $row['idpropietario'],
                    'nombre' => $row['nombre'],
                    'direccion' => $row['direccion'],
                    'telefono' => $row['telefono'],
                    'correo' => $row['correo'],
                    'comentarios' => $row['comentarios']
                );
                array_push($propietarios['items'], $item);
            }
            echo json_encode($propietarios);
        } else {
            echo json_encode(array('mensaje' => 'No hay elementos registrados'));
        }
    }
}
?>