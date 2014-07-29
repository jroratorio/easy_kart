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
    public partial class ViewProducts : System.Web.UI.Page
    {
        ClassDataConnection obj = new ClassDataConnection();
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["pqr"].ToString());

        protected void populateList(String q)
        {            
            DataTable dt = new DataTable();
            SqlDataAdapter adpt = new SqlDataAdapter(q, con);
            adpt.Fill(dt);
            DataTable dt1 = new DataTable();
            dt1.Columns.Add("Image", Type.GetType("System.String"));
            dt1.Columns.Add("Prod_name", Type.GetType("System.String"));
            dt1.Columns.Add("Price", Type.GetType("System.String"));
            dt1.Columns.Add("AddToCart", Type.GetType("System.String"));
            dt1.Columns.Add("Prod_id", Type.GetType("System.String"));
            DataRow dr;
            int p = dt.Rows.Count;
            if (p == 0)
                lbl_NoProducts.Visible = true;
            for (int i = 0; i < p; i++)
            {
                dr = dt1.NewRow();
                dr[0] = dt.Rows[i].ItemArray[3].ToString();
                dr[1] = dt.Rows[i].ItemArray[0].ToString();
                dr[2] = dt.Rows[i].ItemArray[1].ToString();
                dr[3] = "Add to Cart";
                dr[4] = dt.Rows[i].ItemArray[2].ToString();
                dt1.Rows.Add(dr);
            }
            ProductList.DataSource = dt1;
            ProductList.DataBind();
            ProductList.Visible = true;
        }        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lbl_NoProducts.Visible = false;
                lbl_NoStock.Visible = false;
                lbl_AddedToCart.Visible = false;
                if (Session["id"] == null)
                    ImgbtnViewCart.Visible = false;
                if (Request.QueryString["cat"].Equals("M1"))
                    lbl_CategoryTitle.Text = "Mobile Brands";
                if (Request.QueryString["cat"].Equals("L1"))
                    lbl_CategoryTitle.Text = "Laptop Brands";
                if (Request.QueryString["cat"].Equals("C1"))
                    lbl_CategoryTitle.Text = "Camera Brands";
                if (Request.QueryString["cat"].Equals("MC1"))
                    lbl_CategoryTitle.Text = "Men Clothings Brands";
                if (Request.QueryString["cat"].Equals("MF1"))
                    lbl_CategoryTitle.Text = "Men FootWear Brands";
                if (Request.QueryString["cat"].Equals("MW1"))
                    lbl_CategoryTitle.Text = "Men Watches Brands";
                if (Request.QueryString["cat"].Equals("FC1"))
                    lbl_CategoryTitle.Text = "Women Clothing Brands";
                if (Request.QueryString["cat"].Equals("FF1"))
                    lbl_CategoryTitle.Text = "Women FootWear Brands";
                if (Request.QueryString["cat"].Equals("FW1"))
                    lbl_CategoryTitle.Text = "Women Watches Brands";
                if (Request.QueryString["cat"].Equals("B1"))
                    lbl_CategoryTitle.Text = "Books";
                if (Request.QueryString["cat"].Equals("Mu1"))
                    lbl_CategoryTitle.Text = "Music Artistes";
                if (Request.QueryString["cat"].Equals("G1"))
                    lbl_CategoryTitle.Text = "Games Store";
                if (Request.QueryString["cat"].Equals("HA1"))
                    lbl_CategoryTitle.Text = "Home Appliances";
                if (Request.QueryString["cat"].Equals("KA1"))
                    lbl_CategoryTitle.Text = "Kitchen Appliances";
                firstLoad("select distinct Brand from Product where Cat_id='" + Request.QueryString["cat"].ToString() + "'");
            }
        }

        protected void firstLoad(String q)
        {
            DataTable dt = new DataTable();
            SqlDataAdapter adpt = new SqlDataAdapter(q, con);
            adpt.Fill(dt);
            DataTable dt1 = new DataTable();
            dt1.Columns.Add("Brand", Type.GetType("System.String"));
            DataRow dr;
            int p = dt.Rows.Count;
            if (p == 0)
                lbl_NoProducts.Visible = true;
            for (int i = 0; i < p; i++)
            {
                dr = dt1.NewRow();
                dr[0] = dt.Rows[i].ItemArray[0].ToString();
                dt1.Rows.Add(dr);
            }
            BrandList.DataSource = dt1;
            BrandList.DataBind();
            populateList("select Prod_name,Price,Prod_id,Image from Product where Cat_id='" + Request.QueryString["cat"].ToString()+"'");
        }
        
        protected void lbtn_Brand_Click(object sender, EventArgs e)
        {
            lbl_Sort.Visible = false;
            drpdn_Sort.Visible = false;
            String br = ((LinkButton)sender).Text;
            DataTable dt = new DataTable();
            String q = "select Prod_name,Price,Prod_id,Image from Product where Cat_id='" + Request.QueryString["cat"].ToString() + "' and Brand='" + br + "'";
            SqlDataAdapter adpt = new SqlDataAdapter(q, con);
            adpt.Fill(dt);
            DataTable dt1 = new DataTable();
            dt1.Columns.Add("Image", Type.GetType("System.String"));
            dt1.Columns.Add("Prod_name", Type.GetType("System.String"));
            dt1.Columns.Add("Price", Type.GetType("System.String"));
            dt1.Columns.Add("AddToCart", Type.GetType("System.String"));
            dt1.Columns.Add("Prod_id", Type.GetType("System.String"));
            DataRow dr;
            int p = dt.Rows.Count;
            if (p == 0)
               lbl_NoProducts.Visible = true;
            for (int i = 0; i < p; i++)
            {
                dr = dt1.NewRow();
                dr[0] = dt.Rows[i].ItemArray[3].ToString();
                dr[1] = dt.Rows[i].ItemArray[0].ToString();
                dr[2] = dt.Rows[i].ItemArray[1].ToString();
                dr[3] = "Add to Cart";
                dr[4] = dt.Rows[i].ItemArray[2].ToString();
                dt1.Rows.Add(dr);
            }
            ProductList.DataSource = dt1;
            ProductList.DataBind();
            ProductList.Visible = true;            
        }

        protected void lbtn_ProductName_Click(object sender, EventArgs e)
        {
            Label lb = (Label)((LinkButton)sender).FindControl("lbl_Prod_id");
            Response.Redirect("~/Pages/ProductDetails.aspx?pid=" + lb.Text);
        }

        protected void imgbtn_Thumbnail_Click(object sender, ImageClickEventArgs e)
        {
            Label lb = (Label)((ImageButton)sender).FindControl("lbl_Prod_id");
            Response.Redirect("~/Pages/ProductDetails.aspx?pid=" + lb.Text);
        }

        protected void lbtn_AddToCart_Click(object sender, EventArgs e)
        {
            if (Session["id"] == null)
            {
                Response.Redirect("~/Default.aspx?login=false");
            }
            else
            {
                Label lb = (Label)((LinkButton)sender).FindControl("lbl_Prod_id");
                String prod_id = lb.Text;
                String user_id = Session["id"].ToString();
                SalesHandler sales = new SalesHandler();
                Boolean flag=sales.addToCart(user_id, prod_id);
                if (flag == false)
                    lbl_NoStock.Visible = true;
                else
                    lbl_AddedToCart.Visible = true;
            }
        }

        protected void ProductList_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ImgbtnViewCart_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/Pages/Cart.aspx");
        }

        protected void drpdn_Sort_SelectedIndexChanged(object sender, EventArgs e)
        {
            String q = "select Prod_name,Price,Prod_id,Image from Product where Cat_id='" + Request.QueryString["cat"].ToString() + "'";
            if (drpdn_Sort.SelectedItem.Text.Equals("--Select--"))
                q = "select Prod_name,Price,Prod_id,Image from Product where Cat_id='" + Request.QueryString["cat"].ToString() + "'";
            if(drpdn_Sort.SelectedItem.Text.Equals("Name"))
                q = "select Prod_name,Price,Prod_id,Image from Product where Cat_id='" + Request.QueryString["cat"].ToString() + "' order by Prod_name";
            if(drpdn_Sort.SelectedItem.Text.Equals("Price (low to high)"))
                q = "select Prod_name,Price,Prod_id,Image from Product where Cat_id='" + Request.QueryString["cat"].ToString() + "' order by Price";
            if (drpdn_Sort.SelectedItem.Text.Equals("Price (high to low)"))
                q = "select Prod_name,Price,Prod_id,Image from Product where Cat_id='" + Request.QueryString["cat"].ToString() + "' order by Price desc";
            populateList(q);
        }                                 
    }
}