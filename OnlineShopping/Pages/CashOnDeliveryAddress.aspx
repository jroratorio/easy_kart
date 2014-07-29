<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CashOnDeliveryAddress.aspx.cs" Inherits="OnlineShopping.Pages.CashOnDeliveryAddress" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 330px;
        }
        .style3
        {
            width: 200px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p style="font-family: 'Times New Roman', Times, serif; font-size: medium; font-weight: bold; font-style: normal; color: #003366">
        <table class="style1">
            <tr>
                <td class="style2">
        Enter Your Delivery Address:</td>
                <td class="style3">
                    <asp:TextBox ID="txtbxaddress" runat="server" TextMode="MultiLine" 
                        Width="200px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Name:</td>
                <td class="style3">
                    <asp:TextBox ID="txtbxName" runat="server" Height="22px" Width="200px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Contact Number:</td>
                <td class="style3">
                    <asp:TextBox ID="txtbxContctNum" runat="server" Width="200px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:ImageButton ID="ImgBtnCashOnDelivery" runat="server" 
                        ImageUrl="~/images/buttons/icon_continue.png" 
                        onclick="ImgBtnCashOnDelivery_Click" style="margin-left: 199px" />
                </td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td class="style3">
        <asp:Button ID="btnOk" runat="server" onclick="Button1_Click" Text="OK" Width="120px" />
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </p>
    <p>
        <asp:Label ID="lbl_Message" runat="server" 
            
            style="font-family: 'Times New Roman', Times, serif; font-size: medium; color: #009900" 
            ForeColor="Black"></asp:Label>
    </p>
</asp:Content>
