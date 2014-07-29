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
    public partial class ProductDetails : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["pqr"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            lbl_NoStock.Visible = false;
            lbl_AddedToCart.Visible = false;
            String id = Request.QueryString["pid"].ToString();
            DataTable dt = new DataTable();
            SqlDataAdapter adpt = new SqlDataAdapter("Select Brand,Prod_name,Specs,Price,Stock,Image from Product where Prod_id='"+id+"'", con);
            adpt.Fill(dt);
            DataTable dt1 = new DataTable();
            dt1.Columns.Add("Image", Type.GetType("System.String"));
            dt1.Columns.Add("Brand", Type.GetType("System.String"));
            dt1.Columns.Add("Prod_name", Type.GetType("System.String"));
            dt1.Columns.Add("Specs", Type.GetType("System.String"));
            dt1.Columns.Add("Price", Type.GetType("System.String"));
            dt1.Columns.Add("Stock", Type.GetType("System.String"));
            dt1.Columns.Add("AddToCart", Type.GetType("System.String"));
            DataRow dr;
            int p = dt.Rows.Count;
            for (int i = 0; i < p; i++)
            {
                dr = dt1.NewRow();
                dr[0] = dt.Rows[i].ItemArray[5].ToString();
                dr[1] = dt.Rows[i].ItemArray[0].ToString();
                dr[2] = dt.Rows[i].ItemArray[1].ToString();                
                dr[3] = dt.Rows[i].ItemArray[2].ToString();
                dr[4] = dt.Rows[i].ItemArray[3].ToString();
                dr[5] = dt.Rows[i].ItemArray[4].ToString();
                dr[6] = "Add to Cart";
                dt1.Rows.Add(dr);
            }
            DetailList.DataSource = dt1;
            DetailList.DataBind();
        }

        protected void DetailList_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btn_AddToCart_Click(object sender, EventArgs e)
        {
            if (Session["id"] == null)
            {
                Response.Redirect("~/Default.aspx?login=false");
            }
            else
            {                
                String prod_id = Request.QueryString["pid"].ToString();
                String user_id = Session["id"].ToString();
                SalesHandler sales = new SalesHandler();
                Boolean flag = sales.addToCart(user_id, prod_id);
                if (flag == false)
                    lbl_NoStock.Visible = true;
                else
                    lbl_AddedToCart.Visible = true;
            }
        }
    }
}