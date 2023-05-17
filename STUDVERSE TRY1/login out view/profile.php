<?php
session_start();
if (!isset($_SESSION['user_name']) || empty($_SESSION['user_name'])) {
  //die("username not found");
  header("location: login.php");
} else {


  $con = mysqli_connect("localhost", "root", "", "studcom");

  if (mysqli_connect_error()) {

    echo "Failed to connect" . mysqli_connect_error();
  }

  $userses = $_SESSION['user_name'];
  $query = "SELECT * FROM userstud WHERE username = '$userses' ";
  $result4 = mysqli_query($con, $query);
  foreach ($result4 as $rows) {
    $uname = $rows['name'];
    $username = $rows['username'];
    $enroll_numb = $rows['enroll_numb'];
    $email = $rows['email'];
    $id = $rows['U_id'];
  }
}

?>
<html>

<head>
  <title>Profile</title>
  <link rel="stylesheet" href="./css/">
  <style>
    body{
  background-image: linear-gradient(#424890,#2e3267);
  /*
  background-repeat: no-repeat;
  background-size: cover;*/
  height:100%;
  width:100%;

  color: black;
  font-family: 'Poppins', sans-serif;
}
*{
  margin: 0px;
  padding: 0px;
  box-sizing: border-box;
}
.main{
  /* width: 400px; */
  /* margin: 100px; 
  background-repeat: no-repeat;
  background-size: cover;*/
  color: black;
  font-family: 'Poppins', sans-serif;

 
}
h2{
  text-align: center;
  padding: 20px;
  font-family: sans-serif;
}
.center{
  border: black;
  background-color: white;
  position: top;
  text-align: center;
  margin-top: 0%;
  margin-left: 30%;
  height: 89%;
  width: 38%;
  border-radius: 10px;
}
.centerpro{
  border: black;
  background-color: white;
  position: top;
  text-align: center;
  margin-top: 5%;
  margin-left: 30%;
  height: 89%;
  width: 38%;
  border-radius: 10px;
}
.error {
  color: #FF0001;
}  
.centerh1{
  text-align: center;
  /* padding: 0 0 20px 0; */
  /*border-bottom: 1px solid rgb(30, 28, 28);*/
      
}
form#register{
  margin: 1px;
}

input #name{
width: 300px;
height: 900px;

border-radius: 3px;
outline :0;
padding:7px;
background-color: #6c63ff;
box-shadow: inset 1px 1px 5px;
}
.submit{
  border: none;
  background-color: #6c63ff;
  color: rgb(19, 19, 19);
  padding: 8px 40px;
  text-transform: uppercase;
  font-size: 14px;
}
.button1:hover {
  background-color: white;
  border:#35ca2a;
  color:#6c63ff;
  box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
}

input[type="submit"]{
  border: none;
  background-color: #326032;
  color: rgb(214, 180, 93);
  padding: 8px 40px;
  text-transform: uppercase;
  font-size: 14px;
}
/*
label,span,h2{
  text-shadow: 1px 1px 5px;
  rgb(0,0,0,0.3);
}*/

.w_form {

   padding-top: 50px;

    height: 380px;
    width: 100%;
    margin: auto;
}



  </style>
  
</head>

<body>
  <div>
    <div>
      <!--<h2>Register Here</h2>-->
      <h1 class="centerh1">
        Profile
      </h1>
      <form method="POST">
      <div class="w_form" >
        <table class="center">
      
        
          <tr >
            <td> <label for="name"> <b>Student Name :</b></label> </td>
            <td><input type="text" name="name" value="<?php echo $uname; ?>"><br><br> </td>
          </tr>
          <!-- <tr>
                                        <td>
                                            <label for="Gender"><b>Gender:</b></label>
                                        </td> 
                                        <td>
                                            <input type="radio" name="gender" value="male">
                                            <span>Male</span>
                                            <input type="radio" name="gender" value="female">
                                            <span>Female</span><br><br>
                                        </td>

                                    </tr> -->
          <tr>
            </td>

            <td> <label for="name"> <b>User Name :</b></label> </td>
            <td><input type="text" name="username" value="<?php echo $username; ?>"><br><br> </td>
          </tr>
          <tr>
            <td>
              <label for="Date Of Birth"><b>Enroll Number : </b></label>
            </td>
            <td>
              <input type="text" name="enroll" value="<?php echo $enroll_numb; ?>"><br><br>
            </td>
          </tr>

          <tr>
            <td>
              <label for="Email"><b>Email:</b></label>
            </td>
            <td>
              <input type="email" name="email" value="<?php echo $email; ?>"><br><br>
            </td>
          </tr>



          <!-- <tr>
                                            <td>
                                                <label ><b>ID:</b></label>
                                            </td>
                                            <td>
                                                <input type="number" name="id" value = "<?php echo $id; ?>" ><br><br>
                                            </td>
                                        </tr> -->

          <td colspan="2">
            <button class="submit button1" name="Update">Update</button>
            
          </td>
          </tr>
          <tr>
            <td colspan="2">
              <button class="submit button1" name="delete">Delete Account</button>
              <button class="submit button1" formaction="loged_view.php" formmethod="post" name="home">HOME</button>
            </td>
          </tr>

</div>
        </table>
      </form>
      <?php

      if (isset($_POST['Update'])) {

        $username=$_POST['username'];
        $uname=$_POST['name'];
        $enroll_numb=$_POST['enroll'];
        $email=$_POST['email'];

        $update = "UPDATE userstud SET name='$uname', username='$username', enroll_numb='$enroll_numb' ,email='$email' WHERE U_id='$id' ";

        $res = mysqli_query($con,$update);
        if ($res) {
          echo ("<script LANGUAGE='JavaScript'>
                                        window.alert('Your data Updated');
                                        </script>");
        } else {
          die("error" . mysqli_error($con));
        }
      }

      $delete = "DELETE FROM userstud WHERE username = '$userses' ";
      if (isset($_POST['delete'])) {
        $res = mysqli_query($con, $delete);
        if ($res) {
          echo ("<script LANGUAGE='JavaScript'>
                                        window.alert('Account deleted');
                                        window.location.href='reg1.php';
                                        </script>");
        } else {
          die("error" . mysqli_error($con));
        }
      }

      $view = "";
      if (isset($_POST['view'])) {
        // $res=mysqli_query($con,$view);

        header("location: profile.php");
      }


      mysqli_close($con);

      ?>
    </div>

    <body>
      

</html>