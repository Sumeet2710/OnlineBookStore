using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Admin_addBooks : System.Web.UI.Page
{
    SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["OBSConnectionString"].ConnectionString);
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindCategory();
        }
    }
    private void BindCategory()
    {
       SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["OBSConnectionString"].ConnectionString);
       myConnection.Open();
       SqlCommand cmd = new SqlCommand("Select * from [dbo].[Tbl2_Category]", myConnection);
       SqlDataAdapter sda = new SqlDataAdapter(cmd);
       DataTable dt= new DataTable();
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
    protected void addbookBtn_Click(object sender, EventArgs e)
    {
        if(bookisbn.Text.Length >= 10 && bookisbn.Text.Length <= 13)
        {
        try
        {
            SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["OBSConnectionString"].ConnectionString);

            var bname = "";
            var bauthor = "";
            var bpublish = "";
            var bcategory = "";
            var brelease = "";
            var bdesc = "";
            var bimage = "";
            var bcatname = "";
            var bisbn = "";
           decimal bprice =Convert.ToDecimal(bookprice.Text);
           decimal bsprice = Convert.ToDecimal(bookSprice.Text);
           decimal bdisc = bprice - bsprice;

            bname = bookname.Text.ToUpper();
            bauthor = bookauthor.Text;
            bpublish = bookpublisher.Text;
            bcategory = bookcategory.SelectedItem.Value;
            bcatname = bookcategory.SelectedItem.ToString();
            brelease = bookrelease.Text;
            bdesc = bookdesc.Text;
            bimage = bookname.Text.ToString().Trim();
            bisbn = bookisbn.Text;
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


            string query = "Insert into [dbo].[Tbl3_Books] (BName,BAuthor,BPublish,BCatID,BPrice,BSPrice,BRelease,BDescription,BImage,BExtension,BDisc,BCatName,BISBN) Values (@bname,@bauthor,@bpublish,@bcategory,@bprice,@bsprice,@brelease,@bdesc,@bimage,@Extention,@bdisc,@bcatname,@bisbn)";
            SqlCommand insertCommand = new SqlCommand(query, myConnection);
            insertCommand.Parameters.AddWithValue("@bname", bname);
            insertCommand.Parameters.AddWithValue("@bauthor", bauthor);
            insertCommand.Parameters.AddWithValue("@bpublish", bpublish);
            insertCommand.Parameters.AddWithValue("@bcategory", bcategory);
            insertCommand.Parameters.AddWithValue("@bprice", bprice);
            insertCommand.Parameters.AddWithValue("@bsprice", bsprice);
            insertCommand.Parameters.AddWithValue("@brelease", brelease);
            insertCommand.Parameters.AddWithValue("@bdesc", bdesc);
            insertCommand.Parameters.AddWithValue("@bimage", bimage);
            insertCommand.Parameters.AddWithValue("@Extention", Extention);
            insertCommand.Parameters.AddWithValue("@bdisc", bdisc);
            insertCommand.Parameters.AddWithValue("@bcatname", bcatname);
            insertCommand.Parameters.AddWithValue("@bisbn", bisbn);

            insertCommand.ExecuteNonQuery();
        }
            
            Response.Write("<script language='javascript'>window.alert('Book Added Sucessfull');</script>");
            bookname.Text = "";
            bookauthor.Text = "";
            bookpublisher.Text = "";
            bookprice.Text = "";
            bookSprice.Text = "";
            bookdesc.Text = "";
            bookisbn.Text = "";
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('Can't Insert the Books.. Sorry!!');</script>");
            myConnection.Close();
        }
        }
        else
        {
            isbn.Text="Please Enter proper ISBN number!";
        }
    }
}