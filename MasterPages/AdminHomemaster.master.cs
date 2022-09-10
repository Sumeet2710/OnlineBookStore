using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPages_AdminHomemaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["usrID"] == null)
        {
            Response.Redirect("../main.aspx");
        }
        else
        {
            Lbl1.Text = "Hello <i> " + Session["usrID"].ToString() + "</i>";
            Response.Write("<script>alert(" + Session["usrID"].ToString() + ")</script>");
        }

    }
    protected void signout_Click(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Response.Write("<script language='javascript'>alert('Logout Successfull');window.location='../main.aspx';</script>");
               
    }
}
