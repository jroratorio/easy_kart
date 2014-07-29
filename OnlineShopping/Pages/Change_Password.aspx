<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Change_Password.aspx.cs" Inherits="OnlineShopping.Pages.Change_Password" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            text-align: left;
            height: 51px;
        }
        .style3
        {
            width: 190px;
        }
        .style4
        {
            text-align: center;
            width: 179px;
        }
        .style5
        {
            width: 166px;
        }
        .style6
        {
            text-align: center;
            width: 179px;
            height: 18px;
        }
        .style7
        {
            height: 18px;
        }
        .style8
        {
            width: 166px;
            height: 18px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p style="font-size: large">
        Enter credentials to reset password<br />
    </p>
    <table class="style1">
        <tr>
            <td class="style4">
                UserID:</td>
            <td>
                <asp:TextBox ID="tb_UserID" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td class="style5">
                <asp:Label ID="lbl_IDmismatch" runat="server" ForeColor="Red" Visible="False"></asp:Label>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="tb_UserID" ErrorMessage="* UserID Not Mentioned" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style6">
                Phone:</td>
            <td class="style7">
                <asp:TextBox ID="tb_Phone" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td class="style8">
                <asp:Label ID="lbl_PhnMismatch" runat="server" ForeColor="Red" Visible="False"></asp:Label>
            </td>
            <td class="style7">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ErrorMessage="* Phone Not Mentioned" ForeColor="Red" 
                    ControlToValidate="tb_Phone"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style4" rowspan="2">
                New Password:</td>
            <td>
                <asp:TextBox ID="tb_Password" runat="server" TextMode="Password" Width="200px"></asp:TextBox>
                <asp:PasswordStrength ID="tb_Password_PasswordStrength" 

         TargetControlID="tb_Password" StrengthIndicatorType="Text" PrefixText="Strength:"
     HelpStatusLabelID="lblhelp" PreferredPasswordLength="8"
MinimumNumericCharacters="1" MinimumSymbolCharacters="1" TextStrengthDescriptions="Very Poor;Weak;Average;Good;Excellent" 
TextStrengthDescriptionStyles="VeryPoorStrength;WeakStrength;
AverageStrength;GoodStrength;ExcellentStrength" runat="server" />
               
            </td>
            <td rowspan="2">
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </td>
            <td rowspan="2">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ErrorMessage="Password Not Mentioned" ForeColor="Red" 
                    ControlToValidate="tb_Password"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblhelp" runat="server" 
                    style="font-family: 'Times New Roman', Times, serif; font-size: medium"></asp:Label>
                    

                    <br/>

                </td>
            </td>
        </tr>
        <tr>
            <td class="style4">
                Confirm Password:</td>
            <td class="style3">
                <asp:TextBox ID="tb_ConfirmPassword" runat="server" TextMode="Password" 
                    Width="200px"></asp:TextBox>
            </td>
            <td class="style5">
                <asp:Label ID="lbl_PasswordCheck" runat="server" ForeColor="Red" 
                    Visible="False"></asp:Label>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ErrorMessage="* Confirm Password Not Entered" ForeColor="Red" 
                    ControlToValidate="tb_ConfirmPassword"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2" colspan="4">
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btn_ChangePassword" runat="server" 
                    onclick="btn_ChangePassword_Click" Text="Change Password" />
            </td>
        </tr>
    </table>
</asp:Content>
