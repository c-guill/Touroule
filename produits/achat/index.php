<?php
try {
    $origine = "../../";
    require $origine . '.mvc/controller/chargeClass.php';

    require $origine . '.mvc/controller/achat.php';
}
catch (Error $e){
    echo $e;
}

?>