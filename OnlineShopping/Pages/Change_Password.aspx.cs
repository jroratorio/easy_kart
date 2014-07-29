using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using OnlineShopping;

namespace OnlineShopping.Pages
{
    public partial class Change_Password : System.Web.UI.Page
    {
        ClassDataConnection obj = new ClassDataConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            lbl_IDmismatch.Visible = false;
            lbl_PasswordCheck.Visible = false;
            lbl_PhnMismatch.Visible = false;
        }

        protected void btn_ChangePassword_Click(object sender, EventArgs e)
        {
            String id = tb_UserID.Text;
            String phn = tb_Phone.Text;
            String pass = tb_Password.Text;
            String conf_pass = tb_ConfirmPassword.Text;
            DataSet ds = new DataSet();
            int invalid = 0;
            ds = obj.Data_inventer("select * from User_Info where UserID='" + id + "'");
            if (ds.Tables[0].Rows.Count == 0)//no id exists
            {
                invalid = 1;
                lbl_IDmismatch.Visible = true;
                lbl_IDmismatch.Text = "User not found";
                tb_UserID.Focus();
            }
            else if (!phn.Equals(ds.Tables[0].Rows[0][5].ToString()))// phn number mismatch
            {
                invalid = 1;
                lbl_PhnMismatch.Visible = true;
                lbl_PhnMismatch.Text = "Phone number mismatch";
                tb_Phone.Focus();
            }
            
            if (!pass.Equals(conf_pass))
            {
                invalid = 1;
                lbl_PasswordCheck.Visible = true;
                lbl_PasswordCheck.Text = "Verify Password";
                tb_Password.Focus();
            }
            if (invalid == 0)
            {
                //change password
                obj.INUPDE("update User_Info set Password='"+pass+"' where UserID='"+id+"'");
                if (Session["name"] != null)
                    Response.Redirect("~/Pages/Profile.aspx?changePass=1");
                else
                    Response.Redirect("~/Default.aspx?changePass=1");
            }
        }             
    }
}