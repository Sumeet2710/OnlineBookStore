using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_UsrContus : System.Web.UI.Page
{
    SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["OBSConnectionString"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            complaint.Items.Insert(0, new ListItem("--Select--", "0"));
        }
    }
    protected void submitbtn_Click(object sender, EventArgs e)
    {
        try
        {
            if (fullname.Text != "" && mail.Text != "" && contact.Text != "" && msgbox.Text != "")
            {
                if(contact.Text.Length == 10)
                {
                var fname = "";
                var email = "";
                var cont = "";
                var comp = "";
                var reason = "";

                fname = fullname.Text;
                email = mail.Text;
                cont = contact.Text;
                comp = complaint.SelectedItem.ToString();
                reason = msgbox.Text;

                myConnection.Open();
                string query = "Insert into [dbo].[Tbl8_Contus] (FName,Email,Cont,Complaint,Reason) Values (@fname,@email,@cont,@comp,@reason)";
                SqlCommand insertCommand = new SqlCommand(query, myConnection);
                insertCommand.Parameters.AddWithValue("@fname", fname);
                insertCommand.Parameters.AddWithValue("@email", email);
                insertCommand.Parameters.AddWithValue("@cont", cont);
                insertCommand.Parameters.AddWithValue("@comp", comp);
                insertCommand.Parameters.AddWithValue("@reason", reason);
                insertCommand.ExecuteNonQuery();
                Response.Write("<script language='javascript'>window.alert('Complaint Registered Successfully');window.location='~/UserMain.aspx';</script>");
            }
                else
                {
                    contlbl.Text="Incorrect Contact Number";
                }
            }
            else
            {
                labelval.Text = " All Fields are Mandatory";
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script language='javascript'>window.alert('Something went wrong');</script>");

        }
    }
}