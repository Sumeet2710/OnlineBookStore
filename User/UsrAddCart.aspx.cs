using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_UsrAddCart : System.Web.UI.Page
{
    SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["OBSConnectionString"].ConnectionString);
    string s;
    string t;
    string[] a = new string[6];
    decimal tot = 0;
    decimal dis = 0;
    decimal rp = 0;
    int count = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[7] { new DataColumn("BName"), new DataColumn("BPrice"), new DataColumn("BSPrice"), new DataColumn("BDisc"), new DataColumn("BQty"), new DataColumn("BImage"), new DataColumn("BID") });

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
                    dt.Rows.Add(a[0].ToString(), a[1].ToString(), a[2].ToString(), a[3].ToString(), a[4].ToString(), a[5].ToString(), j.ToString());

                    tot = tot + (Convert.ToDecimal(a[2].ToString()) * Convert.ToDecimal(a[4].ToString()));
                    dis = dis + (Convert.ToDecimal(a[3].ToString()) * Convert.ToDecimal(a[4].ToString()));
                    rp = rp + (Convert.ToDecimal(a[1].ToString()) * Convert.ToDecimal(a[4].ToString()));
                    count = count + 1;
                    LCount.Text = count.ToString();
                }
            }
            R1.DataSource = dt;
            R1.DataBind();
            LT.Text = tot.ToString();
            LP.Text = rp.ToString();
            LD.Text = dis.ToString();
        }

    }
    protected void CheckoutBtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("checkout.aspx");
    }
}