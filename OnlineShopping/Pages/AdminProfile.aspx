<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="AdminProfile.aspx.cs" Inherits="OnlineShopping.Pages.AdminProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 415px;
        }
        .style4
        {
            width: 397px;
        }
        .style5
        {
            width: 252px;
        }
        .style6
        {
            width: 653px;
        }
        .style8
        {
            width: 5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="style1">
        <tr>
            <td class="style5">
                &nbsp;</td>
            <p class="style1">
        Welcome
        <asp:Label ID="lbl_Name" runat="server"></asp:Label>
    &nbsp;
    </p>
<table class="style2">
    <tr>
        <td class="style6" rowspan="3">
            &nbsp;</td>
        <td class="style4">
            <asp:GridView ID="GridView1" runat="server" 
                onselectedindexchanged="GridView1_SelectedIndexChanged" CellPadding="4" 
                ForeColor="#333333" GridLines="None" style="margin-left: 0px" 
                Width="580px" AllowPaging="True" AllowSorting="True">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:CommandField HeaderText="UPDATE" ShowEditButton="True" />
                    <asp:CommandField HeaderText="DELETE" ShowDeleteButton="True" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
        </td>
        
    </tr>
    <tr>
            <td rowspan="3">
            <asp:HyperLink ID="hlink_ChangePassword" runat="server" 
                NavigateUrl="~/Pages/Change_Password.aspx">Change Password</asp:HyperLink>
        </td>
            <td class="style8">
                &nbsp;</td>
            <td rowspan="3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    <tr>
            <td class="style8">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
