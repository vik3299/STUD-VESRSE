<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EventParticipation.aspx.cs" Inherits="STUDVERSE_TRY1.EventParticipation" %>
 <!DOCTYPE html>
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
            string ConnectionString = "server=127.0.0.1;uid=root;pwd=root;database=Alumni_Association_System_Database";
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            return connection;
        }
        catch (Exception error)
        {
            return null;
        }
    }
    void CloseConnection(ref MySqlConnection connection)
    {
        try
        {
            if(connection != null)
                connection.Close();
        }
        catch(Exception error)
        { }
    }
    void InsertIntoEventParticipationTable(int EventID)
    {
        try
        {
            if (Session["user_id"] != null)
            {
                if (!string.IsNullOrEmpty(Session["user_id"].ToString()))
                {
                    if (EventID > 0)
                    {
                        int UserID = Convert.ToInt32(Session["user_id"]);
                        MySqlConnection connection = ConnectToDB();
                        connection.Open();

                        string Query = "select count(event_participation_id) from tbl_event_participation where participant_id = " + UserID + " and event_id = " + EventID + " and is_enabled = 'y'";
                        MySqlCommand command = new MySqlCommand(Query, connection);
                        int TotalRows = Convert.ToInt32(command.ExecuteScalar());

                        if (TotalRows > 0)
                            Response.Write("<script>if(confirm('Already Participated in that Event')) document.location = 'homePage.aspx';else  document.location = 'homePage.aspx';</script>");
                        else
                        {
                            Query = "insert into tbl_event_participation(event_id,participant_id,created_by,modified_by)values(" + EventID + "," + UserID + "," + UserID + "," + UserID + ")";
                            command.CommandText = Query;
                            command.ExecuteNonQuery();
                        }
                        CloseConnection(ref connection);
                    }
                    else
                        Response.Write("<script>if(confirm('Event not found')) document.location = 'homePage.aspx';else  document.location = 'homePage.aspx';</script>");
                }
                else
                    Response.Write("<script>if(confirm('Not in session')) document.location = 'LogOutSession.aspx';else  document.location = 'LogOutSession.aspx';</script>");
            }
            else
                Response.Write("<script>if(confirm('Not in session')) document.location = 'LogOutSession.aspx';else  document.location = 'LogOutSession.aspx';</script>");
        }
        catch (Exception error)
        {
            Response.Write(error.Message);
        }
    }


%>       

<%            
    if (Session["user_id"] == null || Session["enrollment_number"] == null || Session["user_type"] == null ||
    Session["user_id"].ToString() == "-1" || Session["enrollment_number"].ToString() == "-1" || Session["user_type"].ToString() == "-1")
        Response.Write("<script>alert('not in session');document.location.href='LogOutSession.aspx'</script>");
    else
    {

        try
        {
            if (!string.IsNullOrEmpty(Request["event_id"]))
            {
                int ID = Convert.ToInt32(Request["event_id"]);
                InsertIntoEventParticipationTable(ID);
                Response.Write("<script>if(confirm('Thanks for participating')) </script>");
                //Response.Redirect("profile.aspx");
            }
            else
                Response.Write("<script>if(confirm('Event not found')) document.location = 'homePage.aspx';else  document.location = 'homePage.aspx';</script>");
        }
        catch (Exception error)
        {
            Response.Write(error.Message);
        }
    }
%>