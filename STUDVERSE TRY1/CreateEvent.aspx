<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateEvent.aspx.cs" Inherits="STUDVERSE_TRY1.CreateEvent" %>
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
            if (connection != null)
                connection.Close();
        }
        catch (Exception error)
        { }
    }
    void InsertIntoEventTable(FileUpload fileUploadControl, string EventTitle, string EventDescription, string OrganizerName, DateTime EventTime, string Venue, string Contact1, string Contact2, string Email1, string Email2)
    {
        try
        {
            if (Session["user_name"] != null && (int)Session["user_name"] != -1)
            {
                String userID = Session["user_name"].ToString();
                MySqlConnection connection = ConnectToDB();
                connection.Open();
                string query = "insert into tbl_event(" +
                            "event_name," +
                            "event_description," +
                            "organizer_name," +
                            "venue," +
                            "email_address_1," +
                            "email_address_2," +
                            "contact_number_1," +
                            "contact_number_2," +
                            "event_time," +
                            "organizing_member_id," +
                            "created_by," +
                            "modified_by)" +
                "values('" + EventTitle + "','" + EventDescription + "','" + OrganizerName + "','" + Venue + "','" + Email1 + "','" + Email2 + "','" + Contact1 + "','" + Contact2 + "','" + EventTime.ToString("yyyy-MM-dd HH:mm:ss") + "'," + userID + "," + userID + "," + userID + ")";
                MySqlCommand command = new MySqlCommand(query, connection);

                Response.Write(query + "<br>");
                if (command.ExecuteNonQuery() != 0)
                {
                    long EventID = command.LastInsertedId;
                    if (fileUploadControl.FileName != null && fileUploadControl.FileName != "")
                    {
                        string enrollment_number = Session["enrollment_number"].ToString();
                        string path = Server.MapPath("Uploads//" + userID + "-User-" + enrollment_number + "//" + fileUploadControl.FileName);
                        path = path.Replace("\\", "/");
                        string Pattern = "(\\.png$)|(\\.jpg)|(\\.jpeg)";
                        Regex rx = new Regex(Pattern);

                        if (fileUploadControl.FileName != null && fileUploadControl.FileName != "")
                        {
                            if (rx.IsMatch(fileUploadControl.FileName))
                            {
                                query = "update tbl_event set Event_Photo = '" + path + "' where event_id  = " + EventID + "";
                                command.CommandText = query;
                                command.ExecuteNonQuery();
                                fileUploadControl.SaveAs(path);
                            }
                            else
                                Response.Write("<script>if(confirm('only image files allowed')) document.location = 'homePage.aspx';else  document.location = 'homePage.aspx';</script>");
                        }
                    }
                    Response.Redirect("homePage.aspx");
                }
                else
                    Response.Write("<script>if(confirm('server error please retry')) document.location = 'homePage.aspx';else  document.location = 'homePage.aspx';</script>");

                CloseConnection(ref connection);
            }
            else
                Response.Write("<script>if(confirm('Not in session')) document.location = 'LogOutSession.aspx';else  document.location = 'LogOutSession.aspx';</script>");
        }
        catch (Exception error)
        {
            Response.Write(error.Message);
        }
    }

    if (Session["user_id"] == null || Session["enrollment_number"] == null || Session["user_type"] == null ||
    Session["user_id"].ToString() == "-1" || Session["enrollment_number"].ToString() == "-1" || Session["user_type"].ToString() == "-1")
        Response.Write("<script>alert('not in session');document.location.href='LogOutSession.aspx'</script>");
    else
    {

        if (Request["submit"] != null)
        {
            string title = Request["title"];
            string description = Request["description"];
            string organizer = Request["organizer"];
            DateTime time = DateTime.Parse(Request["time"]);
            string venue = Request["venue"];
            string contact1 = Request["contact1"];
            string email1 = Request["email1"];
            string contact2 = Request["contact2"];
            string email2 = Request["email2"];

            if
            (
                !string.IsNullOrEmpty(title) &&
                !string.IsNullOrEmpty(description) &&
                !string.IsNullOrEmpty(organizer) &&
                (time != null && time.ToString() != "") &&
                !string.IsNullOrEmpty(venue) &&
                !string.IsNullOrEmpty(contact1) &&
                !string.IsNullOrEmpty(email1) &&
                !string.IsNullOrEmpty(contact2) &&
                !string.IsNullOrEmpty(email2)
            )
                InsertIntoEventTable(FileUpload1, title, description, organizer, time, venue, contact1, contact2, email1, email2);
            else
                Response.Write("<script>alert('some fields were empty')</script>");
        }

%>




<html lang="en">

<head>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/js/bootstrap.min.js"
        integrity="sha384-a5N7Y/aK3qNeh15eJKGWxsqtnX/wWdSZSKp+81YjTmS15nvnvxKHuzaWwXHDli+4"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css"
        integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="CreatePostCss.css">
</head>

<body>

    <div class="row comment-box-main-event p-4 rounded-bottom">
        <a href="homePage.aspx"> <img class="BackButton" src="Images/BackButton.png"> </a>
        <h3 class="ChatTitle"> Create Event </h3>
    </div>


    <div class="chattingWindow">
        <div class="ChatWin">
            <div class="container">
                <form class="form-horizontal" action = "#" runat="server" method = "post" enctype = "multipart/form-data">
                    <div class="form-group">
                        <label for="focusedInput fw-bold">Event Title</label>
                        <input class="form-control" id="title" runat="server" placeholder="Event title here..." type="text" name = "eventtitle">
                    </div>
                    <div class="form-group">
                        <label for="focusedInput">Event Description</label>
                        <textarea class="form-control" id="description" runat="server" placeholder="Event description..." cols="100" name = "eventdescription"
                            rows="5">
                        </textarea>
                    </div>
                    <div class="form-group">
                        <label for="focusedInput fw-bold">Organiser Name</label>
                        <input class="form-control" id="organizer" runat="server" placeholder="Organiser name" type="text" name = "organizername">
                    </div>
                    <div class="form-group">
                        <label for="focusedInput fw-bold">Event Time</label>
                        <input class="form-control" id="time" runat="server" type="date" name = "eventtime">
                    </div>
                    <div class="form-group">
                        <label for="focusedInput fw-bold">Event Venue</label>
                        <input class="form-control" id="venue" runat="server" placeholder="Event Venue" type="text" name = "venue">
                    </div>
                    <div class="form-group">
                        <label for="focusedInput fw-bold">Contact Number 1</label>
                        <input class="form-control" id="contact1" runat="server" placeholder="Contact number" type = "text" name = "contactnumber1">
                    </div>
                    <div class="form-group">
                        <label for="focusedInput fw-bold">Email Address 2</label>
                        <input class="form-control" id="email1" runat="server" placeholder="Email Address" type="email" name = "emailaddress1">
                    </div>
                    <div class="form-group">
                        <label for="focusedInput fw-bold">Contact Number 2</label>
                        <input class="form-control" id="contact2" runat="server" placeholder="Contact number" type = "text" name = "contactnumber2">
                    </div>
                    <div class="form-group">
                        <label for="focusedInput fw-bold">Email Address 2</label>
                        <input class="form-control" id="email2" runat="server" placeholder="Email Address" type="email" name = "emailaddress2">
                    </div>
                    <div class="form-group">
                        <label for="focusedInput fw-bold">Attach some media</label>
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                    </div>
                    <br>
                    <input class="submitbtnevent" ID="submit" type="submit" runat="server" value =" Post!">
                </form>
            </div>
            </form>
        </div>
    </div>
    <script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="js/lightbox.js"></script>
    <script type="text/javascript" src="js/all.js"></script>
    <script type="text/javascript" src="js/isotope.pkgd.min.js"></script>
    <script type="text/javascript" src="js/owl.carousel.js"></script>
    <script type="text/javascript" src="js/jquery.flexslider.js"></script>
    <script type="text/javascript" src="js/jquery.rateyo.js"></script>
    <script type="text/javascript" src="js/custom.js"></script>
</body>
<script src='https://cdnjs.cloudflare.com/ajax/libs/vue/0.12.14/vue.min.js'></script>

</html>
<%} %>
