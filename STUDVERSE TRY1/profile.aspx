<%@ Page Language="C#"  %>

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
            string ConnectionString = "server=127.0.0.1;uid=root;pwd=root;database=studverse";
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

    if (Session["user_name"] == null )
        Response.Write("<script>alert('not in session');document.location.href='login.aspx'</script>");
    else
    {

%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="css/HomePage_css/all.css">
    <link rel="stylesheet" type="text/css" href="css/HomePage_css/all.min.css">
    <link rel="stylesheet" type="text/css" href="css/HomePage_css/lightbox.css">
    <link rel="stylesheet" type="text/css" href="css/HomePage_css/flexslider.css">
    <link rel="stylesheet" type="text/css" href="css/HomePage_css/owl.carousel.css">
    <link rel="stylesheet" type="text/css" href="css/HomePage_css/owl.theme.default.css">
    <link rel="stylesheet" type="text/css" href="css/HomePage_css/jquery.rateyo.css" />
    <link rel="stylesheet" type="text/css" href="inner-page-style.css">
    <link rel="stylesheet" type="text/css" href="HomePage_style.css">
    <link href="https://fonts.googleapis.com/css?family=Raleway:400,500,600,700" rel="stylesheet">
    <link rel="stylesheet" href="css/themify-icons.css">
    <link rel="stylesheet" href="css/HomePage_css/johndoe.css">
    <title>Document</title>
    <style>
        body{
            background-color: rgb(239, 244, 253);
        }
        .btn-primary {
        color: #fff;
        background-color: #1c3961;
        border-color:1 px solid #fff;
        border-radius:10px;
        font-size:medium;
    }

    .btn-primary {
    color: #fff;
    background-color: #1c3961;
    border-color: #fff;
}

.btn-primary:hover {
        color: #1c3961;
        background-color: transparent;
        border-color:1 px solid #1c3961;
        border-radius:10px;
        font-size:medium;
    }
    .btn-primary:hover {
        color: #1c3961;
        background-color: transparent;
        border-color: 2px solid #1c3961;
        border-radius:10px;
}
.nav-pills .nav-link {
        border-radius: 0.25rem;
        font-size: large;
        }
        a {
            margin-top:3px;
        color: #1c3961;
        text-decoration: none;
        background-color: transparent;
        }
        a:visited{
            color:#1c3961;
        }
        a:hover{
            color:#1c3961;
        }
        .nav-pills .nav-link.active, .nav-pills .show>.nav-link {
        color: #fff;
        /* background-color: #F85C70; */
        border: 1px solid #fff;
        margin-top:10px;
        background-color: #1c3961;
        background-color: none;
        border-radius:10px;
        }
   
    </style>
</head>

<body>
  
    <div class="container-fluid">
        <div class="container" style="background-color: rgb(239, 244, 253);">
        <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true">Personal Info</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="pills-profile-tab"  href="logout.aspx" >logout</a>
            </li>
          
        </ul>
            <div class="tab-content" id="pills-tabContent">
                <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
                <div class="card-body pb-2">
                            <%
                                DataRow GetUserData()
                                {
                                    try
                                    {
                                        if (Session["user_name"] != null )
                                        {
                                            string username = (String)Session["user_name"];
                                            int userID = Convert.ToInt32(Session["user_id"]);
                                            Response.Write(username);
                                            MySqlConnection connection = ConnectToDB();
                                            connection.Open();
                                            //string query = "select tbl_user.enrollment_number," +
                                            //                "tbl_user.user_name," +
                                            //                "tbl_user.gender," +
                                            //                "tbl_user.profile_photo_path," +
                                            //                "tbl_user.contact_number," +
                                            //                "tbl_user.email_id," +
                                            //                "tbl_user.date_of_birth," +
                                            //                "tbl_user.experience," +
                                            //                "tbl_user.current_company_working_in," +
                                            //                "tbl_batch.batch_name," +
                                            //                "tbl_job_title.job_title," +
                                            //                "tbl_place_of_work.place_of_work" +
                                            //                " from tbl_user,tbl_batch,tbl_place_of_work,tbl_job_title " +
                                            //                " where " +
                                            //                    "tbl_user.user_id = " + userID + " and " +
                                            //                    "tbl_user.batch_id = tbl_batch.batch_id and " +
                                            //                    "tbl_user.place_of_work_id = tbl_place_of_work.place_of_work_id and " +
                                            //                    "tbl_user.job_title_id = tbl_job_title.job_title_id and " +
                                            //                    "tbl_user.is_enabled = 'y';";

                                            string query = "select * from student where username = '" + username + "'";
                                            //Response.Write("<br><br>"+query+"<br><br>");
                                            MySqlDataAdapter adp = new MySqlDataAdapter(query, connection);
                                            DataTable ResultTable = new DataTable();
                                            adp.Fill(ResultTable);
                                            DataRow row = ResultTable.Rows[0];
                                            connection.Close();
                                            return row;
                                        }
                                        else
                                        {
                                            Response.Write("<script>alert('not in session');window.open('LogOutSession.aspx','_blank').focus();window.close();</script>");
                                            return null;
                                        }
                                    }
                                    catch (Exception error)
                                    {
                                        Response.Write(error.Message);
                                        return null;
                                    }
                                }
                                %>
                                <ul class="mt40 info list-unstyled">
                                    
                                <% DataRow UserRow = GetUserData(); %>
                              

                                <li><span class="details">Enrollment Number</span> : <%=UserRow["enrollment_no"]%></li>
                                           <li><span class="details">Full Name</span> : <%=UserRow["fullname"]%></li>
                                <li><span class="details">User Name</span> : <%=UserRow["username"]%></li>
                              
                                <li><span class="details">Email Address</span> : <%=UserRow["email"]%></li>
                                
                               
                            </ul>
                            <hr>
                        

                </div>
                </div>            
            </div>
        </div>
    </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script type="text/javascript" src="HomePage_js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="HomePage_js/lightbox.js"></script>
    <script type="text/javascript" src="HomePage_js/all.js"></script>
    <script type="text/javascript" src="HomePage_js/isotope.pkgd.min.js"></script>
    <script type="text/javascript" src="HomePage_js/owl.carousel.js"></script>
    <script type="text/javascript" src="HomePage_js/jquery.flexslider.js"></script>
    <script type="text/javascript" src="HomePage_js/jquery.rateyo.js"></script>
    <script type="text/javascript" src="HomePage_js/custom.js"></script>
    <script>
        function openNav() {
            document.getElementById("mySidepanel").style.width = "250px";
        }

        function closeNav() {
            document.getElementById("mySidepanel").style.width = "0";
        }
    </script>
</body>

</html><%} %>

