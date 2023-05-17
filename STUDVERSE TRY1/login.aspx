<%@ Page Language="C#" %>
<%@Import Namespace="MySql.Data.MySqlClient" %>
<%@Import Namespace="System" %>
<%@Import Namespace="System.IO" %>
<%@Import Namespace="System.Data" %>
<%@Import Namespace="System.Security.Cryptography" %>
<%@Import Namespace="System.Text.RegularExpressions" %>
<%@Import Namespace="System.Net.Mail"%>

<%
    MySqlConnection ConnectToDB()
    {
        try
        {
            string ConnectionString = "server=127.0.0.1;uid=root;pwd=root;database=studverse";
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            return connection;
        }
        catch (Exception error)
        {
            return null;
        }
    } %>

<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Login Form | Stud-verse</title>
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
      <h1>Login</h1>
       <form action = "#" method = "post" runat="server">
        <div class="txt_field">
             <input runat="server" type="text" placeholder="" id="username"  required >
         
             
          <label>Username</label>
        </div>
        <div class="txt_field">
         
            <input runat="server" type="password" placeholder="" id="passwd"  required >
          <span></span>
          <span></span>
          <label>Password</label>
        </div>
           <div class="pass"><a href="forgotpass.aspx">forgot password ?</a></div>
        <input runat="server" type="submit" value="Login" id="login">
        <div class="signup_link">
          Not a member? <a href="reg1.aspx">Signup</a> 
        </div>
    </div>
      </form>
  </body>
</html>
<%

    /*
    Response.Write(string.IsNullOrEmpty(Request["username"]));
    Response.Write(string.IsNullOrEmpty(Request["passwd"]));*/
    if (!string.IsNullOrEmpty(Request["username"]) && !string.IsNullOrEmpty(Request["passwd"]))
    {

        String uname = Request["username"].ToString().Trim();
        String passwd = Request["passwd"].ToString().Trim();

        String username = Request["username"];
        Session["user_name"] = username;

        MySqlConnection connection = ConnectToDB();

        if (connection != null)
        {
            connection.Open();
            long UserID = Convert.ToInt32(Session["User_ID_From_Registration"]);
            string query = "select * from student where username =  '"+uname+"' and password = '"+passwd+"' and is_blocked = 'n'";

            MySqlDataAdapter adp = new MySqlDataAdapter(query,connection);

            DataTable DT = new DataTable();
            adp.Fill(DT);
            int number_of_rows = DT.Rows.Count;
            Response.Write(query);
            Response.Write(number_of_rows);
            if (number_of_rows == 0)
                Response.Write("<script>if(confirm('invalid credentials')) document.location = 'login.aspx';else  document.location = 'OTPValidations.aspx';</script>");
            else
           
                Response.Redirect("loged_view.aspx");
            
           
            
            connection.Close();
        }
        else
            Response.Write("<script>if(confirm('not connected to server')) document.location = 'OTPValidations.aspx';else  document.location = 'OTPValidations.aspx';</script>");
    }







    %>

