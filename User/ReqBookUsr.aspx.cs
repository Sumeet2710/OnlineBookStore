using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_ReqBookUsr : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        quant.Text = "";
        bisbn.Text = "";
    }
    protected void requestBtn_Click(object sender, EventArgs e)
    {
           if (Convert.ToInt32(bookquantity.Text) > 0)
            {

                    if (bookisbn.Text.Length == 10 || bookisbn.Text.Length == 13)
                    {

                        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["OBSConnectionString"].ConnectionString);

                        myConnection.Open();
                        SqlCommand cmd = myConnection.CreateCommand();
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = "Insert INTO [dbo].[Tbl9_ReqBook] (BName, BISBN, BAuthor, Qty, Email, contact) VALUES('" + bookname.Text + "','" + bookisbn.Text + "', '" + bookauthor.Text + "', '" + bookquantity.Text + "', '" + email.Text + "', '" + cont.Text + "' )";
                        cmd.ExecuteNonQuery();
                        myConnection.Close();

                        Response.Write("<script>alert('Your request has been Successfully sent to our Admin');</script>");
                        bookname.Text = "";
                        bookauthor.Text = "";
                        bookisbn.Text = "";
                        bookquantity.Text = "";
                        email.Text = "";
                        cont.Text = "";
                     }
                    else
                    {
                        bisbn.Text = "Please Enter Proper ISBN Number!";
                    }
           
            }
            else
            {
                quant.Text = "Please Select Proper Quantity";
            }
    }
}