<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Feedback.aspx.cs" Inherits="OnlineShopping.Pages.Feedback" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        YOUR VALUABLE FEEDBACK IS ALWAYS WELCOME</p>
    <table class="style1">
        <tr>
            <td style="font-family: 'Times New Roman', Times, serif; font-size: medium; font-weight: 700; color: #0066CC">
                FeedBack:</td>
            <td>
                <asp:TextBox ID="tb_FeedBack" runat="server" Height="76px" TextMode="MultiLine" 
                    Width="198px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btn_Submit" runat="server" onclick="btn_Submit_Click" 
                    Text="Submit" />
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td rowspan="2">
                &nbsp;</td>
            <td rowspan="2">
                <asp:Label ID="lbl_Feedback" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
