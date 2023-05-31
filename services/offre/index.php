<?php
try{
    $origine = "../../";
    require $origine.'.mvc/controller/chargeClass.php';

    require $origine . '.mvc/controller/service_offre.php';
}
catch (Error $e){
    echo $e;
}
?>