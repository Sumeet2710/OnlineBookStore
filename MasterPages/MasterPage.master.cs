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

public partial class MasterPage : System.Web.UI.MasterPage
{
    string s;
    string t;
    string[] a = new string[6];
    int count = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
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
    protected void searchBook(object sender, EventArgs e)
    {
        string result = "~/SearchBook.aspx?result=" + searchtext.Text.ToUpper();
        Response.Redirect(result);
    }
}
