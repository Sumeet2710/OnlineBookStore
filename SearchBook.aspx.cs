using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SearchBook : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["OBSConnectionString"].ConnectionString);
        try
        {
            myConnection.Open();
         
            //    SqlCommand cmd = new SqlCommand("SELECT  [BName], [BAuthor], [BPrice], [BSPrice], [BImage], [BExtension] FROM [dbo].[Tbl3_Books]", myConnection);
            SqlCommand cmd = myConnection.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT [BID], [BName], [BAuthor], [BPrice], [BSPrice], [BImage], [BExtension], [BDisc] FROM [dbo].[Tbl3_Books] WHERE BName like '%'+@BName+'%'";
            cmd.Connection = myConnection;
            cmd.Parameters.AddWithValue("BName",Request.QueryString["result"]);

            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            sda.Fill(dt);
            RepeatBooks.DataSource = dt;
            RepeatBooks.DataBind();

            myConnection.Close();
        }
        catch (Exception ex)
        {
            Response.Write(ex + "Error");
        }

    }
}