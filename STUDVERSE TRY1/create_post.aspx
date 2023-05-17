<%@ Page Language="C#" %>

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
     <link rel="stylesheet" href="./css/admin.css">
    <link rel="stylesheet" href="./css/profile.css">
    <link href="./css/bootstrap.min.css" rel="stylesheet">
	<link href="./css/main.css" rel="stylesheet">
    <!-- Boxicons CDN Link -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    
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
  @keyframes wave-animation {
  0% {
    background-position: 0% 50%; /* start position */
  }
  100% {
    background-position: 100% 50%; /* end position */
  }
}

/* apply the animation to the body element */

    .post-container {
        display: flex;
        width: 800px;
        justify-content: space-between;
      position:center;  
      margin: auto;
        background-color: #f8f9fa;
        border: 1px solid #dee2e6;
        border-radius: 5px;
        padding: 10px;
        margin-bottom: 10px;
    }

    .post-image {
        width: 450px;
        height: 255px;
        object-fit: cover;
    }
.post-description {
  //margin: 0;
  margin-bottom: 0px;
    font-size:1.2rem;
   padding-left:10px;
}

.post-order {
  font-size: 1.2rem;
    position:initial;
   padding-left:10px;
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

    if (Request["Submit2"] != null)
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
                  
                    string desc = Request["description"];
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

    <section>

       <form method="post" action="#"  runat="server" enctype="multipart/form-data" style="font-family: Arial, sans-serif; font-size: 14px; color: #333; border: 1px solid #6c63ff; padding: 20px;">

    DESCRIPTION : <input type="text" ID="description" runat="server" style="margin-bottom: 10px; padding: 10px; border: 1px solid #6c63ff; width: 100%; color: #333;" >

    IMAGE : <asp:FileUpload ID="FileUpload1" runat="server" style="margin-bottom: 10px;" /><br><br>

    <input type="submit" id="Submit2" runat="server" style="background-color: #6c63ff; border: none; color: white; padding: 12px 28px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px; margin-top: 10px; cursor: pointer; border-radius: 5px;" />

</form>
        <div style="background-color: #f1f1f1; padding: 10px; border: 1px solid #ccc; border-radius: 5px;">
  <h2 style="color: #333; font-size: 24px; font-weight: bold;">Public Post</h2>
  
</div>

          </section>
   
    <Section style="background: linear-gradient(-45deg, #92e3a9, #1c5375, #ffffff);
  background-size: 400% 400%;
  animation: wave-animation 10s ease-in-out infinite">
</style> >
       <%
    try
    {
    string trimPath(string Path)
    {
        try
        {
            if (Path != null)
            {
                string[] separatedPath = Path.Split('\\');
                string FinalPath = "uploads" + "\\" + separatedPath[separatedPath.Length - 1];
                return FinalPath;
            }
            return "";
        }
        catch (Exception error)
        {
            return "";
        }
    }
        MySqlConnection connection = ConnectToDB();
        connection.Open();
        string Sql = "select * from post";
        MySqlDataAdapter adp = new MySqlDataAdapter(Sql,connection);
        DataTable dt = new DataTable();
        adp.Fill(dt);
        foreach (DataRow row in dt.Rows)
        { 
           
        %>
          
<div class="post-container">
  <img src="<%=trimPath(row["img_path"].ToString())%>" alt="<%=trimPath(row["img_path"].ToString())%>" class="post-image">
  <div class="post-details">
    <h5 class="post-order"><%=row["time"] %></a></h5>
  <p class="post-description" style="align-items:flex-start"><%=row["description"] %></p>
    <% String id = row["id"].ToString();
    Response.Write("<a id='dele' href='dele.aspx?pid="+id+"' style='color: red; font-weight: bold;' runat='server'>delete</a>");%>

  </div>
</div>
        <%
        }
        connection.Close();
    }
    catch (Exception error) { Response.Write(error.Message); }
 %>
        </Section>
        

</body>

</html>

