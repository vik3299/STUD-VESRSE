<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Event.aspx.cs" Inherits="STUDVERSE_TRY1.Event" %>
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

    string trimPath(string Path)
    {
        try
        {
            if (Path != null)
            {
                string[] separatedPath = Path.Split('/');
                string FinalPath = separatedPath[separatedPath.Length - 3] + "/" + separatedPath[separatedPath.Length - 2] + "/" + separatedPath[separatedPath.Length - 1];
                return FinalPath;
            }
            return "";
        }
        catch (Exception error)
        {
            return "";
        }
    }

    if (Session["user_id"] == null || Session["enrollment_number"] == null || Session["user_type"] == null ||
    Session["user_id"].ToString() == "-1" || Session["enrollment_number"].ToString() == "-1" || Session["user_type"].ToString() == "-1")
        Response.Write("<script>alert('not in session');document.location.href='LogOutSession.aspx'</script>");
    else
    {

%>
<!DOCTYPE html>
<html lang="en">

<head>
    <!--#Include file="Partials/_headerlinks.html"-->

    <link href="HomePage_images/favicon.ico" rel="icon">
    
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Inter:wght@700;800&display=swap" rel="stylesheet">

    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <link href="css/HomePage_css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href="css/HomePage_css/Jobs.css">

    <style>
        body{
            background-color: rgb(239, 244, 253);
        }
        .scrolltop {
            display: none;
            width: 100%;
            margin: 0 auto;
            position: fixed;
            bottom: 20px;
            right: 10px;
        }

        .scroll {
            position: absolute;
            right: 15px;
            bottom: 40px;
            background: #b2b2b2;
            background: rgba(178, 178, 178, 0.7);
            padding: 20px;
            text-align: center;
            margin: 0 0 0 0;
            cursor: pointer;
            transition: 0.5s;
            -moz-transition: 0.5s;
            -webkit-transition: 0.5s;
            -o-transition: 0.5s;
        }

        .scroll:hover {
            background: rgba(178, 178, 178, 1.0);
            transition: 0.5s;
            cursor: pointer;
            -moz-transition: 0.5s;
            -webkit-transition: 0.5s;
            -o-transition: 0.5s;
        }

        .scroll:hover .fa {
            padding-top: -10px;
        }

        .scroll .fa {
            font-size: 30px;
            margin-top: -5px;
            margin-left: 1px;
            transition: 0.5s;
            -moz-transition: 0.5s;
            -webkit-transition: 0.5s;
            -o-transition: 0.5s;
        }
        .LargerDiv{
            width:100%;            
        }
        .img-fluid{
            height:100px;
            width:auto;
        }
        .eventImage img{
            height:100px;
            width:auto;
        }
    </style>
</head>

<body>
    <!-- #Include file="Partials/_nav.aspx"-->

    <div class="container-fluid py-5" style="background-color: rgb(239, 244, 253);">
        <h1 class="text-center mb-5 wow fadeInUp" data-wow-delay="0.1s">Event Listing</h1>

        <div class="tab-class text-center wow fadeInUp" data-wow-delay="0.3s">
            <div class="tab-content">
                <div id="tab-1" class="tab-pane fade show p-0 active">
                    <% 
                        DataTable EventSet = new DataTable();
                        if (!string.IsNullOrEmpty(Session["user_id"].ToString()))
                        {
                            try
                            {
                                string userID = Session["user_id"].ToString();
                                MySqlConnection connection = ConnectToDB();
                                connection.Open();
                                string query = "select " +
                                         "       tbl_event.event_id,                                        " +
                                         "       tbl_event.event_name,                                      " +
                                         "       tbl_event.event_photo,                                     " +
                                         "       tbl_event.event_description,                               " +
                                         "       tbl_event.venue,                                           " +
                                         "       tbl_event.upload_time,                                     " +
                                         "       tbl_event.event_time,                                      " +
                                         "       tbl_event.organizer_name,                                  " +
                                         "       tbl_user.profile_photo_path,                               " +
                                         "       tbl_user.user_name,                                        " +
                                         "       tbl_user.user_id,                                          " +
                                         "       tbl_event.organizing_member_id                             " +
                                         "       from tbl_event,tbl_user                                    " +
                                         "       where                                                      " +
                                         "       tbl_event.organizing_member_id = tbl_user.user_id and      " +
                                         "       tbl_event.is_enabled = 'y';";
                                MySqlDataAdapter adp = new MySqlDataAdapter(query, connection);
                                adp.Fill(EventSet);
                                connection.Close();
                            }
                            catch (Exception error)
                            {
                            }
                        }
                        else
                            Response.Write("<script>alert('Not in session');document.location='LogOutSession.aspx'</script>");
                        %>

                    <% foreach (DataRow rows in EventSet.Rows)
                        { %>
                    <div class="job-item p-4 mb-4">
                        <div class="row g-4">
                            <div class="col-sm-12 col-md-8 d-flex align-items-center eventImage">

                                <%--<% if(!string.IsNullOrEmpty(rows["profile_photo_path"].ToString())) {%>
                                        <img class="flex-shrink-0 img-fluid border rounded" style='height:100px;object-fit:contain;' src="
                                                <%= trimPath(rows["profile_photo_path"].ToString())
                                                %>" 
                                                alt="" >
                                    <% } %>--%>

                                <div class="text-start ps-4">
                                    
                                    <h2 class="mb-3"><%=rows["event_name"]%></h2>
                                    <h5 class="mb-3"><b>User name: </b><a href="OtherUserProfile.aspx?userid=<%=rows["user_id"]%>">@<%=rows["user_name"]%></a></h5>
                                    <h5 class="mb-3"><b>Organized by: </b><%=rows["organizer_name"]%></h5>
                                    <h5 style="text-align: left;  padding-right: 10px;"><%=rows["event_description"]%></h5>
                                <% if (!string.IsNullOrEmpty(rows["event_photo"].ToString()))
                                    {%>
                                    <img class="flex-shrink-0 img-fluid border rounded" src="
                                                <%= trimPath(rows["event_photo"].ToString())
                                                %>"
                                        alt="" style="width: auto; height: 100px; margin-bottom: 10px; text-align:left;">
                                    <% } %> 
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-4 d-flex flex-column align-items-start align-items-md-end justify-content-center">
                                <div class="d-flex mb-3">
                                    <a class="btn btn-primary" href="eventParticipate.aspx?event_id=<%=rows["event_id"]%>">Participate</a>
                                </div>
                                <span class="text-truncate me-3" style="font-size: 13px;"><b>Venue:</b> <%=rows["venue"]%></span>
                                <span class="text-truncate me-0" style="font-size: 13px;"><b>Event Time:</b> <%=rows["event_time"]%></span>

                            </div>
                            <div class="LargerDiv">
                                
                                <!-- <img src = "HomePage_images/about-1.jpg" style="width: 200px; height: 200px;"> -->
                            </div>
                        </div>
                    </div>
                    <% } %>
                </div>
            </div>           
    <script>
        function participate(){
        }
    </script>         
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="css/jobs_css/lib/wow/wow.min.js"></script>
    <script src="css/jobs_css/lib/easing/easing.min.js"></script>
    <script src="css/jobs_css/lib/waypoints/waypoints.min.js"></script>
    <script src="css/jobs_css/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="css/jobs_css/js/main.js"></script>
</body>
</html> 
<%} %>