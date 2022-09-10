using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_UserBookDetails : System.Web.UI.Page
{
    SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["OBSConnectionString"].ConnectionString);
    int bid;
    string bookname, bookprice, bookdisc, booksprice, bookqty, bookimg;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Request.QueryString["BID"] == null)
            {
                Response.Redirect("~/UserMain.aspx");
            }
            else
            {
                bid = Convert.ToInt32(Request.QueryString["BID"].ToString());

                myConnection.Open();
                //    SqlCommand cmd = new SqlCommand("SELECT  [BName], [BAuthor], [BPrice], [BSPrice], [BImage], [BExtension] FROM [dbo].[Tbl3_Books]", myConnection);
                SqlCommand cmd = myConnection.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "SELECT * FROM [dbo].[Tbl3_Books] where BID=" + bid + "";

                cmd.ExecuteNonQuery();
                DataTable dt = new DataTable();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                sda.Fill(dt);
                RepeatBooks.DataSource = dt;
                RepeatBooks.DataBind();

                myConnection.Close();
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex + "<script>alert('Something went Wrong')</script>");
        } 
    }
    protected void buyBtn_Click(object sender, EventArgs e)
    {
        myConnection.Open();
        SqlCommand cmd = myConnection.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "SELECT * FROM [dbo].[Tbl3_Books] where BID=" + bid + "";
        cmd.ExecuteNonQuery();

        DataTable dt = new DataTable();
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        sda.Fill(dt);
        foreach (DataRow dr in dt.Rows)
        {
            bookname = dr["BName"].ToString();
            bookprice = dr["BPrice"].ToString();
            booksprice = dr["BSPrice"].ToString();
            bookdisc = dr["BDisc"].ToString();
            bookqty = DropDownList1.SelectedItem.ToString();
            bookimg = dr["BImage"].ToString();
        }
        myConnection.Close();

        if (Request.Cookies["bk"] == null)
        {
            Response.Cookies["bk"].Value = bookname.ToString() + "," + bookprice.ToString() + "," + booksprice.ToString() + "," + bookdisc.ToString() + "," + bookqty.ToString() + "," + bookimg.ToString();
            Response.Cookies["bk"].Expires = DateTime.Now.AddDays(1);
        }
        else
        {
            Response.Cookies["bk"].Value = Request.Cookies["bk"].Value + "|" + bookname.ToString() + "," + bookprice.ToString() + "," + booksprice.ToString() + "," + bookdisc.ToString() + "," + bookqty.ToString() + "," + bookimg.ToString();
            Response.Cookies["bk"].Expires = DateTime.Now.AddDays(1);
        }
        Response.Redirect("checkout.aspx");
    }

    protected void cartBtn_Click(object sender, EventArgs e)
    {

        myConnection.Open();
        SqlCommand cmd = myConnection.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "SELECT * FROM [dbo].[Tbl3_Books] where BID=" + bid + "";
        cmd.ExecuteNonQuery();

        DataTable dt = new DataTable();
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        sda.Fill(dt);
        foreach (DataRow dr in dt.Rows)
        {
            bookname = dr["BName"].ToString();
            bookprice = dr["BPrice"].ToString();
            booksprice = dr["BSPrice"].ToString();
            bookdisc = dr["BDisc"].ToString();
            bookqty = DropDownList1.SelectedItem.ToString();
            bookimg = dr["BImage"].ToString();
        }
        myConnection.Close();

        if (Request.Cookies["bk"] == null)
        {
            Response.Cookies["bk"].Value = bookname.ToString() + "," + bookprice.ToString() + "," + booksprice.ToString() + "," + bookdisc.ToString() + "," + bookqty.ToString() + "," + bookimg.ToString();
            Response.Cookies["bk"].Expires = DateTime.Now.AddDays(1);
        }
        else
        {
            Response.Cookies["bk"].Value = Request.Cookies["bk"].Value + "|" + bookname.ToString() + "," + bookprice.ToString() + "," + booksprice.ToString() + "," + bookdisc.ToString() + "," + bookqty.ToString() + "," + bookimg.ToString();
            Response.Cookies["bk"].Expires = DateTime.Now.AddDays(1);
        }
        Response.Redirect("UserBookDetails.aspx?bid=" + bid);
    }
}