<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="abouts.aspx.cs" Inherits="STUDVERSE_TRY1.abouts" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About</title>
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
    <link rel="stylesheet" href="./css2/style.css">
    <!--Google Fonts  -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
     <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;500;600;700;800;900&display=swap" rel="stylesheet">
     <link rel="stylesheet" href="./css2/about.css">
</head>
<body>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    

    <%
    // Retrieve the "user_name" session variable from the previous page
    string username = (string)Session["user_name"];

    // Check if the user is logged in (i.e. "user_name" session variable is not null or empty)
    if ( username == "admin") {
        // User is logged in, display their username or other 
               string file = "navigation_a_login.aspx";
        // include the file
        Server.Execute(file);
    } else {
        // User is not logged in, redirect to the login page or display an error message
          string file = "nav.aspx";
        // include the file
        Server.Execute(file);
    }
%>




<!----- NAV bar ends here -->

<section class="about-achievements">
  <div class="container about_achievements-container">
    <div class="about_achievements-left">
        <img src="./images/about achievements.svg" alt="">
        
    </div>

    <div class="about_achievements-right">
        <h1>Acheivements</h1>
         <p>
              Having a community of 50000+ students.
         </p>
         <div class="achievements_cards">
            
            <article class="achievement_card">
              <span class="achievement_icon">
                <i class="uil uil-video"></i>
              </span>
               <h3>Live ses+</h3>
                <p>comunity </p>

            </article>

            <article class="achievement_card">
                <span style="background-color: #00bf8e;" class="achievement_icon">
                  <i class="uil uil-users-alt"></i>
                </span>
                 <h3>500+</h3>
                  <p>comunity </p>
  
              </article>
              <article class="achievement_card">
                <span style="background-color: #6c63ff" class="achievement_icon">
                  <i class="uil uil-trophy"></i>
                </span>
                 <h3>Hackthon</h3>
                  <p>comunity </p>
  
              </article>
  
           
         </div>
    </div>
</div>

</section>

<!----- Footer  bar ends here -->

<footer class="footer">
    <div class="container footer_container">
      <div class="foooter_1">
       <a href="index.html" class="footer_logo"> <h4>NEW SESSIONS EVERY SATURDAY !</h4></a>
       <p>
       Every weeks end we have live sessions on booming topics.

        </p>   



       </div>

       


       <div class="footer_2">

           
           <ul class="permalinks">
               

           </ul>

       </div>


       <div class="footer_3">
           <div>
           <h4>Privacy</h4>

           <ul class="privacy">

               <li><a href="#">PRIVACY POLICY</a></li>
               <li><a href="#">TERMS AND CONDITION</a></li>
               <li><a href="#"></a>REFUND POLICY</li>
               <li><a href="#"></a></li>
               <li><a href="#"></a></li>
               

           </ul>
            </div>   
       </div>

       
       <div class="footer_4">
          
           <h4>Contact us</h4>
           <div>
              <p>+91 8160195646 </p>
              <p>panikarvivek@gmail.com </p>
        
          </div>
          
          <ul class="footer_socials">
           <li>
               <a href="#"><i class="uil uil-facebook-f"></i></a>
           </li>

           
           <li>
           <a href="#"><i class="uil uil-instagram-alt"></i></a>
           </li>
            
          
           
          
          <li>
           <a href="#"><i class="uil uil-twitter"></i></a>
           </li>
            
          

          
          <li>
           <a href="#"><i class="uil uil-linkedin-alt"></i></a>
           </li>
            
          </ul>

       </div>


       

   </div>
   
   <div class="footer_copyright">
          
       <small>Copyright : vik</small>
    
    </div>

       
    </footer>    

</body>
</html>
