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
    public partial class View_Profile : System.Web.UI.Page
    {
        ClassDataConnection obj = new ClassDataConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null)
                Response.Redirect("~/Default.aspx");
            ProfileView.RowEditing += new GridViewEditEventHandler(ProfileView_RowEditing);
            ProfileView.RowUpdating += new GridViewUpdateEventHandler(ProfileView_RowUpdating);
            ProfileView.RowCancelingEdit += new GridViewCancelEditEventHandler(ProfileView_RowCancelingEdit);
            if (!IsPostBack)
            {
                DataSet ds = new DataSet();
                ds = obj.Data_inventer("select FName,LName,Phone,Address from User_Info where UserID='" + Session["id"].ToString() + "'");
                ProfileView.DataSource=ds;
                ProfileView.DataBind();
            }
        }

        void ProfileView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            ProfileView.EditIndex = -1;
            DataSet ds = new DataSet();
            ds = obj.Data_inventer("select FName,LName,Phone,Address from User_Info where UserID='" + Session["id"].ToString() + "'");
            ProfileView.DataSource = ds;
            ProfileView.DataBind();
        }

        void ProfileView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            TextBox t_FName = (TextBox)ProfileView.Rows[e.RowIndex].Cells[1].Controls[0];
            TextBox t_LName = (TextBox)ProfileView.Rows[e.RowIndex].Cells[2].Controls[0];
            TextBox t_Phone = (TextBox)ProfileView.Rows[e.RowIndex].Cells[3].Controls[0];
            TextBox t_Address = (TextBox)ProfileView.Rows[e.RowIndex].Cells[4].Controls[0];
            obj.INUPDE("Update User_Info set FName='" + t_FName.Text + "', LName='" + t_LName.Text + "', Phone='"+t_Phone.Text+"', Address='"+t_Address.Text+"' where UserID='"+Session["id"].ToString()+"'");
            DataSet ds = new DataSet();
            ds = obj.Data_inventer("select FName,LName,Phone,Address from User_Info where UserID='" + Session["id"].ToString() + "'");
            ProfileView.DataSource = ds;
            ProfileView.EditIndex = -1;
            ProfileView.DataBind();            
        }

        void ProfileView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            ProfileView.EditIndex = e.NewEditIndex;
            DataSet ds = new DataSet();
            ds = obj.Data_inventer("select FName,LName,Phone,Address from User_Info where UserID='" + Session["id"].ToString() + "'");
            ProfileView.DataSource = ds;
            ProfileView.DataBind();            
        }

        protected void ProfileView_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}