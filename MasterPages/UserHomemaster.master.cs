using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserHomemaster : System.Web.UI.MasterPage
{
    string s;
    string t;
    string[] a = new string[6];
    int count = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["usrID"] == null)
        {
            Response.Write("<script language='javascript'>window.location='../main.aspx';</script>");
            Response.Cookies["bk"].Expires = DateTime.Now.AddDays(-1);
            Response.Cookies["bk"].Expires = DateTime.Now.AddDays(-1);
        }
        else
        {
            Lbl1.Text = "Hello <i> "+ Session["usrID"].ToString()+"</i>";
            Response.Write("<script>alert(" + Session["usrID"].ToString() + ")</script>");
        }

        if (Request.Cookies["bk"] != null)
        {
            s = Convert.ToString(Request.Cookies["bk"].Value);

            string[] strArr = s.Split('|');

            for (int j = 0; j < strArr.Length; j++)
            {
                t = Convert.ToString(strArr[j].ToString());
                string[] strArr1 = t.Split(',');

                for (int i = 0; i < strArr1.Length; i++)
                {
                    a[i] = strArr1[i].ToString();
                }
                count = count + 1;
                Ccount.Text = count.ToString();
            }
        }
    }

    protected void signout_Click(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Response.Write("<script language='javascript'>alert('Logout Successfull');window.location='../main.aspx';</script>");
        
        if (Request.Cookies["bk"] != null)
        {
            Response.Cookies["bk"].Expires = DateTime.Now.AddDays(-1);
            Response.Cookies["bk"].Expires = DateTime.Now.AddDays(-1);
        }       
    }
    protected void searchBook(object sender, EventArgs e)
    {
        string result = "~/User/UserSearch.aspx?result=" + searchtext.Text.ToUpper();
        Response.Redirect(result);
    }
}
