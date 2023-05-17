<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forgotpass.aspx.cs" Inherits="STUDVERSE_TRY1.forgotpass" %>

<%   
    if (Request["submit"] != null)
    {
       
        Session["uname1"] = Request["user1"];
        Session["pswd1"] = Request["pswd"];
        
        Response.Redirect("DummyRedirectOTPforforgot.aspx");
    }
    
%>
<!DOCTYPE html>
<!-- Coding By CodingNepal - youtube.com/codingnepal -->
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Login Form |Stud-verse</title>
    <link rel="stylesheet" href="./css/login.css">
   
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
  <body>

    <div>
      <div class="wave"></div>
     <div class="wave"></div>
    <div class="wave"></div>
   </div>
   <div>
     <div class="wave"></div>
     </div>
    <div class="center">
      
      <h1>New password</h1>
      <form action="" method="POST">
        <div class="txt_field">
         <input type = "email" runat="server" id = "user1" required>
          <span></span>
          <label>user name </label>
        </div>
        <div class="txt_field">
         <input type = "number" runat="server" id = "pswd" required>
          <span></span>
          <label>NEW PASSWORD </label>
        </div>

          
        
        <input type = "submit" id ="submit" runat="server" value="change">
      </form><p>
    </div>


  </body>
</html>

