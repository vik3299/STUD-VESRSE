<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DummyRedirectOTP.aspx.cs" Inherits="STUDVERSE_TRY1.DummyRedirectOTP" %>

<%
    //command.LastInsertedId this is from id generated auto_increment of user table
    string data = Session["email"].ToString();
    Session["Email_From_Registration"] = data;
    Session["User_ID_From_Registration"] = 1;
    Response.Redirect("OTPRedirect.aspx");
%>