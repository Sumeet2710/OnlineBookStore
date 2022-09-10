using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class resetPass : System.Web.UI.Page
{
    DataTable dt = new DataTable();
    string email;
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["OBSConnectionString"].ConnectionString);
        string GUIDvalue;
        GUIDvalue = Request.QueryString["Uid"];
        if (GUIDvalue != null)
        {
            SqlCommand cmd = new SqlCommand("select * from [dbo].[ForgetPass] where id='" + GUIDvalue + "'", myConnection);
            myConnection.Open();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            sda.Fill(dt);
            if (dt.Rows.Count != 0)
            {
                email = dt.Rows[0]["email"].ToString().Trim();
            }
            else
            {
                lblMsg.Text = "Your Password Reset Link is Expired or Invalid !";
                lblMsg.ForeColor = Color.Red;
            }
        }
        else
        {
            Response.Redirect("http://localhost:1341/Online Medicine Shopping/Default/Default.aspx");
        }

        if (!IsPostBack)
        {
            if (dt.Rows.Count != 0)
            {
                newpass.Visible = true;
                confirmpass.Visible = true;
                passChange.Visible = true;

            }
            else
            {
                lblMsg.Text = "Your Password Reset Link is Expired or Invalid !";
                lblMsg.ForeColor = Color.Red;
            }
        }

    }

    protected void passChange_Click(object sender, EventArgs e)
    {
        if (newpass.Text != "" && confirmpass.Text != "" && newpass.Text == confirmpass.Text)
        {
            SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["OBSConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("update [dbo].[Tbl1_User] set pass1='" + newpass.Text + "' where email='" + email + "'", myConnection);
            myConnection.Open();
            cmd.ExecuteNonQuery();
            SqlCommand cmd2 = new SqlCommand("delete from [dbo].[ForgetPass] where email='" + email + "'", myConnection);
            cmd2.ExecuteNonQuery();
            Response.Redirect("http://localhost:51118/login/login.aspx");

        }
        else
        {
            lblMsg.Text = "Please Enter Fields Properly !";
            lblMsg.ForeColor = Color.Red;
        }
    }
}