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
    public partial class AdminViewUsers : System.Web.UI.Page
    {

        ClassDataConnection obj = new ClassDataConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] != null && Session["id"].ToString().Equals("admin"))
            {
                GridView1.RowCancelingEdit += new GridViewCancelEditEventHandler(GridView1_RowCancelingEdit);
                GridView1.RowDeleting += new GridViewDeleteEventHandler(GridView1_RowDeleting);
                GridView1.RowUpdating += new GridViewUpdateEventHandler(GridView1_RowUpdating);
                GridView1.RowEditing += new GridViewEditEventHandler(GridView1_RowEditing);
                GridView1.PageIndexChanging += new GridViewPageEventHandler(GridView1_PageIndexChanging);
                GridView1.Sorting += new GridViewSortEventHandler(GridView1_Sorting);
                if (!IsPostBack)
                {
                    DataSet ds = new DataSet();
                    ds = obj.Data_inventer("select * from User_Info");
                    GridView1.DataSource = ds;
                    GridView1.DataBind();
                }
            }
            else
                Response.Redirect("~/Default.aspx");
        }

        void GridView1_Sorting(object sender, GridViewSortEventArgs e)
        {
            DataSet ds = new DataSet();
            ds = obj.Data_inventer("select * from User_Info");
            if (ds != null)
            {
                ds = obj.Data_inventer("select * from User_Info order by " + e.SortExpression);
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }    
        }

        void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            DataSet ds = new DataSet();
            ds = obj.Data_inventer("select * from User_Info");
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            DataSet ds = new DataSet();
            ds = obj.Data_inventer("select * from User_Info");
            GridView1.DataSource = ds;
            GridView1.DataBind();

        }

        void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            TextBox t_fname = (TextBox)GridView1.Rows[e.RowIndex].Cells[2].Controls[0];
            TextBox t_lname = (TextBox)GridView1.Rows[e.RowIndex].Cells[3].Controls[0];
            TextBox t_userid = (TextBox)GridView1.Rows[e.RowIndex].Cells[4].Controls[0];
            TextBox t_pwd = (TextBox)GridView1.Rows[e.RowIndex].Cells[5].Controls[0];
            TextBox t_sex = (TextBox)GridView1.Rows[e.RowIndex].Cells[6].Controls[0];
            TextBox t_phone = (TextBox)GridView1.Rows[e.RowIndex].Cells[7].Controls[0];
            TextBox t_address = (TextBox)GridView1.Rows[e.RowIndex].Cells[8].Controls[0];
            obj.INUPDE("update User_Info set FName='" + t_fname.Text + "',LName='" + t_lname.Text + "',UserID='" + t_userid.Text + "',Password='" + t_pwd.Text + "',Sex='" + t_sex.Text + "',Phone='" + t_phone.Text + "',Address='" + t_address.Text + "'where UserID='" + t_userid.Text + "'");
            DataSet ds = new DataSet();
            ds = obj.Data_inventer("select * from User_Info");
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            obj.INUPDE("delete from  User_Info where UserID='" + GridView1.Rows[e.RowIndex].Cells[4].Text + "'");
            DataSet ds = new DataSet();
            ds = obj.Data_inventer("select * from User_Info");
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            DataSet ds = new DataSet();
            ds = obj.Data_inventer("select * from User_Info");
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
        
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}