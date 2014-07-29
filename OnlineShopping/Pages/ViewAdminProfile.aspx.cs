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
    public partial class ViewAdminProfile : System.Web.UI.Page
    {
        ClassDataConnection obj = new ClassDataConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null)
                Response.Redirect("~/Default.aspx");
            GridViewAdminProfile.RowEditing += new GridViewEditEventHandler(GridViewAdminProfile_RowEditing);
            GridViewAdminProfile.RowUpdating += new GridViewUpdateEventHandler(GridViewAdminProfile_RowUpdating);
            GridViewAdminProfile.RowCancelingEdit += new GridViewCancelEditEventHandler(GridViewAdminProfile_RowCancelingEdit);
            if (!IsPostBack)
            {
                DataSet ds = new DataSet();
                ds = obj.Data_inventer("select FName,LName,Phone,Address from User_Info where UserID='" + Session["id"].ToString() + "'");
                GridViewAdminProfile.DataSource = ds;
                GridViewAdminProfile.DataBind();
            }
        }

        void GridViewAdminProfile_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewAdminProfile.EditIndex = -1;
            DataSet ds = new DataSet();
            ds = obj.Data_inventer("select FName,LName,Phone,Address from User_Info where UserID='" + Session["id"].ToString() + "'");
            GridViewAdminProfile.DataSource = ds;
            GridViewAdminProfile.DataBind();
        }

        void GridViewAdminProfile_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            TextBox t_FName = (TextBox)GridViewAdminProfile.Rows[e.RowIndex].Cells[1].Controls[0];
            TextBox t_LName = (TextBox)GridViewAdminProfile.Rows[e.RowIndex].Cells[2].Controls[0];
            TextBox t_Phone = (TextBox)GridViewAdminProfile.Rows[e.RowIndex].Cells[3].Controls[0];
            TextBox t_Address = (TextBox)GridViewAdminProfile.Rows[e.RowIndex].Cells[4].Controls[0];
            obj.INUPDE("Update User_Info set FName='" + t_FName.Text + "', LName='" + t_LName.Text + "', Phone='" + t_Phone.Text + "', Address='" + t_Address.Text + "' where UserID='" + Session["id"].ToString() + "'");
            DataSet ds = new DataSet();
            ds = obj.Data_inventer("select FName,LName,Phone,Address from User_Info where UserID='" + Session["id"].ToString() + "'");
            GridViewAdminProfile.DataSource = ds;
            GridViewAdminProfile.EditIndex = -1;
            GridViewAdminProfile.DataBind();
        }

        void GridViewAdminProfile_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewAdminProfile.EditIndex = e.NewEditIndex;
            DataSet ds = new DataSet();
            ds = obj.Data_inventer("select FName,LName,Phone,Address from User_Info where UserID='" + Session["id"].ToString() + "'");
            GridViewAdminProfile.DataSource = ds;
            GridViewAdminProfile.DataBind();
        }



        protected void GridViewAdminProfile_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
 }