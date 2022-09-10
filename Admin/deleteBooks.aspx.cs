using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_deleteBooks : System.Web.UI.Page
{
    SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["OBSConnectionString"].ConnectionString);
    
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["OBSConnectionString"].ConnectionString);
        try
        {
            myConnection.Open();
            //    SqlCommand cmd = new SqlCommand("SELECT  [BName], [BAuthor], [BPrice], [BSPrice], [BImage], [BExtension] FROM [dbo].[Tbl3_Books]", myConnection);
            SqlCommand cmd = myConnection.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT [BID], [BName], [BAuthor], [BPublish], [BPrice], [BSPrice], [BRelease],[BDescription], [BImage], [BExtension], [BDisc], [BCatName], [BISBN] FROM [dbo].[Tbl3_Books]";
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            sda.Fill(dt);
            RptTable.DataSource = dt;
            RptTable.DataBind();

            myConnection.Close();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('Something went Wrong')</script>");
        }
    }

    protected void addbook_Click(object sender, EventArgs e)
    {
        Response.Redirect("addBooks.aspx");
    }

}