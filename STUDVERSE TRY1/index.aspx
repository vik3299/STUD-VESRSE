<%@ Page Language="VB" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Stud - verse</title>
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
    <link rel="stylesheet" href="./css2/style.css"
    <!--Google Fonts  -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
     <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;500;600;700;800;900&display=swap" rel="stylesheet">
     
</head>
<body>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  
    <!--#include file="navigation_b_login.aspx"-->
    <div class="Head_name">
    
</div>
    <script type="text/javascript">
        function myFunction() {
          var x = document.getElementById("myTopnav");
          if (x.className === "topnav") {
            x.className += " responsive";
          } else {
            x.className = "topnav";
          } 
        }
    </script>
    <header> 
        <div class="container header_container">
            <div class="header_left">
                <h1>Be the Part of the Biggest college Revoultion </h1>
                <p>
                   
                 </p>  
                 <a style="padding: 1rem " href="login.aspx" class="btn btn-primary"> Get Started</a>
            </div>
            <div class="header_right">
                <div class="header_right-image">
                    <img src="./images/header.svg">

                </div>  
             </div>   
        </div>
        <div class="header_right-image"> 
            <img src="./images/header.svg">
        </div>
    </header>
   
    <section class="courses">

    <h2> Community Members </h2>
      <div class="container courses_container">

        <article class="course">
            <div class="course_image">
             <img src="./images/course2.jpg" >
            </div>
             
            <div class="course_Info">
             <h4>Mohammed Ajari (Front- end web Developer)</h4>
             <p>
                Have done Multipe Projects on java-script framework.
            </p>  

            <a href="courses.html" class="btn btn-primary">Learn More </a> 
            </div>  
        </article>     
        <article class="course">
            <div class="course_image">
             <img src="./images/course2.jpg" >
             <div class="course_Info">
                <h4>Rishit Selia(Game-Developer)</h4>
                <p>
                    Have done multiple projects on unity game engine.
               </p>  
            <a href="courses.html" class="btn btn-primary">Learn More </a>
            </div> 
        </article>    
        <article class="course">
            <div class="course_image">
             <img src="./images/course3.jpg" >
            </div>
            <div class="course_Info">
                <h4>Vivek Panikar(Core Block-chain Devloper)</h4>
                <p>
                  Devloping core Block-chain Networks
               </p>  

            <a href="courses.html" class="btn btn-primary">Learn More </a>
            </div> 
        </article>    
         </div>
    </section>  
           </div>
        </section>
        <!----     FOOTER ------->
        <footer class="footer">
         <div class="container footer_container">
           <div class="foooter_1">
            <a href="index.html" class="footer_logo"> <h4>By the Commmunity For the Community</h4></a>
            <p>
               we work for the community here!
             </p>   
            </div>
            <div class="footer_2">
            </div>
            <div class="footer_3">
                <div>
                <h4>Privacy</h4>
                <ul class="privacy">
                    <li><a href="#">PRIVACY POLICY</a></li>
                    <li><a href="#">TERMS AND CONDITION</a></li>
                    <li><a href="#">REFUND POLICY</a></li>
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
         <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    </body>
</html>