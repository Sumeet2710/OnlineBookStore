using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class eg : System.Web.UI.Page
{
    SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["OBSConnectionString"].ConnectionString);
   
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindCategory();
        }

        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["OBSConnectionString"].ConnectionString);
        try
        {
            myConnection.Open();
            //    SqlCommand cmd = new SqlCommand("SELECT  [BName], [BAuthor], [BPrice], [BSPrice], [BImage], [BExtension] FROM [dbo].[Tbl3_Books]", myConnection);
            SqlCommand cmd = myConnection.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT [BID], [BName], [BAuthor], [BPrice], [BSPrice], [BImage], [BExtension], [BDisc] FROM [dbo].[Tbl3_Books] ORDER BY BID DESC";
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
    protected void dropCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        var query = "";
        var selectbook = dropCategory.SelectedItem.Value.ToString();

        //  Response.Write("<script>alert('"+selectbook+"')</script>");
        if (selectbook == "0")
        {


            query = "";
        }
        else
        {
            query = "where BCatID ='" + selectbook + "' ";
        }
        SqlDataAdapter sda = new SqlDataAdapter("SELECT [BID], [BName], [BAuthor], [BPrice], [BSPrice], [BImage], [BExtension], [BDisc] FROM [dbo].[Tbl3_Books] " + query + " ", myConnection);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        try
        {
            if (selectbook == dt.Rows[0][4].ToString())
            {

            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('No Books Found')</script>");
        }
        RepeatBooks.DataSourceID = null;
        RepeatBooks.DataSource = dt;
        RepeatBooks.DataBind();


    }
    private void BindCategory()
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["OBSConnectionString"].ConnectionString);
        myConnection.Open();
        SqlCommand cmd = new SqlCommand("Select * from [dbo].[Tbl2_Category]", myConnection);
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        dropCategory.BorderStyle = BorderStyle.None;

        if (dt.Rows.Count != 0)
        {
            dropCategory.DataSource = dt;
            dropCategory.DataTextField = "CatName";
            dropCategory.DataValueField = "CatID";
            dropCategory.DataBind();
            dropCategory.Items.Insert(0, new ListItem("All Books", "0"));
        }

    }
}