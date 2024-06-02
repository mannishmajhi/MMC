<?php

function authorize($role) {
    require_once 'sessionManager.php';
    initSessionWithTimer();

    if (!isset($_SESSION['user_name']) && ($_SESSION['user_role'] != $role)) {
        $_SESSION['redirect_target'] = $_SERVER['REQUEST_URI'];
        header('Location: ../index.php');
        exit();
    }
}

?>