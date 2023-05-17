<?php
    function StartSession(){
        session_set_cookie_params(0);
        session_start();        
        $_SESSION['email'] = "";
        header("location: /chats/index.php");    
    }
    StartSession();
?>