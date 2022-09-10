using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void registerbtn_Click(object sender, EventArgs e)
    {
        if (checkusrid() == true)
        {
            Response.Write("<script language='javascript'>window.alert('User ID already Exists');</script>");
        }
        else
        {
                SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["OBSConnectionString"].ConnectionString);
                try
                {
                    var uname = "";
                    var pass = "";
                    var conpass = "";
                    var fname = "";
                    var lname = "";
                    var cont = "";
                    var email = "";
                    var usr = "";
                    uname = usrid.Text;
                    pass = password.Text;
                    conpass = password1.Text;
                    fname = firstname.Text;
                    lname = lastname.Text;
                    cont = contact.Text;
                    email = mail.Text;
                    usr = "u";
                    myConnection.Open();

                    if (pass.Length >= 8)
                    {
                        string query = "Insert into [dbo].[Tbl1_User] (usrID,pass1,pass2,fname,lname,cont,email,isadmin,date) Values (@uname,@pass,@conpass,@fname,@lname,@cont,@email,@usr,getdate())";
                        SqlCommand insertCommand = new SqlCommand(query, myConnection);
                        insertCommand.Parameters.AddWithValue("@uname", uname);
                        insertCommand.Parameters.AddWithValue("@pass", pass);
                        insertCommand.Parameters.AddWithValue("@conpass", conpass);
                        insertCommand.Parameters.AddWithValue("@fname", fname);
                        insertCommand.Parameters.AddWithValue("@lname", lname);
                        insertCommand.Parameters.AddWithValue("@cont", cont);
                        insertCommand.Parameters.AddWithValue("@email", email);
                        insertCommand.Parameters.AddWithValue("@usr", usr);

                        insertCommand.ExecuteNonQuery();
                        myConnection.Close();
                        Response.Write("<script language='javascript'>window.alert('Sucessfull');window.location='../login/login.aspx';</script>");
                    }
                    else
                    {
                        passlbl.Text = "<i class='fa fa-exclamation-circle'></i> Use 8 characters or more for your password!";
                    }
                }
                catch (Exception ex)
                {
                    Response.Write(ex + "<script language='javascript'>window.alert('Can't Submit Your Data');</script>");
                }

        }
    }
    protected void clearbtn_Click(object sender, EventArgs e)
    {
        usrid.Text = "";
        password.Text = "";
        password1.Text = "";
        firstname.Text = "";
        lastname.Text = "";
        contact.Text = "";
        mail.Text = "";
    }
    private Boolean checkusrid()
    {
        Boolean usridavailable = false;
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["OBSConnectionString"].ConnectionString);
        String myquery = "Select * from Tbl1_User where usrID='" + usrid.Text + "'";
        SqlCommand insertCommand = new SqlCommand(myquery, myConnection);
        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = insertCommand;
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            usridavailable = true;

        }
        myConnection.Close();

        return usridavailable;
    }
}