<%@ Page Language="C#" %>

<%@ Import Namespace="MySql.Data.MySqlClient" %>
<%@ Import Namespace="System" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Data" %>
<%--CREATE TABLE post(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  description VARCHAR(5000),
  img_path VARCHAR(5000),
  time VARCHAR(255)
);--%>

<style>
    @keyframes wave-animation {
  0% {
    background-position: 0% 50%; /* start position */
  }
  100% {
    background-position: 100% 50%; /* end position */
  }
}

/* apply the animation to the body element */
body {
  background: linear-gradient(-45deg, #92e3a9, #1c5375, #ffffff);
  background-size: 400% 400%;
  animation: wave-animation 10s ease-in-out infinite;
}
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
%>
 <div style="background-color: #f1f1f1; padding: 10px; border: 1px solid #ccc; border-radius: 5px;">
  <center><h2 style="color: #333; font-size: 24px; font-weight: bold;  ">Public Post</h2></center>
<%
    try
    {
        MySqlConnection connection = ConnectToDB();
        connection.Open();
        string Sql = "select * from post";
        MySqlDataAdapter adp = new MySqlDataAdapter(Sql,connection);
        DataTable dt = new DataTable();
        adp.Fill(dt);
        foreach (DataRow row in dt.Rows)
        { 
           

        %>


  
</div>
          
<div class="post-container">

  <img src="<%=trimPath(row["img_path"].ToString())%>" alt="<%=trimPath(row["img_path"].ToString())%>" class="post-image">
  <div class="post-details">
    <h5 class="post-order"><%=row["time"] %></a></h5>
  <p class="post-description" style="align-items:flex-start"><%=row["description"] %></p>
  </div>
</div>
        <%
        }
        connection.Close();
    }
    catch (Exception error) { Response.Write(error.Message); }
 %>