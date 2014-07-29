using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;
using OnlineShopping;

namespace OnlineShopping.Pages
{
    public partial class Account_Create : System.Web.UI.Page
    {
        ClassDataConnection obj = new ClassDataConnection();
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["pqr"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            lbl_CheckTermsConditions.Visible = false;
            lbl_IDAvailable.Visible = false;
            lbl_PasswordMismatch.Visible = false;
            lbl_Phone.Visible = false;
            hlink_AccCreated.Visible = false;
        }

        protected void btn_CreateAccount_Click(object sender, EventArgs e)
        {
            String fname = tb_FName.Text;
            String lname = tb_LName.Text;
            String id = tb_UserID.Text;
            String pass = tb_Password.Text;
            String conf_pass = tb_ConfirmPassword.Text;
            String sex = rbtn_Sex.SelectedItem.Text;
            String phn = tb_Phone.Text;
            String address = tb_Address.Text;
            DataSet ds=new DataSet();
            int invalid=0;
            lblHelp.ForeColor = Color.Red;
            if (!pass.Equals(conf_pass))//password confirmpassword mismatch
            {
                lbl_PasswordMismatch.Text = "Password mismatch";
                lbl_PasswordMismatch.ForeColor = Color.Red;
                invalid = 1;
                lbl_PasswordMismatch.Visible = true;
                tb_Password.Focus();
            }
            //checking for id availability
            ds = obj.Data_inventer("select * from User_Info where UserID='" + id + "'");
            if (ds.Tables[0].Rows.Count != 0)
            {
                invalid = 1;
                lbl_IDAvailable.Text = "ID unavailable";
                lbl_IDAvailable.ForeColor = Color.Red;
                lbl_IDAvailable.Visible = true;
                tb_UserID.Focus();
            }
            if ((tb_Phone.Text.Length < 10) || (tb_Phone.Text.Length > 10))
            {
                lbl_Phone.Text = "Incorrect Phone Noumber";
                lbl_Phone.ForeColor = Color.Red;
                lbl_Phone.Visible = true;
                invalid = 1;
            }


            if (!chk_TermsConditions.Checked)
            {
                lbl_CheckTermsConditions.Text = "You need to accept the terms and conditions to continue";
                lbl_CheckTermsConditions.ForeColor = Color.Red;
                lbl_CheckTermsConditions.Visible = true;
                invalid = 1;
            }
            if (invalid == 0)
            {
                //user adding to the database
                obj.INUPDE("insert into User_Info values('" + fname + "','" + lname + "','" + id + "','" + pass + "','" + sex + "'," + phn + ",'" + address + "')");
                hlink_AccCreated.Visible = true;                
            }
        }
    }
}