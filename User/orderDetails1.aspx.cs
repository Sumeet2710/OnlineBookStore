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
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;

public partial class User_orderDetails : System.Web.UI.Page
{
    SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["OBSConnectionString"].ConnectionString);

    string order = "";
    string order_id = "";
    string method = "";
    string s;
    string t;
    string[] a = new string[6];
    decimal tot = 0;
    int dis = 0;
    decimal rp = 0;
    int count = 0;
    DateTime date = DateTime.Now;
    string delidate;
    string address, state, city, zipcode, landmark, username;

    protected void Page_Load(object sender, EventArgs e)
    {
        myConnection.Open();
        order = Request.QueryString["orderid"];
        method = "Online Payment";

            //for getting user details and storing in order_details

            SqlCommand cmd = myConnection.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT * FROM [dbo].[Tbl1_User] where usrID='" + Session["usrID"] + "'";
            cmd.ExecuteNonQuery();

            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            foreach (DataRow dr in dt.Rows)
            {
                SqlCommand cmd1 = myConnection.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "UPDATE [dbo].[Tbl7_ShipDetails] SET usrID='" + dr["usrID"].ToString() + "', payment='" + method.ToString() + "'";
                cmd.ExecuteNonQuery();
            }

            //now we'll get orderid from table

            SqlCommand cmd2 = myConnection.CreateCommand();
            cmd2.CommandType = CommandType.Text;
            cmd2.CommandText = "SELECT TOP 1 * FROM [dbo].[Tbl7_ShipDetails] where usrID='" + Session["usrID"].ToString() + "'ORDER BY id DESC";
            cmd2.ExecuteNonQuery();

            DataTable dt2 = new DataTable();
            SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
            da2.Fill(dt2);
            foreach (DataRow dr2 in dt2.Rows)
            {
                order_id = dr2["id"].ToString();
                address = dr2["addr"].ToString();
                state = dr2["state"].ToString();
                city = dr2["city"].ToString();
                landmark = dr2["landmark"].ToString();
                zipcode = dr2["zipcode"].ToString();
                username = dr2["usrID"].ToString();
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
                    tot = tot + (Convert.ToDecimal(a[2].ToString()) * Convert.ToDecimal(a[4].ToString()));
                   
                    SqlCommand cmd3 = myConnection.CreateCommand();
                    cmd3.CommandType = CommandType.Text;
                    cmd3.CommandText = "INSERT INTO [dbo].[Tbl5_Order] (orderID, BName, BAmount, BQty, BImage, purdate, orderno, usrid, deldate, paymethod, totamt) VALUES('" + order_id.ToString() + "', '" + a[0].ToString() + "', '" + a[2].ToString() + "', '" + a[4].ToString() + "', '" + a[5].ToString() + "', '" + date.ToString() + "', '" + order.ToString() + "', '" + username.ToString() + "', '" + date.AddDays(12).ToString() + "', '" + method.ToString() + "', '" + tot.ToString() + "')";
                    cmd3.ExecuteNonQuery();

                    dis = dis + (Convert.ToInt32(a[3].ToString()) * Convert.ToInt32(a[4].ToString()));
                    rp = rp + (Convert.ToDecimal(a[1].ToString()) * Convert.ToDecimal(a[4].ToString()));
                    count = count + 1;
                    LCount.Text = count.ToString();
                    LT.Text = tot.ToString();
                    LP.Text = rp.ToString();
                    LD.Text = "-" + dis.ToString();
                    LOrder.Text = order.ToString();
                    Lpayment.Text = method.ToString();
                    delidate = date.AddDays(12).ToString();
                    LDDate.Text = delidate.Substring(0, 10);
                    LDate.Text = DateTime.Now.ToString().Substring(0, 10);
                    LAddress.Text = address;
                    LState.Text = state;
                    LCity.Text = city;
                    LLandmark.Text = landmark;
                    LZipcode.Text = zipcode;

                    Response.Cookies["bk"].Expires = DateTime.Now.AddDays(-1);
                    Response.Cookies["bk"].Expires = DateTime.Now.AddDays(-1);
                }
            }
            else
            {
                Response.Redirect("~/UserMain.aspx");
            }


        SqlCommand cmd4 = myConnection.CreateCommand();
        cmd4.CommandType = CommandType.Text;
        cmd4.CommandText = "SELECT * FROM [dbo].[Tbl5_Order] where orderID=" + order_id + "";

        cmd4.ExecuteNonQuery();
        DataTable dt4 = new DataTable();
        SqlDataAdapter sda = new SqlDataAdapter(cmd4);
        sda.Fill(dt4);
        RepeatOrder.DataSource = dt4;
        RepeatOrder.DataBind();

        user.Text = Session["usrID"].ToString();

        myConnection.Close();
    }


    //private void exportpdf()
    //{
    //    Response.ContentType = "application/pdf";
    //    Response.AddHeader("content-disposition", "attachment;filename=OrderInvoice.pdf");
    //    Response.Cache.SetCacheability(HttpCacheability.NoCache);
    //    StringWriter sw = new StringWriter();
    //    HtmlTextWriter hw = new HtmlTextWriter(sw);
    //    Panel1.RenderControl(hw);
    //    StringReader sr = new StringReader(sw.ToString());
    //    Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 100f, 0f);
    //    HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
    //    PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
    //    pdfDoc.Open();
    //    htmlparser.Parse(sr);
    //    pdfDoc.Close();
    //    Response.Write(pdfDoc);
    //    Response.End();
    //}
}