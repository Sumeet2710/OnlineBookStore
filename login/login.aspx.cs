using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void loginbtn_Click(object sender, EventArgs e)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["OBSConnectionString"].ConnectionString);
        try
        {
            var text1 = usrid.Text;
            var text2 = password.Text;

            myConnection.Open();

            string query = "Select * from Tbl1_User where usrID='" + text1 + "' and pass1='" + text2 + "'";
            SqlCommand cmd = new SqlCommand(query, myConnection);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count!=0)
            {
                string Utype;
                Utype = dt.Rows[0][7].ToString().Trim();

                if (Utype == "u")
                {

                    Session["usrID"] = text1;
                    Response.Write("<script language='javascript'>alert('Hello " + text1 + " Welcome');window.location='../UserMain.aspx';</script>");
                    if (Request.QueryString["url"] != null)
                    {
                        if (Request.QueryString["url"] == "cart")
                        {
                            Response.Redirect("~/User/UsrAddCart.aspx");
                        }
                    }
                    else
                    {
                        Response.Cookies["bk"].Expires = DateTime.Now.AddDays(-1);
                        Response.Cookies["bk"].Expires = DateTime.Now.AddDays(-1);
                        Response.Redirect("~/UserMain.aspx");
                    }
                    // Response.Write("<script>alert("+text1.ToString()+")</script>)");
                    myConnection.Close();
                }
                if (Utype == "a")
                {

                    Session["usrID"] = text1;
                    Response.Write("<script language='javascript'>alert('Hello " + text1 + " Welcome');window.location='../Admin/AdminMain.aspx';</script>");
                    // Response.Write("<script>alert("+text1.ToString()+")</script>)");
                    myConnection.Close();
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Username and Password')</script>");
                usrid.Text = null;
                password.Text = null;
            }
            myConnection.Close();
        }
        catch (Exception ex)
        {
            Response.Write(ex + "Invalid User");
        }
    }
}