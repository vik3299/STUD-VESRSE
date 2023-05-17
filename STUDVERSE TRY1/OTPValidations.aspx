<%@ Page Language="C#"%>

<%@Import Namespace="MySql.Data.MySqlClient" %>
<%@Import Namespace="System" %>
<%@Import Namespace="System.IO" %>
<%@Import Namespace="MySql.Data.MySqlClient" %>
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
    }
    void DeleteFromOTPTable(int OTPID)
    {
        try
        {
            MySqlConnection connection = ConnectToDB();
            connection.Open();
            string Query = "delete from tbl_otp_information where otpid = " + OTPID;
            MySqlCommand command = new MySqlCommand(Query, connection);
            command.ExecuteNonQuery();
            CloseConnection(ref connection);
        }
        catch (Exception error)
        {
        }
    }
    void CloseConnection(ref MySqlConnection connection)
    {
        try
        {
            if (connection != null)
                connection.Close();
        }
        catch (Exception error)
        { }
    }
    void ActivateAccount(int UserID)
    {
        try
        {
            MySqlConnection connection = ConnectToDB();
            connection.Open();
            string Query = "update tbl_user set is_enabled = 'y' where user_id = " + UserID + "";
            MySqlCommand command = new MySqlCommand(Query, connection);
            command.ExecuteNonQuery();
            CloseConnection(ref connection);
        }
        catch (Exception error)
        { }
    }
    if(Request["submit"] != null)
    {
        Response.Write("here");
        try
        {
            if (!string.IsNullOrEmpty(Request["otp"]) && !string.IsNullOrEmpty(Request["token"]))
            {
                int token = Convert.ToInt32(Request["token"]);
                int otp = Convert.ToInt32(Request["otp"]);
                MySqlConnection connection = ConnectToDB();

                if (connection != null)
                {
                    connection.Open();
                    long UserID = Convert.ToInt32(Session["User_ID_From_Registration"]);
                    string query = "select * from tbl_otp_information where OTPID = "+token+" and OTPNUMBER = "+otp+" and user_id = "+UserID+" and time > 0;";
                    MySqlCommand command = new MySqlCommand(query,connection);

                    MySqlDataReader result = command.ExecuteReader();
                    DataTable DT = new DataTable();
                    DT.Load(result);

                    int number_of_rows = DT.Rows.Count;
                    Response.Write(query);
                    Response.Write(number_of_rows);
                    if (number_of_rows == 0)
                        Response.Write("<script>if(confirm('OTP is not matched')) document.location = 'OTPValidations.aspx';else  document.location = 'OTPValidations.aspx';</script>");
                    else
                    {
                        //ActivateAccount((int)UserID);
                        DeleteFromOTPTable(token);

                        /*                         string fullname= Request.QueryString["fullname"];
                                                 string enroll = Request.QueryString["enroll"];
                                                 string uname = Request.QueryString["uname"];
                                                 string pswd = Request.QueryString["pswd"];
                                                 string email = Request.QueryString["email"];
                                                    string Query = "insert into student(fullname,username,password,enrollment_no,email)values('"+fullname+"',"+uname+","+pswd+","+enroll+","+email+")";
6MySqlCommand comman = new MySqlCommand(Query,connection);
                        comman.ExecuteNonQuery();*/ 
                        Response.Redirect("reginsert.aspx");
                    }
                    connection.Close();
                }
                else
                    Response.Write("<script>if(confirm('not connected to server')) document.location = 'OTPValidations.aspx';else  document.location = 'OTPValidations.aspx';</script>");
            }
        }
        catch (Exception error)
        {
            Response.Write(error.Message);
        }
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
      
      <h1>Verify - OTP</h1>
      <form action="" method="POST">
        
        <div class="txt_field">
         <input type = "number" runat="server" id = "token" required>
          <span></span>
          <label>Token : </label>
        </div>

           <div class="txt_field">
         <input type = "number" runat="server" id = "otp" required>
          <span></span>
          <label>OTP: </label>
        </div>
        
        <input type = "submit" id ="submit" runat="server" value="enter otp">
      </form><p>
    </div>


  </body>
</html>

