using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using MySql.Data.MySqlClient; 

namespace STUDVERSE_TRY1
{
    public partial class new_post : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //MySqlConnection ConnectToDB()
        //{
        //    try
        //    {
        //        string ConnectionString = "server=127.0.0.1;uid=root;pwd=root;database=studverse";
        //        MySqlConnection conn = new MySqlConnection(ConnectionString);
        //        return conn;
        //    }
        //    catch (Exception error)
        //    {
        //        return null;
        //    }
        //}

        protected void set_Click(object sender, EventArgs e)
        {
       //     Response.Write(FileUpload1.FileName);



       //     try
       //     {
       //         using (MySqlConnection connection = ConnectToDB())
       //         {
       //             connection.Open();

       //             // Upload image to server
       //             string targetDir = Server.MapPath("~/uploads/");



       //             if (FileUpload1.FileName != null)
       //             {
       //                 /* CREATE TABLE pizzas 
       //                 id INT AUTO_INCREMENT PRIMARY KEY,
       //                 pizaa_type VARCHAR(10),
       //                   name VARCHAR(100),
       //                    price INT,
       //                     desc varchar(5000),
       //                 img_path VARCHAR(5000)
       //-> );*/
       //                 string targetFile = targetDir + FileUpload1.FileName;

       //                 string desc = description.Text;
       //                 //Request.Files["image"].SaveAs(targetFile);
       //                 FileUpload1.SaveAs(targetFile);

       //                 DateTime currentTime = DateTime.Now;
       //                 string formattedTime = currentTime.ToString();

       //                 // Insert image path into database
       //                 //INSERT INTO posts (post_image, post_description, post_time) VALUES ('image.png', 'This is a sample post description.', '2023-03-24 15:30:00');

       //                 string sql = "INSERT INTO post (img_path, description,time) VALUES (@path,@desc,@time)";
       //                 MySqlCommand cmd = new MySqlCommand(sql, connection);
       //                 cmd.Parameters.AddWithValue("@path", targetFile);
       //                 cmd.Parameters.AddWithValue("@desc", desc);
       //                 cmd.Parameters.AddWithValue("@time", formattedTime);
       //                 cmd.ExecuteNonQuery();


       //                 Response.Write("Image saved successfully.");
       //                 Response.Redirect("post.aspx");
       //             }
       //             else
       //             {
       //                 Response.Write("No image selected.");
       //             }



       //             connection.Close();
       //         }
       //     }
       //     catch (Exception ex)
       //     {
       //         Response.Write("Error: " + ex.Message);
       //     }
        }
    }
}