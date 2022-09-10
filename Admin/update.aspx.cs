using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_update : System.Web.UI.Page
{
    SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["OBSConnectionString"].ConnectionString);
   
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["OBSConnectionString"].ConnectionString);

        if (!IsPostBack)
        {
            BindCategory();

            myConnection.Open();
            int bid = Convert.ToInt32(Request.QueryString["id"]);
            SqlCommand cmd = myConnection.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT * FROM [dbo].[Tbl3_Books] WHERE BID=" + bid + "";
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            sda.Fill(dt);
            foreach (DataRow dr in dt.Rows)
            {
                bookname.Text = dr["BImage"].ToString();
                bookauthor.Text = dr["BAuthor"].ToString();
                bookpublisher.Text = dr["BPublish"].ToString();
                bookdesc.Text = dr["BDescription"].ToString();
                bookisbn.Text = dr["BISBN"].ToString();
            }
        }
    }
    private void BindCategory()
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["OBSConnectionString"].ConnectionString);
        myConnection.Open();
        SqlCommand cmd = new SqlCommand("Select * from [dbo].[Tbl2_Category]", myConnection);
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);

        if (dt.Rows.Count != 0)
        {
            bookcategory.DataSource = dt;
            bookcategory.DataTextField = "CatName";
            bookcategory.DataValueField = "CatID";
            bookcategory.DataBind();
            bookcategory.Items.Insert(0, new ListItem("--Select--", "0"));
        }
    }
    protected void updateBooks_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["OBSConnectionString"].ConnectionString);
            int bid = Convert.ToInt32(Request.QueryString["id"]);
           

            myConnection.Open();

            if (bookimg.HasFile)
            {
                string SavePath = Server.MapPath("../images/Books/" + bookname.Text.ToString().Trim());
                if (!Directory.Exists(SavePath))
                {
                    Directory.CreateDirectory(SavePath);
                }
                string Extention = Path.GetExtension(bookimg.PostedFile.FileName);
                bookimg.SaveAs(SavePath + "\\" + bookname.Text.ToString().Trim() + Extention);

                decimal bdisc = (Convert.ToDecimal(bookprice.Text.ToString()) - Convert.ToDecimal(bookSprice.Text.ToString()));
                SqlCommand insertCommand = myConnection.CreateCommand();
                insertCommand.CommandType = CommandType.Text;
                insertCommand.CommandText = "UPDATE [dbo].[Tbl3_Books] SET BName='" + bookname.Text.ToUpper() + "', BISBN='" + bookisbn.Text + "', BAuthor='" + bookauthor.Text + "', BPublish='" + bookpublisher.Text + "',BCatID='" + bookcategory.SelectedItem.Value + "', BPrice='" + Convert.ToDecimal(bookprice.Text) + "', BSPrice='" + Convert.ToDecimal(bookSprice.Text) + "',BRelease='" + bookrelease.Text + "', BDescription='" + bookdesc.Text + "', BImage='" + bookname.Text.ToString().Trim() + "', BDisc='" + Convert.ToDecimal(bdisc) + "', BCatName='" + bookcategory.SelectedItem.ToString() + "' WHERE BID=" + bid + "";
                insertCommand.ExecuteNonQuery();
            }

            Response.Write("<script language='javascript'>window.alert('Book Updated Sucessfully');;window.location='deleteBooks.aspx';</script>");
            bookname.Text = "";
            bookauthor.Text = "";
            bookpublisher.Text = "";
            bookprice.Text = "";
            bookSprice.Text = "";
            bookdesc.Text = "";

        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('Can't Update the Books.. Sorry!!');</script>");
            myConnection.Close();
        }
    }
}