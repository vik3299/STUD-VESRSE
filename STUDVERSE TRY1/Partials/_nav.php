<?php 
    require_once $_SERVER['DOCUMENT_ROOT'].'/PHPAlumniProject/DatabaseConnection/Connections.php';
?>

<div class="thetop"></div>
<header class="site-header">
    <div class="top-header">
        <div class="container">
            <div class="top-header-left">
                <div class="top-header-block">
                    <a href="mailto:bmiit.utu.ac.in" itemprop="email"><i class="fas fa-envelope"></i> bmiit.utu.ac.in</a>
                </div>
                <div class="top-header-block">
                    <a href="tel:+91 2622 290562" itemprop="telephone"><i class="fas fa-phone"></i> +91 2622 290562</a>
                </div>
            </div>
            <div class="top-header-right">
                <!-- <div class="social-block">
                        <ul class="social-list">
                            <li><a href=""><i class="fab fa-viber"></i></a></li>
                            <li><a href=""><i class="fab fa-google-plus-g"></i></a></li>
                            <li><a href=""><i class="fab fa-facebook-square"></i></a></li>
                            <li><a href=""><i class="fab fa-facebook-messenger"></i></a></li>
                            <li><a href=""><i class="fab fa-twitter"></i></a></li>
                            <li><a href=""><i class="fab fa-skype"></i></a></li>
                        </ul>
                    </div> -->
                <div class="login-block">
                    <a href="LogoutSession.php">LogOut</a>
                    <!-- <a href="">Register</a> -->
                </div>
            </div>
        </div>
    </div>
    <!-- Top header Close -->
    <div class="main-header" style="background-color: #fff;">
        <div class="container" style="background-color: #fff;">
            <div class="logo-wrap" itemprop="logo">
                <!-- <img src="HomePage_images/site-logo.jpg" alt="Logo Image"> -->
                <!-- <h1>Education</h1> -->
            </div>
            <div class="nav-wrap">
                <nav class="nav-desktop">
                    <ul class="menu-list">
                        <li><a href="homePage.php">Home</a></li>

                        <li class="menu-parent">Create Post
                            <ul class="sub-menu">
                                <li><a href="CreatePost.php">Create Post</a></li>
                                <li><a href="CreateEvent.php">Create Event</a></li>
                                <li><a href="CreateJob.php">Create Jobs</a></li>
                            </ul>
                        </li>                         
                        <li><a href="Posts.php">Posts</a></li>
                        <li><a href="Jobs.php">Jobs</a></li>
                        <li><a href="Events.php">Events</a></li>
                        <li><a href="OriginalChat.php">Chats(
                            <?php
                                $query = "select count(personal_chat_id) as unread_chats from tbl_personal_chats where (user_1 = ".$_SESSION['userid']." && read_user_1 = 1)||(user_2 = ".$_SESSION['userid']." && read_user_2 = 1) and is_enabled = 'y'";
                                $connection = ConnectToDB();
                                $result = mysqli_query($connection,$query);
                                $count = 0;
                                foreach($result as $r)
                                    $count = $r['unread_chats'];
                                echo $count;
                                CloseConnection($connection);
                            ?>
                            
                            
                            )</a></li>
                        <li><a href="profile.php">Profile</a></li>
                    </ul>
                </nav>
                <div id="bar">
                    <i class="fas fa-bars"></i>
                </div>
                <div id="close">
                    <i class="fas fa-times"></i>
                </div>
            </div>
        </div>
    </div>
</header>