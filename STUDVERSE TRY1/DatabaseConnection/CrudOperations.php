<?php 
    //require $_SERVER['DOCUMENT_ROOT'].'/chats/SessionManagement/SessionCheck.php'; 
    //SessionCheck();
    //echo "done";
    require_once $_SERVER['DOCUMENT_ROOT'].'/chats/error.php';
    require 'Connections.php';

    function DeleteOTPFromTable($otpid)
    {
        try
        {
            $connection = ConnectToDB();
            $query = "delete from tbl_otp_information where OTPID = $otpid";
            mysqli_query($connection,$query); 
            CloseConnection($Connection);
        }
        catch(Exception $error)
        {

        }
    }

    function InsertIntoPostTable($Title,$Description)
    {
        if(!PHP_SESSION_ACTIVE)
            session_start();
        if(isset($_SESSION['userid']) && !empty($_SESSION['userid']))
        {
            if(empty($Title))
                error("Post title was empty",$_SERVER['DOCUMENT_ROOT']."/chats/CreatePost.php");
            if(empty($Description))
                error("Post Description was empty",$_SERVER['DOCUMENT_ROOT']."/chats/CreatePost.php");
            $userID = $_SESSION['userid'];
            $connection = ConnectToDB();
            $query = "insert into tbl_community_post(post_title,content,user_id,created_by,modified_by)values('$Title','$Description',$userID,$userID,$userID)";
            echo $query;
            if(mysqli_query($connection,$query))
            {
                
                $postID = mysqli_insert_id($connection);
                if(isset($_FILES['file']) && !empty($_FILES['file']))
                {
                    echo "file detected";
                    if(!isset($_SESSION['userid']) || !isset($_SESSION['email']) || empty($_SESSION['userid']) || empty($_SESSION['email']))
                        header("Location: ".$_SERVER['DOCUMENT_ROOT']."/chats/Login.php");
                        
                    $userID = $_SESSION['userid'];
                    $en_no = $_SESSION['email'];
                    $path = $_SERVER['DOCUMENT_ROOT']."/chats/Uploads/$userID-User-$en_no/".$_FILES['file']['name'];
                    $Query = "update tbl_community_post set post_image = '$path' where community_post_id = $postID";
                    mysqli_query($connection,$Query);
                    moveUploadedImageToUserDirectory($userID."-User-".$en_no);
                }                       
                header("location: homePage.php");
                CloseConnection($connection);
            }
            CloseConnection($connection);
        }  
        else
            error("not properly looged in",$_SERVER['DOCUMENT_ROOT']."/chats/Login.php");
    }

    function InsertIntoEventParticipationTable($EventID)
    {
        if(!PHP_SESSION_ACTIVE)
            session_start();
        if(isset($_SESSION['userid']) && !empty($_SESSION['userid']))
        {
            if(empty($EventID))
                error("EventID empty was empty",$_SERVER['DOCUMENT_ROOT']."/chats/CreatePost.php");
            $userID = $_SESSION['userid'];
            $connection = ConnectToDB();

            $query = "select event_participation_id from tbl_event_participation where participant_id = $userID and event_id = $EventID";
            $result = mysqli_query($connection,$query);
            if(mysqli_num_rows($result) >= 1){
                error("already participated","homePage.php");
            }
            else
            {
                $query = "insert into tbl_event_participation(event_id,participant_id,created_by,modified_by)values($EventID,$userID,$userID,$userID)";
                echo $query;
                if(mysqli_query($connection,$query))
                {
                    error("not participated ","homePage.php");
                }
                CloseConnection($connection);
                header("location: Events.php");
            }
        }  
        else
            error("not properly looged in",$_SERVER['DOCUMENT_ROOT']."/chats/Login.php");
    }

    function InsertIntoJobApplyTable($JobID)
    {
        if(!PHP_SESSION_ACTIVE)
            session_start();
        if(isset($_SESSION['userid']) && !empty($_SESSION['userid']))
        {
            if(empty($JobID))
                error("JobID empty was empty",$_SERVER['DOCUMENT_ROOT']."/chats/CreatePost.php");
            $userID = $_SESSION['userid'];
            $connection = ConnectToDB();

            $query = "select job_apply_id from tbl_job_apply where applicant_id = $userID and job_alert_id = $JobID and is_enabled = 'y'";
            $result = mysqli_query($connection,$query);
            if(mysqli_num_rows($result) >= 1){
                error("already applied","homePage.php");
            }
            else
            {
                $query = "insert into tbl_job_apply(job_alert_id,applicant_id,created_by,modified_by)values($JobID,$userID,$userID,$userID)";
                echo $query;                
                if(mysqli_query($connection,$query))
                    header("location: profile.php");
                CloseConnection($connection);
            }
        }  
        else
            error("not properly looged in",$_SERVER['DOCUMENT_ROOT']."/chats/Login.php"); 
    }

    function InsertIntoEventTable($EventTitle,$EventDescription,$OrganizerName,$EventTime,$Venue,$Contact1,$Contact2,$Email1,$Email2)
    {
        if(!PHP_SESSION_ACTIVE)
            session_start();
        if(isset($_SESSION['userid']) && !empty($_SESSION['userid']))
        {
            $userID = $_SESSION['userid'];
            $connection = ConnectToDB();
            $query = "insert into tbl_event(
                        event_name,
                        event_description,
                        organizer_name,
                        venue,
                        email_address_1,
                        email_address_2,
                        contact_number_1,
                        contact_number_2,
                        event_time,
                        organizing_member_id,
                        created_by,
                        modified_by)
            values(
                '$EventTitle',
                '$EventDescription',
                '$OrganizerName',
                '$Venue',
            '$Email1','$Email2','$Contact1','$Contact2','$EventTime',$userID,$userID,$userID)";   
            echo "<br><br><br>".$query."<br><br><br>";         
            if(mysqli_query($connection,$query))
            {
                $EventID = mysqli_insert_id($connection);
                if(isset($_FILES['file']) && !empty($_FILES['file']))
                {
                    if(!isset($_SESSION['userid']) || !isset($_SESSION['email']) || empty($_SESSION['userid']) || empty($_SESSION['email']))
                        header("Location: ".$_SERVER['DOCUMENT_ROOT']."/chats/Login.php");
                        
                    $userID = $_SESSION['userid'];
                    $en_no = $_SESSION['email'];
                    $path = $_SERVER['DOCUMENT_ROOT']."/chats/Uploads/$userID-User-$en_no/".$_FILES['file']['name'];
                    $Query = "update tbl_event set Event_Photo = '$path' where event_id  = $EventID";
                    mysqli_query($connection,$Query);
                    moveUploadedImageToUserDirectory($userID."-User-".$en_no);
                }           
                                        
                CloseConnection($connection);
                header("location: homePage.php");
            }
            else
                error("server error please retry",$_SERVER['DOCUMENT_ROOT']."/chats/profile.php/homePage.php");
            CloseConnection($connection);
        }
        else
            error("not properly looged in",$_SERVER['DOCUMENT_ROOT']."/chats/Login.php");
    }


    function InsertIntoJobAlertTable($jobAlertTitle,$jobAlertDescription,$company,$location,$technology,$designation,$vacancies,$package,$experience,$cnum,$email)    
    {  
        if(!PHP_SESSION_ACTIVE)
            session_start();
        if(isset($_SESSION['userid']) && !empty($_SESSION['userid']))
        {
            $userID = $_SESSION['userid'];
            $connection = ConnectToDB();
            $query = "insert into tbl_job_alert
            (job_alert_title,job_description,company_name,
            company_email,company_contact_number,vacancies,
            experience,package,technology_id,place_of_work_id,job_title_id,
            created_by,modified_by)
            values('$jobAlertTitle','$jobAlertDescription','$company',
            '$email','$cnum',$vacancies,$experience,$package,$technology,$location,$designation,$userID,$userID)";

            if(mysqli_query($connection,$query))
            {
                $jobID = mysqli_insert_id($connection);
                // if(isset($_FILES['file']) && !empty($_FILES['file']))
                // {
                //     if(!isset($_SESSION['userid']) || !isset($_SESSION['email']) || empty($_SESSION['userid']) || empty($_SESSION['email']))
                //         header("Location: ".$_SERVER['DOCUMENT_ROOT']."/chats/Login.php");
                        
                //     $userID = $_SESSION['userid'];
                //     $en_no = $_SESSION['email'];
                //     $path = $_SERVER['DOCUMENT_ROOT']."/chats/Uploads/$userID-User-$en_no/".$_FILES['file']['name'];
                //     $Query = "update tbl_job_alert set attached_photo_url = '$path' where job_alert_id  = $jobID";
                //     mysqli_query($connection,$Query);
                //     moveUploadedImageToUserDirectory($userID."-User-".$en_no);
                // }           
                                        
                CloseConnection($connection);
                header("location: homePage.php");
            }
            CloseConnection($connection);
        }
        else
            error("not properly looged in",$_SERVER['DOCUMENT_ROOT']."/chats/Login.php");
    }

    function InsertIntoUserTable($username,$en_no,$dob,$gender,$Current_Company,$contact_num,$email_id,$pass,$job,$work,$batch)
    {
        try
        {
            $userID = 0;
            // we take a guess that every detail passed to this function is correct
            $connection = ConnectToDB();

            $Query = "select * from tbl_user where enrollment_number = '$en_no'";
            $result = mysqli_query($connection,$Query);
            
            if(mysqli_num_rows($result) >= 1)
            {
                CloseConnection($connection);
                error("enrollment number already exists","index.php");
                return 0;
            }
            else
            {
                $hashedpass = hash("sha256",$pass);
                $Query = "insert into tbl_user
                        (user_name,enrollment_number,date_of_birth,
                        gender,profile_photo_path,
                        current_company_working_in,contact_number,
                        email_id,password,job_title_id,
                        place_of_work_id,batch_id,Created_by,Modified_by,is_enabled)
                        values('$username','$en_no','$dob','$gender','','$Current_Company','$contact_num','$email_id','$hashedpass',$job,$work,$batch,2,2,'n')";
                echo "<br> $Query <br>";
                if(mysqli_query($connection,$Query))
                {
                    session_start();
                    $userID = mysqli_insert_id($connection);           
                    $_SESSION['userid'] = $userID;
                    // now make the folder and store the profile photo there
                    createUserDirectory($userID."-User-".$en_no);
                    if(isset($_FILES['file']) && !empty($_FILES['file']))
                    {
                        $path = $_SERVER['DOCUMENT_ROOT']."/chats/Uploads/$userID-User-$en_no/".$_FILES['file']['name'];
                        $Query = "update tbl_user set profile_photo_path = '$path' where user_id = $userID";
                        mysqli_query($connection,$Query);
                        CloseConnection($connection);
                        moveUploadedImageToUserDirectory($userID."-User-".$en_no);
                    }
                    else
                        CloseConnection($connection);                   
                }
                else
                {
                    CloseConnection($connection);
                    return 0;
                }
                return $userID;
            }
        }
        catch(Exception $error)
        {
            echo  "<br>" . $error . "<br>";
            return 0;
        }
    }


    function InsertIntoUserTechnologyTable($technologyID)
    {
        if(!PHP_SESSION_ACTIVE)
            session_start();
        if(isset($_SESSION['userid']) && !empty($_SESSION['userid']))
        {
            $userID = $_SESSION['userid'];
            $connection = ConnectToDB();
            $query = "insert into tbl_user_technology(technology_id,user_id,created_by,modified_by)values($technologyID,$userID,$userID,$userID)";
            echo $query;
            if(mysqli_query($connection,$query))
            {                
                CloseConnection($connection);
                header("location: profile.php");
            }
            else
            {
                CloseConnection($connection);                
                error("server error,please retry",$_SERVER['DOCUMENT_ROOT']."/chats/settings.php");
            }           
        }
        else
            error("not properly looged in",$_SERVER['DOCUMENT_ROOT']."/chats/Login.php");
    }
    function InsertIntoUserExperienceTable($StartDate,$EndDate,$ExperienceDescription,$ExperienceTitle)
    {
        if(!PHP_SESSION_ACTIVE)
            session_start();
        if(isset($_SESSION['userid']) && !empty($_SESSION['userid']))
        {
            if(empty($StartDate))
                error("must enter your new experience's start date","settings.php");
            if(empty($EndDate))
                error("must enter your new experience's end date","settings.php");
            if(empty($ExperienceDescription))
                error("must enter your new experience's description","settings.php");
            if(empty($ExperienceTitle))
                error("must enter your new experience's Title","settings.php");

            $userID = $_SESSION['userid'];
            $connection = ConnectToDB();
            $query = "insert into tbl_user_Experience(start_date,end_date,experience_description,experience_title,user_id,created_by,modified_by)values('".$StartDate."','".$EndDate."','".$ExperienceDescription."','".$ExperienceTitle."',$userID,$userID,$userID)";
            echo $query;
            if(mysqli_query($connection,$query))
            {                
                CloseConnection($connection);
                header("location: profile.php");
            }
            else
            {
                CloseConnection($connection);
                error("server error,please retry",$_SERVER['DOCUMENT_ROOT']."/chats/settings.php");
            }           
        }
        else
            error("not properly looged in",$_SERVER['DOCUMENT_ROOT']."/chats/Login.php");
    }
    function UpdatePersonalDetails($Username,$EmailID,$DateOfBirth,$Contact)    
    {       
        if(!PHP_SESSION_ACTIVE)
            session_start();
        if(isset($_SESSION['userid']) && !empty($_SESSION['userid']))
        {
            $userID = $_SESSION['userid'];
            $connection = ConnectToDB();
            $query = "update tbl_user set user_name = '".$Username."' , email_id = '".$EmailID."' , date_of_birth = '".$DateOfBirth."' , Contact_Number = '".$Contact."' , modified_by = $userID where user_id = $userID";
            echo "<br><br>".$query."<br>";
            if(mysqli_query($connection,$query))
            {
                echo "hi";
                $EventID = mysqli_insert_id($connection);
                if(isset($_FILES['file']) && !empty($_FILES['file']))
                {
                    echo "hi";
                    if(!isset($_SESSION['userid']) || !isset($_SESSION['email']) || empty($_SESSION['userid']) || empty($_SESSION['email']))
                        header("Location: ".$_SERVER['DOCUMENT_ROOT']."/chats/Login.php");
                        
                    $userID = $_SESSION['userid'];
                    $en_no = $_SESSION['email'];
                    $path = $_SERVER['DOCUMENT_ROOT']."/chats/Uploads/$userID-User-$en_no/".$_FILES['file']['name'];
                    echo $path;
                    $Query = "update tbl_user set profile_photo_path = '$path' where user_id  = $userID";
                    mysqli_query($connection,$Query);
                    moveUploadedImageToUserDirectory($userID."-User-".$en_no);
                }           
                                        
                CloseConnection($connection);
                header("location: profile.php");
            }
            else
                error("server error please retry",$_SERVER['DOCUMENT_ROOT']."/chats/profile.php/homePage.php");
            //CloseConnection($connection);
        }
        else
            error("not properly looged in",$_SERVER['DOCUMENT_ROOT']."/chats/Login.php");
    }


    function UpdateCompanyDetails($CompanyName,$Designation,$Package,$Experience,$Location)
    {
        if(!PHP_SESSION_ACTIVE)
        session_start();
        if(isset($_SESSION['userid']) && !empty($_SESSION['userid']))
        {
            echo $Package . " " . $CompanyName . " " . $Designation;
            //die("");
            if(empty($CompanyName))
                error("must enter your Company name","setting.php");
            if(empty($Desgination))
                error("must enter your Designation","setting.php");
            if(empty($Package))
                error("must enter your Package","setting.php");
            if(empty($Experience))
                error("must enter your Experience","setting.php");
            if(empty($Location))
                error("must enter your Location or place of work","setting.php");


            $userID = $_SESSION['userid'];
            $connection = ConnectToDB();
            $query = "update tbl_user set current_company_working_in = '".$CompanyName."' , job_title_id = $Designation , salary = $Package , Experience = $Experience , Place_Of_Work_Id = $Location, modified_by = $userID  where user_id = $userID and is_enabled = 'y'";
            echo $query;
            if(mysqli_query($connection,$query))
            {                                
                CloseConnection($connection);
                header("location: profile.php");
            }
            else
            {
                CloseConnection($connection);
                error("server error,please retry","setting.php");
            }           
        }
        else
            error("not properly logged in","Login.php");
    }
    function InsertIntoUserAchievementTable($AchievementDate,$AchievementTitle,$AchievementDescription)
    {
        
        if(!PHP_SESSION_ACTIVE)
            session_start();
        if(isset($_SESSION['userid']) && !empty($_SESSION['userid']))
        {
            if(empty($AchievementDate))
                error("must enter your new Achievement's date","setting.php");
            else
                $StartDate = date("Y-m-d");
            if(empty($AchievementDescription))
                error("must enter your new Achievement's description","setting.php");
            if(empty($AchievementTitle))
                error("must enter your new Achievement's title","setting.php");
            //die("ok till here");

            //die("ok till here");
            $userID = $_SESSION['userid'];
            $connection = ConnectToDB();
            $query = "insert into tbl_user_achievement(achievement_date,achievement_title,achievement_description,user_id,created_by,modified_by)values('".$AchievementDate."','".$AchievementTitle."','".$AchievementDescription."',$userID,$userID,$userID)";
            echo $query;
            if(mysqli_query($connection,$query))
            {                                
                $UserAchievementID = mysqli_insert_id($connection);
                if(isset($_FILES['file']) && !empty($_FILES['file']))
                {
                    if(!isset($_SESSION['userid']) || !isset($_SESSION['email']) || empty($_SESSION['userid']) || empty($_SESSION['email']))
                        header("Location: ".$_SERVER['DOCUMENT_ROOT']."/chats/Login.php");
                        
                    $userID = $_SESSION['userid'];
                    $en_no = $_SESSION['email'];
                    $path = $_SERVER['DOCUMENT_ROOT']."/chats/Uploads/$userID-User-$en_no/".$_FILES['file']['name'];
                    $Query = "update tbl_user_achievement set certificate_path = '$path' where user_achievement_id = $UserAchievementID";
                    echo $Query;
                    mysqli_query($connection,$Query);
                    moveUploadedImageToUserDirectory($userID."-User-".$en_no);
                }           

                CloseConnection($connection);
                header("location: profile.php");
            }
            else
            {
                CloseConnection($connection);
                error("server error,please retry","setting.php");
            }           
        }
        else
            error("not properly looged in","Login.php");
    }
    function ChangePassword($OldPassword,$Password,$ConfirmPassword)
    {
        if(!PHP_SESSION_ACTIVE)
            session_start();
        if(isset($_SESSION['userid']) && !empty($_SESSION['userid']))
        {
            if(empty($OldPassword))
                error("Old Password is empty","setting.php");
            if(empty($Password))
                error("Password is empty","setting.php");
            if(empty($ConfirmPassword))
                error("Confirm Password is empty","setting.php");

            if(!($ConfirmPassword === $Password))
                error("Confirm Password and password do not match","setting.php");

            $userID = $_SESSION['userid'];
            $connection = ConnectToDB();
            if(DoLoginWithID($userID,$OldPassword))
            {
                $HP = hash("sha256",$Password);
                $query = "update tbl_user set password = '".$HP."' , modified_by = $userID  where user_id = $userID and is_enabled = 'y'";
                //echo $query;
                if(mysqli_query($connection,$query))
                {                
                    CloseConnection($connection);
                    header("location: profile.php");
                }
                else
                {
                    CloseConnection($connection);
                    error("server error,please retry","setting.php");
                }           
            }
            else
              error("the $OldPassword does not match with your user id $userID ","homePage.php");
        }
        else
            error("not properly looged in",$_SERVER['DOCUMENT_ROOT']."/chats/Login.php");
    }
    function DoLoginWithID($ID,$password)
    {
        try
        {
            $hashedpassword = hash('sha256',$password);
            $connection = ConnectToDB();
            $query = "select * from tbl_user where user_id = $ID and password = '$hashedpassword' and  is_enabled = 'y'";
            $result = mysqli_query($connection,$query);
            if(mysqli_num_rows($result) == 1)
            {
                return 1;
            }
            else
            {
                return 0;
            }
            CloseConnection($connection);
        }
        catch(Exception $error)
        {
            echo $error;
            return 0;
        }
    }


    function DoLogin($Enrollment_Number,$password)
    {
        try
        {
            $hashedpassword = hash('sha256',$password);
            $connection = ConnectToDB();
            if($connection == null)
                echo "null<br><br>";
            $query = "select * from tbl_user where enrollment_number = '$Enrollment_Number' and password = '$hashedpassword' and  is_enabled = 'y'";
            $result = mysqli_query($connection,$query);            
            if(mysqli_num_rows($result) == 1)
            {
                if(!PHP_SESSION_ACTIVE)
                    session_start();
                foreach($result as $row)
                {
                    echo $row['User_ID'];
                    $_SESSION['userid'] = $row['User_ID'];
                }
                echo $_SESSION['userid'];
                return 1;
            }
            else
            {
                //$path = $_SERVER['DOCUMENT_ROOT']."/chats/Login.php";
                //header("location: ".$path);
                return 0;
            }
            CloseConnection($connection);
        }
        catch(Exception $error)
        {
            echo $error;
            return 0;
        }
    }
    function DisplayBatchInDropDown()
    {
        try
        {
            $connection = ConnectToDB();
            $query = "select batch_id,batch_name from tbl_batch where is_enabled = 'y'";
            $result = mysqli_query($connection,$query);
            echo "done";
            foreach($result as $rows)
            {
                $id = $rows['batch_id'];
                $name = $rows['batch_name'];
                echo "<option value = \"$id\"> $name </option>";
            }
            CloseConnection($connection);
        }
        catch(Exception $error)
        {}
    }

    function DisplayTechnologyInDropDown()
    {
        try
        {
            $connection = ConnectToDB();
            $query = "select technology_id,technology_name from tbl_technology where is_enabled = 'y'";
            $result = mysqli_query($connection,$query);
            echo "done";
            foreach($result as $rows)
            {
                $id = $rows['technology_id'];
                $name = $rows['technology_name'];
                echo "<option value = \"$id\"> $name </option>";
            }
            CloseConnection($connection);
        }
        catch(Exception $error)
        {}
    }

    function DisplayJobTitleInDropDown()
    {
        try
        {
            $connection = ConnectToDB();
            $query = "select job_title_id,job_title from tbl_job_title where is_enabled = 'y'";
            $result = mysqli_query($connection,$query);
            echo "done";
            foreach($result as $rows)
            {
                $id = $rows['job_title_id'];
                $name = $rows['job_title'];
                echo "<option value = \"$id\"> $name </option>";
            }
            CloseConnection($connection);
        }
        catch(Exception $error)
        {}
    }

    function DisplayPlaceOfWorkInDropDown()
    {
        try
        {
            $connection = ConnectToDB();
            $query = "select place_of_work_id,place_of_work from tbl_place_of_work where is_enabled = 'y'";
            $result = mysqli_query($connection,$query);
            echo "done";
            foreach($result as $rows)
            {
                $id = $rows['place_of_work_id'];
                $name = $rows['place_of_work'];
                echo "<option value = \"$id\"> $name </option>";
            }
            CloseConnection($connection);
        }
        catch(Exception $error)
        {}
    }

    function ActivateAccount($userid)
    {
        $connection = ConnectToDB();
        $query = "update tbl_user set is_enabled = 'y' where user_id = $userid";
        mysqli_query($connection,$query);
        CloseConnection($connection);
    }
?>