using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_delete : System.Web.UI.Page
{
    SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["OBSConnectionString"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if(Request.QueryString["id"]==null)
        {
            Response.Redirect("deleteBooks.aspx");
        }
        else
        {
        try
        {
            myConnection.Open();
            SqlCommand cmd = myConnection.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "DELETE FROM [dbo].[Tbl3_Books] WHERE BID='" + Request.QueryString["id"] + "'";
            cmd.ExecuteNonQuery();
            Response.Write("<script language='javascript'>window.alert('Book Deleted Successfully');window.location='deleteBooks.aspx';</script>");
                   
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }
        }
    }
}