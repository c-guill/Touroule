<?php
try{
    $origine = "";

    require $origine.'.mvc/controller/chargeClass.php';

    require $origine.'.mvc/controller/accueil.php';
}
catch (Error $e){
    echo $e;
}
?>