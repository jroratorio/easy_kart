<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="AdminEntry.aspx.cs" Inherits="OnlineShopping.Pages.AdminEntry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 264px;
        }
        .style3
        {
            width: 634px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="style1">
        <tr>
            <td class="style2" 
                style="font-family: 'Times New Roman', Times, serif; font-size: medium; font-weight: bold; color: #003366">
                Enter&nbsp; Product ID</td>
            <td colspan="7">
                <asp:TextBox ID="txtbxPID" runat="server" Width="200px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="txtbxPID" ErrorMessage="* Product Id Not Entered" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td rowspan="3">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td colspan="7">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td colspan="7">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2" 
                style="font-family: 'Times New Roman', Times, serif; font-size: medium; font-weight: bold; color: #003366">
                Enter Category ID</td>
            <td colspan="7">
                <asp:TextBox ID="txtbxCID" runat="server" Width="200px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="txtbxCID" ErrorMessage="* Category Id Not Entered" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td rowspan="3">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td colspan="7">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td colspan="7">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2" 
                style="font-family: 'Times New Roman', Times, serif; font-size: medium; font-weight: bold; color: #003366">
                Enter Product Name</td>
            <td colspan="7">
                <asp:TextBox ID="txtbxPname" runat="server" Width="200px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    ControlToValidate="txtbxPname" ErrorMessage="* Product  Name Not Entered" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td rowspan="3">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td colspan="7">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td colspan="7">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2" 
                style="font-family: 'Times New Roman', Times, serif; font-size: medium; font-weight: bold; color: #003366">
                Enter Brand</td>
            <td colspan="7">
                <asp:TextBox ID="txtbxBrand" runat="server" Width="200px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                    ControlToValidate="txtbxBrand" ErrorMessage="* Brand Name Not Entered" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td rowspan="3">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td colspan="7">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td colspan="7">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2" 
                style="font-family: 'Times New Roman', Times, serif; font-size: medium; font-weight: bold; color: #003366">
                Enter&nbsp;&nbsp; Price</td>
            <td colspan="7">
                <asp:TextBox ID="txtbxPrice" runat="server" Width="200px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtbxPrice" ErrorMessage="* Price Not Entered" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td rowspan="3">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td colspan="7">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td colspan="7">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2" 
                style="font-family: 'Times New Roman', Times, serif; font-size: medium; font-weight: bold; color: #003366">
                Enter&nbsp;&nbsp; Specification</td>
            <td colspan="7">
                <asp:TextBox ID="txtbxSpecs" runat="server" Width="200px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtbxSpecs" ErrorMessage="Specification Not Given" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td rowspan="3">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td colspan="7">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td colspan="7">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2" 
                style="font-family: 'Times New Roman', Times, serif; font-size: medium; font-weight: bold; color: #003366">
                Number of Products to be&nbsp; added</td>
            <td colspan="7">
                <asp:TextBox ID="txtbxStocks" runat="server" Width="200px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="txtbxStocks" 
                    ErrorMessage="* Number Of Products in Stock not mentioned" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td rowspan="3">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td colspan="7">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td colspan="7">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2" 
                style="font-family: 'Times New Roman', Times, serif; font-size: medium; font-weight: bold; color: #003366">
                Image Of the Product</td>
            <td colspan="7">
                <asp:FileUpload ID="FileUpload1" runat="server" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="FileUpload1" ErrorMessage="* Image Path Not Mentioned" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td rowspan="3">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td colspan="7">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style3">
                <asp:Button ID="Btn_Add" runat="server" onclick="Btn_Add_Click" Text="ADD" 
                    Width="120px" />
            </td>
            <td class="style3">
                <asp:Button ID="Btn_Reset" runat="server" onclick="Btn_Reset_Click" 
                    Text="RESET" Width="120px" />
            </td>
            <td class="style3">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
