<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Chat.aspx.cs" Inherits="STUDVERSE_TRY1.Chat" %>
<%@Import Namespace="MySql.Data.MySqlClient" %>
<%@Import Namespace="System" %>
<%@Import Namespace="System.IO" %>
<%@Import Namespace="MySql.Data.MySqlClient" %>
<%@Import Namespace="System.Data" %>
<%@Import Namespace="System.Security.Cryptography" %>
<%@Import Namespace="System.Text.RegularExpressions" %>
<%@Import Namespace="System.Net.Mail"%>

<html>
    <head>
        <title>chats</title>
        <link rel="stylesheet" href="chat.css">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <script src="jquery.js"></script>
        <style>
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
                background-color: #F5F5F5;
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

        </style>
    </head>
    <body>
        <form>
           
           

            <%
                // written by Rishit selia 
                // when entering into chat session the chat_name is sent through get method
                // then post method is used so to determine chat_name common chat_name var is used

                string chat_name = "";
                string sendername = "";

                if (Request.Form["Chat_name"] != null)
                {
                    chat_name = Request.Form["Chat_name"];
                     Session["chat"] = chat_name;
                    sendername = (string)Session["user_name"];
                }
                else if (Request.QueryString["Chat_name"] != null)
                    chat_name = Request.QueryString["Chat_name"];
                else
                    Response.Write("chat name not provided");
%>
            <div class="center">
                 <h1> 
                  <h1><%= chat_name %></h1>
                     </h1>


                <div class="scroll" id="style-4">



                    <table class="showChats">
                        <tr>
                            <td id="data"><%
string chat = Request["Chat_name"];
string connString = "Server=localhost;Database=studverse;User=root;Password=root";
string output = "";

using (MySqlConnection conn = new MySqlConnection(connString))
{
    string sql = "SELECT * FROM " + chat;
    MySqlCommand cmd = new MySqlCommand(sql, conn);

    conn.Open();

    output += "<table>";
    output += "<tr>";
    output += "<th>sender</th>"; 
    output += "<th id=\"msg\">message</th>";
    output += "</tr>";

    using (MySqlDataReader reader = cmd.ExecuteReader())
    {
        while (reader.Read())
        {
            output += "<tr>";
            output += "<td>" + reader["sender_name"].ToString() + "</td>";
            output += "<td style='color:gray;'>" + reader["content"].ToString() + "</td>";
            output += "</tr>";
        }
    }

    output += "</table>";
}

Response.Write(output);
%>
                            </td>
                        </tr>
                    </table>  





                    <!--
                    <?php
//                        $conn = mysqli_connect('localhost', 'root', '', 'chats');
//                        $sql = "select * from $chat_name";
//                        $message_display = mysqli_query($conn, $sql);
//                        if ($message_display->num_rows > 0) {
//                            while ($row = $message_display->fetch_assoc()) {
//                                echo "<tr>";
//                                echo "<td>" . $row['sender_name'] . "</td>";
//                                echo "<td>" . $row['content'] . "</td>";
//                                echo "</tr>";
//                            }
//                            echo "</table>";
//                        } else {
//                            echo "0 results";
//                        }
//                        mysqli_close($conn);
                    $chat="go";
                      session_start();
                        $sendername = $_SESSION['user_name'];
                        
                   // $name="mohit";
                    ?>
                    <?php
//                        date_default_timezone_set('Asia/Kolkata');
//                        $date = date('h:i:s');
                    //echo $date;
                    ?>  -->    


                </div>


                <div class="txt_field">
                    <input type="hidden" name="Chat_name" id="Chat_name" value="<%=chat_name %>" >
                    <input type="text" placeholder="enter message" name="message" id="message"  minlength="1" autocomplete="off" >
                    <label></label></div>
                <input type = "submit" name = "send" id="send" runat="server" value="Send" onclick=""  >
             <%


                 if (Request["send"]!=null)
                 {
                     string message = Request["message"];
                     string chatName = Request["Chat_name"];
                     string senderName = (string)Session["user_name"];
                     string connStr = "Server=localhost;Database=studverse;User=root;Password=root";
                     int result = 0;

                     using (MySqlConnection conn = new MySqlConnection(connStr))
                     {
                         string query = "INSERT INTO " + chatName + " (sender_name, content) VALUES ('" + senderName + "', '" + message + "')";
                         MySqlCommand cmd = new MySqlCommand(query, conn);
                         //Response.Write(query);
                         conn.Open();
                         result = cmd.ExecuteNonQuery();

                     }
                 }
                 %>

   
            </div>



            <!-- input form -->


        </form>

    </body>
</html>

