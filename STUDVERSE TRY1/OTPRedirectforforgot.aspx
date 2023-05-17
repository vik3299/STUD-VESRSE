<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OTPRedirect.aspx.cs" Inherits="STUDVERSE_TRY1.OTPRedirect" %>
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
    bool SendMail(string subject,string body,string[] recipients,bool isHtml = true)
    {
        try
        {
            SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
            smtpClient.UseDefaultCredentials = false;
            smtpClient.Credentials = new System.Net.NetworkCredential("studdverse@gmail.com", "zyqllsjjgegsamou");

            smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtpClient.EnableSsl = true;

            MailMessage mail = new MailMessage();

            mail.From = new MailAddress("studdverse@gmail.com");

            foreach(string mailID in recipients)
                mail.To.Add(new MailAddress(mailID));

            mail.Subject = subject;
            mail.IsBodyHtml = isHtml;
            mail.Body = body;

            smtpClient.Send(mail);
            return true;
        }
        catch (Exception error) { return false; }
    }
%>
<%
    // otp bit
    try
    {
        string email = Session["Email_From_Registration"].ToString();
        string UserID = Session["User_ID_From_Registration"].ToString();

        MySqlConnection connection1 = ConnectToDB();

        if(connection1 == null)
            Response.Write("not connected one bit");
        else
        {
            connection1.Open();
            // insert the otp request 
            string Query = "insert into tbl_otp_information(userEmail,user_id)values('"+email+"',"+UserID+")";
            MySqlCommand command = new MySqlCommand(Query,connection1);
            command.ExecuteNonQuery();
            // get the same request id or token
            long lastID = command.LastInsertedId;
            // fetch the same request for sending email
            command.CommandText = "select * from tbl_OTP_Information where OTPID = "+lastID+"";
            MySqlDataReader result = command.ExecuteReader();
            DataTable Dt = new DataTable();
            Dt.Load(result);

            int OTPNumber = 0;
            if (Dt.Rows.Count != 0)
            {
                OTPNumber = Convert.ToInt32(Dt.Rows[0]["OTPNUMBER"]);
                string[] to = { email };


                string htmlContent = "<html><body><h1> OTP Notification </h1><p> your otp token is "+lastID+" and your otp is "+OTPNumber+"</p></body></html >";
                string subject = "OTP notification for registration process in our Alumni Association";
                if (SendMail(subject, htmlContent, to))
                    Response.Redirect("OTPValidationsforforgot.aspx");
                else
                    Response.Write("<script>alert('error in sending otp mail')</script>");
            }
            else
                Response.Write("<script>alert('server error')</script>");
            connection1.Close();
        }
    }
    catch(Exception error)
    {
        Response.Write(error.Message);
    }

    %>