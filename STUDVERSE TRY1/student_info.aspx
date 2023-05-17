<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="student_info.aspx.cs" Inherits="STUDVERSE_TRY1.student_info" %>
<%@ Import Namespace="MySql.Data.MySqlClient" %>
<%@ Import Namespace="System" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Data" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style>
   table {
        border-collapse: collapse;
        width: 100%;      }
      th {
        background-color: white;
        text-align: left;
        padding: 10px;
        font-size: 20 px;
      }
      td {
        text-align: left;
        padding: 10px;
        
      }
      tr:nth-child(even) {
        background-color: #424890;
        font-size: 15px;
        color: white;
      }
      tr:nth-child(odd) {

        font-size: 15px;
      }



    </style>
    <link rel="stylesheet" href="./css/admin.css">
    <link rel="stylesheet" href="./css/profile.css">
    <link href="./css/bootstrap.min.css" rel="stylesheet">

      <link rel="stylesheet" href="./css/admin.css">
    <link rel="stylesheet" href="./css/profile.css">
    <link href="./css/bootstrap.min.css" rel="stylesheet">
	<link href="./css/main.css" rel="stylesheet">
    <!-- Boxicons CDN Link -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>

    <title></title>
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

        <div class="sidebar" style="width:240px;">
    <div class="logo-details">
      
      <span class="logo_name">STUD-VERSE</span>
    </div>
      <ul class="nav-links">
        <li>
          <a href="profile.aspx" class="active">
            <i class='bx bx-grid-alt' ></i>
            <span class="links_name">Profile</span>
          </a>
        </li>
       
        <li>
           <a href="student_info.aspx">
            <i class='bx bx-list-ul' ></i>
            <span class="links_name">Student Information</span>

          </a>
        </li>
        <li>
          <a href="all_chats.aspx">
            <i class='bx bx-pie-chart-alt-2' ></i>
            <span class="links_name">Group Chat</span>
          </a>
        </li>
    
        <li>
          <a href="create_post.aspx">
            <i class='bx bx-book-alt' ></i>
            <span class="links_name">Community Post </span>
          </a>
        </li>
           <li>
          <a href="CreateEvent.aspx">
            <i class='bx bx-book-alt' ></i>
            <span class="links_name">Event</span>
          </a>
        </li>
        
       
        <li class="log_out">
          <a href="logout.aspx">
            <i class='bx bx-log-out'></i>
            <span class="links_name">Log out</span>
          </a>
        </li>
        <li>
          <a href="loged_view.aspx">
            <i class='' ></i>
            <span class="links_name">Home</span>
          </a>
        </li>
      </ul>
  </div>

<section class="home-section">


<br>

<br>
<br>
    <table border="5px" cellspacing="50px" cellpadding="50px" >

    
        <tr>
          <thead>
              <th>S_ID</th>
          <th>Enrollment Number</th>
                    <th>Name</th>
                    <th>Username</th>
                    <th>Email</th>
                    <th>Banned</th>
         
            <!-- <th colspan="2">Action</th> -->
          <thead>  
        </tr>

                </tr>
                <%
                    MySqlConnection ConnectToDB()
                    {
                        try
                        {
                            string ConnectionString = "server=127.0.0.1;uid=root;pwd=root;database=studverse";
                            MySqlConnection conn = new MySqlConnection(ConnectionString);
                            return conn;
                        }
                        catch (Exception error)
                        {
                            return null;
                        }
                    }


                    if (Request["banid"] != null)
                    {
                        MySqlConnection connection1 = ConnectToDB();
                        connection1.Open();
                        string sql = " update student set is_blocked = 'y' where studentid = " + Request["banid"] + "";
                        Response.Write(sql);
                        MySqlCommand comm = new MySqlCommand(sql,connection1);
                        comm.ExecuteNonQuery();
                        connection1.Close();
                        Response.Write("<script>window.open('student_info.aspx','_blank').focus();window.close();</script>");
                    }
                    else if (Request["unbanid"] != null)
                    {
                        MySqlConnection connection1 = ConnectToDB();
                        connection1.Open();
                        string sql = " update student set is_blocked = 'n' where studentid = " + Request["unbanid"] + "";
                        Response.Write(sql);
                        MySqlCommand comm = new MySqlCommand(sql,connection1);
                        comm.ExecuteNonQuery();
                        connection1.Close();
                        Response.Write("<script>window.open('student_info.aspx','_blank').focus();window.close();</script>");
                    }

                    %>





                    <%
                     MySqlConnection connection = ConnectToDB();
        connection.Open();
        string Sql = "select * from student";
        MySqlDataAdapter adp = new MySqlDataAdapter(Sql,connection);
        DataTable dt = new DataTable();
        adp.Fill(dt);
                    foreach (DataRow row in dt.Rows) { %>
    <tr>
        <td><%=row["studentid"] %></td>
        <td><%=row["enrollment_no"] %></td>
        <td><%=row["fullname"] %></td>
        <td><%=row["username"] %></td>
        <td><%=row["email"] %></td>
        <td><%=row["is_blocked"] %></td>
        <td><a href="student_info.aspx?banid=<%=row["studentid"] %>">ban</a></td>
        <td><a href="student_info.aspx?unbanid=<%=row["studentid"] %>">unban</a></td>
    </tr>
<% } %>
                       

            </table>
    
</body>
</html>
