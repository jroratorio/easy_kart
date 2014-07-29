using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace OnlineShopping.Pages
{
    public partial class AdminDelete : System.Web.UI.Page
    {
        ClassDataConnection obj = new ClassDataConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] != null && Session["id"].ToString().Equals("admin"))
            {
                Label1.Text = Session["id"].ToString();
                if (!IsPostBack)
                {
                    DataSet ds = new DataSet();
                    ds = obj.Data_inventer("select distinct Cat_id from Product ");
                    DropDownList1.Items.Clear();
                    DropDownList1.Items.Add("--select--");
                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                    {
                        DropDownList1.Items.Add(ds.Tables[0].Rows[i][0].ToString());
                    }
                }
            }
            else
                Response.Redirect("~/Default.aspx");
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            obj.INUPDE("delete from Product where Prod_id='" + DropDownList2.SelectedItem.Text + "'");
            lbl_delete.Text = "Item deleted Successfully";
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            ds = obj.Data_inventer("select Prod_id from Product where Cat_id='" + DropDownList1.SelectedItem.Text + "'");
            DropDownList2.Items.Clear();
            DropDownList2.Items.Add("--select--");
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                DropDownList2.Items.Add(ds.Tables[0].Rows[i][0].ToString());
            }
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
             DataSet ds = new DataSet();
             ds = obj.Data_inventer("select   Prod_name from Product where  Prod_id='"+DropDownList2.SelectedItem.Text+ "'");
             txtbxPname.Text = ds.Tables[0].Rows[0][0].ToString() ;
        }

        protected void txtbxPname_TextChanged(object sender, EventArgs e)
        {

        }
    }
}