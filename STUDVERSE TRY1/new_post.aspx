<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="new_post.aspx.cs" Inherits="STUDVERSE_TRY1.new_post" %>
<%@ Import Namespace="MySql.Data.MySqlClient" %>
<%@ Import Namespace="System" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Globalization" %>

<!DOCTYPE html>
<head runat="server">
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Stud - verse</title>
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
    <link rel="stylesheet" href="./css2/style.css">
    <!--Google Fonts  -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
     <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;500;600;700;800;900&display=swap" rel="stylesheet">
    
<%--
    
mysql> desc tbl_group_chat;
+-----------------+-------------+------+-----+---------+----------------+
| Field           | Type        | Null | Key | Default | Extra          |
+-----------------+-------------+------+-----+---------+----------------+
| group_chat_id   | int         | NO   | PRI | NULL    | auto_increment |
| group_chat_name | varchar(80) | NO   | UNI | NULL    |                |
+-----------------+-------------+------+-----+---------+----------------+
2 rows in set (0.00 sec)

mysql> desc post;
+-------------+---------------+------+-----+---------+----------------+
| Field       | Type          | Null | Key | Default | Extra          |
+-------------+---------------+------+-----+---------+----------------+
| id          | int           | NO   | PRI | NULL    | auto_increment |
| description | varchar(5000) | YES  |     | NULL    |                |
| img_path    | varchar(5000) | YES  |     | NULL    |                |
| time        | varchar(255)  | YES  |     | NULL    |                |
+-------------+---------------+------+-----+---------+----------------+
4 rows in set (0.00 sec)

mysql> desc student;
+---------------+--------------+------+-----+---------+----------------+
| Field         | Type         | Null | Key | Default | Extra          |
+---------------+--------------+------+-----+---------+----------------+
| studentid     | int          | NO   | PRI | NULL    | auto_increment |
| fullname      | varchar(255) | YES  |     | NULL    |                |
| username      | varchar(255) | YES  |     | NULL    |                |
| password      | varchar(255) | YES  |     | NULL    |                |
| enrollment_no | varchar(255) | YES  |     | NULL    |                |
| email         | varchar(255) | YES  |     | NULL    |                |
+---------------+--------------+------+-----+---------+----------------+
6 rows in set (0.00 sec)

mysql> desc tbl_otp_information;
+-----------+--------------+------+-----+---------------------------------------------------+-------------------+
| Field     | Type         | Null | Key | Default                                           | Extra             |
+-----------+--------------+------+-----+---------------------------------------------------+-------------------+
| OTPID     | int          | NO   | PRI | NULL                                              | auto_increment    |
| userEmail | varchar(100) | NO   |     | NULL                                              |                   |
| OTPNUMBER | int          | YES  |     | lpad(floor((rand() * 999999.99)),6,_utf8mb4\'0\') | DEFAULT_GENERATED |
| time      | int          | YES  |     | 60                                                |                   |
| user_id   | int          | YES  | MUL | NULL                                              |                   |
+-----------+--------------+------+-----+---------------------------------------------------+-------------------+
5 rows in set (0.00 sec)
mysql>--%>

</head>
<style>
    form {
  display: flex;
  flex-direction: column;
  max-width: 500px;
  margin: 0 auto;
  font-size: 16px;
  line-height: 1.5;
}

label {
  margin-bottom: 10px;
  font-weight: bold;
}

input[type="submit"] {
  background-color: #4CAF50;
  border: none;
  color: white;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin-top: 20px;
  cursor: pointer;
}

input[type="submit"]:hover {
  background-color: #3e8e41;
}

input[type="file"] {
  margin-bottom: 20px;
}

input[type="text"], input[type="file"] {
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  width: 100%;
}

    </style>
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

    if (Request["set"] != null)
    {
        Response.Write(FileUpload1.FileName);



        try
        {
            using (MySqlConnection connection = ConnectToDB())
            {
                connection.Open();

                // Upload image to server
                string targetDir = Server.MapPath("~/uploads/");



                if (FileUpload1.FileName != null)
                {
                    /* CREATE TABLE pizzas 
                    id INT AUTO_INCREMENT PRIMARY KEY,
                    pizaa_type VARCHAR(10),
                      name VARCHAR(100),
                       price INT,
                        desc varchar(5000),
                    img_path VARCHAR(5000)
   -> );*/
                    string targetFile = targetDir + FileUpload1.FileName;
                  
                    string desc = description.Text;
                    //Request.Files["image"].SaveAs(targetFile);
                    FileUpload1.SaveAs(targetFile);

                    DateTime currentTime = DateTime.Now;
            string formattedTime = currentTime.ToString();
        
                    // Insert image path into database
                    //INSERT INTO posts (post_image, post_description, post_time) VALUES ('image.png', 'This is a sample post description.', '2023-03-24 15:30:00');

                    string sql = "INSERT INTO post (img_path, description,time) VALUES (@path,@desc,@time)";
                    MySqlCommand cmd = new MySqlCommand(sql, connection);
                    cmd.Parameters.AddWithValue("@path", targetFile);
                    cmd.Parameters.AddWithValue("@desc", desc);
                    cmd.Parameters.AddWithValue("@time", formattedTime);
                    cmd.ExecuteNonQuery();


                    Response.Write("Image saved successfully.");
                    Response.Redirect("post.aspx");
                }
                else
                {
                    Response.Write("No image selected.");
                }



                connection.Close();
            }
        }
        catch (Exception ex)
        {
            Response.Write("Error: " + ex.Message);
        }
    }
%>
<body>
    <%
    // Retrieve the "user_name" session variable from the previous page
    string username = (string)Session["user_name"];

    // Check if the user is logged in (i.e. "user_name" session variable is not null or empty)
    if ( username == "admin") {
        // User is logged in, display their username or other 
               string file = "navigation_a_login.aspx";
        // include the file
        Server.Execute(file);
    } else {
        // User is not logged in, redirect to the login page or display an error message
          string file = "nav.aspx";
        // include the file
        Server.Execute(file);
    }
%>

        <form method="post" enctype="multipart/form-data" runat="server" action>
          
 
            DESCRIPTION : <asp:TextBox ID="description" runat="server"></asp:TextBox>
 
            IMAGE : <asp:FileUpload ID="FileUpload1" runat="server" /><br><br>
            
            <asp:Button ID="set" runat="server" Text="post" OnClick="set_Click" />
        </form>
</body>

</html>

