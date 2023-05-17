<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reg1.aspx.cs" Inherits="STUDVERSE_TRY1.reg1" %>


<%   
    if (Request["submit"] != null)
    {
        Session["fullname"] = Request["fullname"];
        Session["enroll"] = Request["enroll"];
        Session["uname"] = Request["uname"];
        Session["pswd"] = Request["pswd"];
        Session["email"] = Request["email"];
        Response.Write(Request["email"]);
        Response.Redirect("DummyRedirectOTP.aspx");
    }
    
%>

<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <title> Registration Stud - Verse  </title>
   <link rel="stylesheet" href="./css/Register1.css">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <title>Registration Form</title>
     <style>
      p {
        text-align: right;
        font-family: Arial, Helvetica, sans-serif;
        padding:3px;
      }
      .head{ font-family:'Times New Roman', Times, serif;
              color:navy;
            }
         
      </style>
   </head>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    

<body>
<section>
  
    <div class="wae"></div>
   <div class="wave"></div>
  <div class="wave"></div>
 </div>
 <div>
  <div class="wave"></div>
  </div>
  <div class="container">
    <div class="title">Registration</div>
    <div class="content">
      <form runat="server" method="get" >
        <div class="user-details">
          <div class="input-box">
            <span class="details">Full Name</span>
            <input runat="server" type="text" placeholder="Enter your name" id="fullname"  required >
              <!-- <?php if(in_array("your full name must be between 2 to 25 chracters", $error_array))  echo "your full name must be between 2 to 25 chracters";?> -->

            </div>
          <div class="input-box">
            <span class="details">Enroll No :</span>
            <input runat="server" type="number" size="15" placeholder="Enrollment Number" required id="enroll">
            
          </div>
          <!-- <?php if(in_array("your enrollment number  can only contain english chracters or numbers", $error_array ))  echo "your enrollment number  can only contain english chracters or numbers";?> -->
          <div class="input-box">
            <span class="details">Username</span>
            <input runat="server" type="text" placeholder="Enter your username" required id="uname">
          </div>
          <div class="input-box">
            <span class="details">Email</span>
            <input runat="server" type="email" placeholder="Enter your email" required id="email">
          </div>
         
          <div class="input-box">
          <span class="details">Password</span>
            <input runat="server" type="password" placeholder="Enter your password" required id="pswd">
          </div>
          <div class="input-box">
           
          </div>
          <div class="input-box">
           
          </div>
        </div>
        <div class="input-box">
            <!-- <span class="details">Comfirm - Email</span> -->
            <!-- <input runat="server" type="text" placeholder="Enter your email" required name="cemail"> -->
          </div>
       
        <div class="button" >
          <input runat="server" type="submit" value="Register" id="submit">
        </div>
      </form>
    
  </div>
</body>


</html>

<?php 


