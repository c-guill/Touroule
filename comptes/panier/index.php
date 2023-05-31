<?php
try{
    $origine = "../../";
    require $origine.'.mvc/controller/chargeClass.php';

    require $origine . '.mvc/controller/panier.php';
}
catch (Exception $e){
    echo $e;
}
?>