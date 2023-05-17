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
                    long UserID = Convert.ToInt32(Session["user_id"]);
                    string query = "select * from tbl_otp_information where OTPID = "+token+" and OTPNUMBER = "+otp+" and user_id = "+UserID+" and time > 0;";
                    MySqlCommand command = new MySqlCommand(query,connection);

                    MySqlDataReader result = command.ExecuteReader();
                    DataTable DT = new DataTable();
                    DT.Load(result);

                    int number_of_rows = DT.Rows.Count;

                    if (number_of_rows == 0)
                        Response.Write("<script>if(confirm('OTP is not matched')) document.location = 'OTPValidations.aspx';else  document.location = 'OTPValidations.aspx';</script>");
                    else 
                    {                        
                        ActivateAccount((int)UserID);
                        DeleteFromOTPTable(token);
                        Response.Redirect("Login.aspx");
                    }
                    connection.Close();
                }
                else
                        Response.Write("<script>if(confirm('not connected to server')) document.location = 'OTPValidations.aspx';else  document.location = 'OTPValidations.aspx';</script>");                
            }
        }
        catch (Exception error)
        {
        }
    }
%>







<!DOCTYPE html>

<html>
    <head>
        <title>Enter OTP </title>
    </head>
    <body>
        <h1> please enter token and otp sent to you via email to become part of out community</h1><br>
        <h2> Hurry!before otp expires in about 60 mins</h2>
            <form action = "#" method = "post" runat="server">
                Token : <input type = "number" runat="server" ID = "token" required><br>
                OTP Number : <input type = "number" runat="server" ID = "otp" required><br>
                <input type = "submit" ID ="submit" runat="server" value="enter otp">
            </form>
    </body>
</html>
