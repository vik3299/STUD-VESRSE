<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="loged_view.aspx.cs" Inherits="STUDVERSE_TRY1.loged_view" %>
 
<!DOCTYPE html>
<html lang="en">
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Stud - verse</title>
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
    <link rel="stylesheet" href="./css2/style.css">
    <!--Google Fonts  -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
     <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;500;600;700;800;900&display=swap" rel="stylesheet">
     
</head>
    <body>
    <!--<nav>
        <div class="container nav_container">
            <a href="index.html"><h4>Stud-Verse</h4></a>
            <ul class="nav_menu">
                <li><a href="index.html">Home</a></li>
                <li><a href="about.html">About</a></li>
                <li><a href="courses.html">Courses</a></li>
                <li><a href="contact.html">Contact</a></li>

                <li ><a style=" text-decoration: none;
                    background-color: var(--color-bg1);
                    color: white;
                    padding: 8px 20px;
                    border-radius: 25px;
                    margin: 0 10px;"href="login.html" target="_blank">  Login  </a></li>


                <li ><a style=" text-decoration: none;
                    background-color: var(--color-bg1);
                    color: white;
                    width: 20px;
                    padding: 8px 20px;
                    border-radius: 25px;
                    margin: 0 10px; width: 10%;" href="Register.html" target="_blank"> Register </a></li>
                <button></button>
            </ul>
            <button id="open-menu-btn"> <i class="uil uil-bars"></i></button>
            <button id="close-menu-btn"><i class="uil uil-multiply"></i></button>
        </div>   

    </nav>-->
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



   
    <div class="Head_name">
    <!-- <h1>Stud-verse </h1> -->
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
                 <a style="padding: 1rem " href="courses.html" class="btn btn-primary"> Get Started</a>
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
    <!--End Of Header-->
   <!----<section class="categories">
   
         <div class="container categories_container">
            <div class="categories_left">
          <h1>Categories</h1>
          <p>
            
            Lorem ipsum dolor sit amet consectetur adipisicing elit.
             Nihil a minima, necessitatibus nesciunt repellat dolore iusto ipsum neque vel laboriosam sunt incidunt, quia architecto alias voluptatum iure magni impedit facilis?
          </p>        
          <a href="#" class="btn"> Learn More</a>
        </div>

 
 
 
    <div style=" display: grid; grid-template-columns: repeat(3, 1fr); gap: 1.2rem;" class="categories_right">
            <article class="category" >
                <span style="background: var(--color-block)"class="category_icon"><i class="uil uil-bitcoin-sign"></i></i></span>
                <h5>Block Chain </h5>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ab hic dolor aspernatur quaerat </p>

             </article> 

             <article class="category">
                <span class="category_icon"><i class="uil uil-react"></i></i></span>
                <h5>React JS </h5>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ab hic dolor aspernatur quaerat </p>

             </article> 
             <article class="category">
                <span style="background: #b3b3ff" class="category_icon"><i class="uil uil-robot"></i></i></span>
                <h5>AI  </h5>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ab hic dolor aspernatur quaerat </p>

             </article> 
             <article class="category">
                <span style="background: var(--color-danger)" class="category_icon"><i class="uil uil-monitor-heart-rate"></i></i></span>
                <h5>Machine Learning  </h5>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ab hic dolor aspernatur quaerat </p>

             </article> 
             <article class="category">
                <span style="background: var(--color-success)" class="category_icon"><i class="uil uil-database"></i></i></span>
                <h5>Big Data </h5>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ab hic dolor aspernatur quaerat </p>

             </article> 
             <article class="category">
                <span style="background: var(--color-extra1)" class="category_icon"><i class="uil uil-cloud-data-connection"></i></i></span>
                <h5>Cloud-computing </h5>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ab hic dolor aspernatur quaerat </p>

             </article> 
               
         </div>   
        </div>
    </section>   -->
    <!--=========================END OF CATEGORIES    =========================-->
     
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

      <!--=========================END OF COURSES  
    
       <section class="faqs">
        <h2>Frequentely ask Questions.</h2>
          <div class="container faqs_container">
              <article class="faq">
                <div class="faq_icon"> <i class="uil uil-plus"> </i></div>
                <div>
                    <h4>How do I  know the Right Course For me ?</h4>
                    <p>
                        Lorem ipsum dolor sit amet consectetur, adipisicing elit.
                         Quisquam laborum optio 
                    </p>

                 </div>   

              </article>

              <article class="faq">
                <div class="faq_icon"> <i class="uil uil-plus"> </i></div>
                <div>
                    <h4>How do I  know the Right Course For me ?</h4>
                    <p>
                        Lorem ipsum dolor sit amet consectetur, adipisicing elit.
                         Quisquam laborum optio 
                    </p>

                 </div>   

              </article >

              <article class="faq1">
                <div class="faq_icon"> <i class="uil uil-plus"> </i></div>
                <div>
                    <h4>How do I  know the Right Course For me ?</h4>
                    <p>
                        Lorem ipsum dolor sit amet consectetur, adipisicing elit.
                         Quisquam laborum optio 
                    </p>

                 </div>   

              </article>

              <article class="faq">
                <div class="faq_icon"> <i class="uil uil-plus"> </i></div>
                <div>
                    <h4>How do I  know the Right Course For me ?</h4>
                    <p>
                        Lorem ipsum dolor sit amet consectetur, adipisicing elit.
                         Quisquam laborum optio 
                    </p>

                 </div>   

              </article >

              <article class="faq">
                <div class="faq_icon"> <i class="uil uil-plus"> </i></div>
                <div>
                    <h4>How do I  know the Right Course For me ?</h4>
                    <p>
                        Lorem ipsum dolor sit amet consectetur, adipisicing elit.
                         Quisquam laborum optio 
                    </p>

                 </div>   

              </article>

              <article class="faq">
                <div class="faq_icon"> <i class="uil uil-plus"> </i></div>
                <div>
                    <h4>How do I  know the Right Course For me ?</h4>
                    <p>
                        Lorem ipsum dolor sit amet consectetur, adipisicing elit.
                         Quisquam laborum optio 
                    </p>

                 </div>   

              </article>   =========================--> 

              <!-------------------------  END OF FREQUENTELY ASKED QUESTIONS ------------------------------->

           
       <!--  <section class="container testimonials_container">
                <h2>Student Testimonials</h2>

                <div>
                  <article class="testimonail">
                    <div class="avatar">
                        <img src="./images/avatar1.jpg" alt="dumb">

                    </div>

                    <div class="testimonail_info">

                        <h5>lily</h5>

                        <small>Student </small>
                     
                     </div>  
                     
                     <div class="testimonial_body">
                       <p>
                        Lorem ipsum dolor sit amet consectetur adipisicing elit. 
                        Blanditiis iste minus distinctio adipisci vero consectetur dicta ad 
                        </p>
                     </div>


                    </article>
                   
                    <article class="testimonail">
                        <div class="avatar">
                            <img src="./images/avatar2.jpg" alt="dumb">
    
                        </div>
    
                        <div class="testimonail_info">
    
                            <h5>lily</h5>
    
                            <small>Student </small>
                         
                         </div>  
                         
                         <div class="testimonial_body">
                           <p>
                            Lorem ipsum dolor sit amet consectetur adipisicing elit. 
                            Blanditiis iste minus distinctio adipisci vero consectetur dicta ad 
                            </p>
                         </div>
    
    
                        </article>
               
                        <article class="testimonail">
                            <div class="avatar">
                                <img src="./images/avatar3.jpg" alt="dumb">
        
                            </div>
        
                            <div class="testimonail_info">
        
                                <h5>lily</h5>
        
                                <small>Student </small>
                             
                             </div>  
                             
                             <div class="testimonial_body">
                               <p>
                                Lorem ipsum dolor sit amet consectetur adipisicing elit. 
                                Blanditiis iste minus distinctio adipisci vero consectetur dicta ad 
                                </p>
                             </div>
        
        
                            </article>
        
                            <article class="testimonail">
                                <div class="avatar">
                                    <img src="./images/avatar4.jpg" alt="dumb">
            
                                </div>
            
                                <div class="testimonail_info">
            
                                    <h5>lily</h5>
            
                                    <small>Student </small>
                                 
                                 </div>  
                                 
                                 <div class="testimonial_body">
                                   <p>
                                    Lorem ipsum dolor sit amet consectetur adipisicing elit. 
                                    Blanditiis iste minus distinctio adipisci vero consectetur dicta ad 
                                    </p>
                                 </div>
            
            
                                </article>
            


                </div>


                </section> --->


              
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
