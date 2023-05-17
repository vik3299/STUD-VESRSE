<%@ Language="C#" %>
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
    } %>
<!DOCTYPE html>
<!--

-->
<html>
    <head>
        <meta charset="UTF-8">
        <title>chats room</title>
         <link rel="stylesheet" href="./css/admin.css">
    <link rel="stylesheet" href="./css/profile.css">
    <link href="./css/bootstrap.min.css" rel="stylesheet">
	<link href="./css/main.css" rel="stylesheet">
    <!-- Boxicons CDN Link -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>

        <link rel="stylesheet" href="chat.css">

<style>
    @media (max-width: 1240px) .sidebar {
        /* width: 60px; */
    }
            div.scroll {
                margin:3px 4px;
                padding: 4px;
                width: 733px;
                height: 210px;
                overflow-x: hidden;
                overflow-y: auto;
                text-align: justify;
                display: flex;
                flex-direction: column-reverse;
            }
            #style-4::-webkit-scrollbar-track
            {
                -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.2);
                background-color: ;
            }
            #style-4::-webkit-scrollbar
            {
                width: 10px;
                background-color: #F5F5F5;
            }

            #style-4::-webkit-scrollbar-thumb
            {
                background-color: gray;
                border: 2px solid gray;
            }

            table {
                border: 1px solid #ccc;
                border-collapse: collapse;
                margin: 0;
                padding: 0;
                width:auto;
                table-layout: fixed;
            }

            table caption {
                font-size: 1.5em;
                margin: .5em 0 .75em;
            }

            table tr {
                background-color: #f8f8f8;
                border: 1px solid #ddd;
                padding: .35em;
            }

            table th,
            table td {
                padding: .625em;
                text-align: left;
            }

            table th {
                font-size: .85em;
                letter-spacing: .1em;
                text-transform: uppercase;
            }

            @media screen and (max-width: 600px) {
                table {
                    border: 0;
                }
                .stylebtn
                {
                    float: right;
                }
                table caption {
                    font-size: 1.3em;
                }

                table thead {
                    border: none;
                    clip: rect(0 0 0 0);
                    height: 1px;
                    margin: -1px;
                    padding: 0;
                    width: 1px;
                }
                table tr {
                    border-bottom: 3px solid #ddd;
                    margin-bottom: .625em;
                }
                table td {
                    border-bottom: 1px solid #ddd;
                    font-size: .8em;
                    text-align: right;
                }
                table td::before {
                    content: attr(data-label);
                    float: left;
                    font-weight: bold;
                    text-transform: uppercase;
                }
                table td:last-child {
                    border-bottom: 0;
                }
            }
            body {
                font-family: "Open Sans", sans-serif;
                line-height: 1.25;
            }

            .curtainup{
                transform-style: preserve-3d;
            }

            .curtainup:before,
            .curtainup:after{
                transform-origin: center center;
                transform: scale(1,0);
            }


            .curtainup:hover:before,
            .curtainup:hover:after{
                transform: scale(1);
                border-radius: 0;
            }

            .showChats th {
                background-color: grey;
                color: white;
                font-weight: bold;
                position: sticky;
                top:-5px;
}
            #msg{
                width: 100%;
            }
            div.scroll {
                margin: 3px 4px;
                padding: 4px;
                width: 733px;
                height: 397px;
                overflow-x: hidden;
                overflow-y: auto;
                text-align: justify;
                display: flex;
                flex-direction: column-reverse;
            }

            .center {
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                width: 743px;
                height: 520px;
                background: white;
                border-radius: 10px;
                box-shadow: 10px 10px 15px rgb(0 0 0 / 5%);
            }
            #send{
                position: absolute;
                left: 91%;
                /* float: right; */
                /* margin-right: 15px; */
                /* margin-bottom: 5px; */
                color: snow;
                /* background-color: skyblue; */
                background-color: green;
                border: none;
                font-weight: 600;
                /* border-color: gray; */
                border-radius: 10px;
                padding: 5px 10px;
                top: 90.5%;
            }

        </style>   </head>

      
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
        <div class="center">

            <h1>all chat groups</h1>


            <div class="scroll" id="style-4">
                <center>
                    <table style="width:100%;text-align:center">
                        <%
                            if (Request["create"] != null)
                            {
                                // for checking if group chat already exists or not  
                                MySqlConnection connection = ConnectToDB();
                                try
                                {
                                    string chat_name = Request["chat_name"];
                                    //  connection = new SqlConnection("Data Source=localhost;Initial Catalog=Chats;Integrated Security=True;");
                                    connection.Open();
                                    string query = "select group_chat_id from tbl_group_chat where group_chat_name = '" + chat_name + "'";
                                    MySqlDataAdapter adp = new MySqlDataAdapter(query, connection);

                                    DataTable DT = new DataTable();
                                    adp.Fill(DT);
                                    int number_of_rows = DT.Rows.Count;
                                    if (number_of_rows == 1)
                                    {
                                        Response.Write("group chat already exists");
                                    }
                                    else
                                    {
                                        // when a new group chat is introduced then insert the new group chat name into the registry table
                                        query = "insert into tbl_group_chat(group_chat_name)values('" + chat_name + "')";
                                        MySqlCommand command1 = new MySqlCommand(query,connection);



                                        number_of_rows = command1.ExecuteNonQuery();
                                        if (number_of_rows != 1)
                                        {
                                            Response.Write("group chat already exists or server error :(");
                                        }
                                        else
                                        {
                                            // then create new table
                                            String query2 = "create table " + chat_name + "(" +
                                            "message_id int primary key auto_increment," +
                                            "sender_name varchar (200)not null," +
                                            "content varchar(15000) not null)";




                                            // if table creation query failed then delete the last inserted table name                            

                                            MySqlCommand command = new MySqlCommand(query2,connection);
                                            int affected_rows = command.ExecuteNonQuery();
                                            Response.Write(affected_rows);
                                            if (affected_rows != 0)
                                            {
                                                query = "delete from tbl_group_chat where group_chat_name = '"+ chat_name + "'";
                                                command.CommandText = query;
                                                command.ExecuteNonQuery();
                                                query = "drop table if exists " + chat_name + "";
                                                command.CommandText = query;
                                                command.ExecuteNonQuery();
                                                Response.Write("error while creation of chat group");
                                            }
                                            else
                                            {
                                                Response.Write("group chat created successfully");
                                            }
                                        }
                                    }
                                }
                                catch (MySqlException e)
                                {
                                    Response.Write("Database connection error: " + e.Message);
                                }
                            }

%>
<%
    void DisplayChatGroups()
    {
        // for displaying all group chat names here
        MySqlConnection connection = ConnectToDB();
        try
        {
            connection.Open();
            string query2 = "select * from tbl_group_chat";
            MySqlCommand command2 = new MySqlCommand(query2, connection);
            MySqlDataReader reader2 = command2.ExecuteReader();
            if (reader2.HasRows)
            {
                while (reader2.Read())
                {
                    Response.Write("<tr>");
                    Response.Write("<td><a href=\"Chat.aspx?Chat_name=" + reader2.GetString(reader2.GetOrdinal("group_chat_name")) + "\">" + reader2.GetString(reader2.GetOrdinal("group_chat_name")) + "</a><br></td>");
                    Response.Write("</tr>");
                }
            }
            else
            {
                Response.Write("No group chat names found.");
            }
            reader2.Close();
        }
        catch (MySqlException e)
        {
            Response.Write("Database connection error: " + e.Message);
        }
        finally
        {
            connection.Close();
        }
    }
    DisplayChatGroups();
%>        


               
           <div class="txt_field">
              <form method="post">
            Chat group name:<input type="text" id="chat_name" runat="server" name="chat_name" /><br>
            <input type="submit" name="create" id="create" runat="server"/>
              </form> </div>  
         
     
              
                   
        
              </table>
                </center>
            </div>
        </div>
               
       
    </body>   
</html>

