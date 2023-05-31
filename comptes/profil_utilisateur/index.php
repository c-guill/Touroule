<?php
try{
    $origine = "../../";
    require $origine.'.mvc/controller/chargeClass.php';

    require $origine . '.mvc/controller/profil_utilisateur.php';
}
catch (Error $e){
    echo $e;
}
?>