using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;


namespace OnlineShopping.Pages
{
    public partial class AdminEntry : System.Web.UI.Page
    {
        ClassDataConnection obj = new ClassDataConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!(Session["id"] != null && Session["id"].ToString().Equals("admin")))
                Response.Redirect("~/Default.aspx");
        }

        protected void Btn_Add_Click(object sender, EventArgs e)
        {
            string asd = Server.MapPath("~/images/products/");
            FileUpload1.SaveAs(asd + FileUpload1.FileName);
            string sv = "~/images/products/" + FileUpload1.FileName;
            obj.INUPDE( "insert into Product values('" + txtbxPID.Text + "','" + txtbxCID.Text + "','" + txtbxPname.Text + "','" + txtbxBrand.Text + "','" + txtbxPrice.Text + "','" + txtbxSpecs.Text + "','" + txtbxStocks.Text + "','"  + sv + "')");
        }

        protected void Btn_Reset_Click(object sender, EventArgs e)
        {
            txtbxPID.Text="";
            txtbxCID.Text ="";
            txtbxPname.Text ="";
            txtbxBrand.Text = "";
            txtbxPrice.Text = "";
            txtbxSpecs.Text = "";
            txtbxStocks.Text = "";


        }
    }
}