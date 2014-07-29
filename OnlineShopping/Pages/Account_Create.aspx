<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Account_Create.aspx.cs" Inherits="OnlineShopping.Pages.Account_Create" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
        }
        .style4
        {
            height: 36px;
        }
        .style6
        {
            height: 56px;
        }
        .style7
        {
            height: 31px;
        }
        .style8
        {
            width: 235px;
        }
        .style9
        {
            height: 55px;
        }
        .style10
        {
            width: 235px;
            height: 55px;
        }
        .style11
        {
            width: 229px;
        }
        .style12
        {
            height: 34px;
        }
        .style13
        {
            width: 235px;
            height: 34px;
        }
        .style14
        {
            height: 74px;
        }
        .style15
        {
            height: 36px;
            width: 262px;
        }
        .style19
        {
            height: 31px;
            width: 175px;
        }
        .style20
        {
            height: 74px;
            width: 175px;
        }
        .style24
        {
            width: 175px;
            height: 55px;
        }
        .style25
        {
            width: 175px;
            height: 34px;
        }
        .style26
        {
            height: 36px;
            width: 175px;
        }
        .style27
        {
            width: 175px;
        }
    </style>
    <script type="text/javascript">
        function ValidateName(s,args){
        if(args.Value.length<6||args.Value.length>12){
        args.IsValid=false;
        }
        </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <table class="style1">
            <tr>
                <td class="style27" 
                    
                    style="font-family: 'Times New Roman', Times, serif; font-size: medium; color: #003366">
                    CREATE ACCOUNT..!!</td>
                <td style="text-align: left" class="style8" colspan="2" rowspan="2">
                    &nbsp;</td>
                <td style="text-align: left" colspan="4" rowspan="2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style27" 
                    
                    style="font-family: 'Times New Roman', Times, serif; font-size: medium; color: #003366">
                    <asp:HyperLink ID="hlink_AccCreated" runat="server" ForeColor="#009933" 
                        NavigateUrl="~/Default.aspx" Visible="False">Account Created! Click here to continue</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td class="style27" 
                    
                    style="font-family: 'Times New Roman', Times, serif; font-size: medium; color: #003366">
                    &nbsp;</td>
                <td style="text-align: left" class="style8" colspan="2">
                    &nbsp;</td>
                <td style="text-align: left" colspan="4">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style27" 
                    
                    style="font-family: 'Times New Roman', Times, serif; font-size: medium; color: #003366">
                    First Name:</td>
                <td style="text-align: left" class="style8" colspan="2">
                    <asp:TextBox ID="tb_FName" runat="server" Width="200px" Height="30px"></asp:TextBox>
                </td>
                <td style="text-align: left" colspan="4">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="tb_FName" ErrorMessage="* First Name Not Entered" 
                        ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style27" 
                    
                    style="font-family: 'Times New Roman', Times, serif; font-size: medium; color: #003366">
                    Last Name:</td>
                <td style="text-align: left" class="style8" colspan="2">
                    <asp:TextBox ID="tb_LName" runat="server" style="text-align: left" 
                        Width="200px" Height="30px"></asp:TextBox>
                    <br />
                </td>
                <td style="text-align: left" colspan="4">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="tb_FName" ErrorMessage="*  Last Name Not Entered" 
                        ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style24" 
                    
                    
                    style="font-family: 'Times New Roman', Times, serif; font-size: medium; color: #003366">
                    UserID:</td>
                <td class="style10" style="text-align: left; color: #FF0000;" colspan="2">
                    <asp:TextBox ID="tb_UserID" runat="server" style="margin-bottom: 0px" 
                        Width="200px" Height="30px"></asp:TextBox>
                    <asp:Label ID="lbl_IDAvailable" runat="server"></asp:Label>
                &nbsp;<br />
                    *(6-12 characters only)</td>
                <td style="text-align: left" class="style9" colspan="2">
                    <asp:CustomValidator ID="CustomValidator1" runat="server" 
                        ClientValidationFunction="ValidateName" ControlToValidate="tb_UserID" 
                        ErrorMessage="* Not Within Length" ForeColor="Red"></asp:CustomValidator>
                </td>
                <td style="text-align: left" class="style9" colspan="2">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="tb_UserID" ErrorMessage="*  UserID Not Entered" 
                        ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style27" 
                    
                    style="font-family: 'Times New Roman', Times, serif; font-size: medium; color: #003366">
                    Password:</td>
                <td style="text-align: left" class="style8" colspan="2">
                    <asp:TextBox ID="tb_Password" runat="server" TextMode="Password" Width="200px" 
                        Height="30px"></asp:TextBox>
                    

                     
    <asp:PasswordStrength ID="tb_Password_PasswordStrength" TargetControlID="tb_Password" StrengthIndicatorType="Text" PrefixText="Strength:"
     HelpStatusLabelID="lblHelp" PreferredPasswordLength="8"
MinimumNumericCharacters="1" MinimumSymbolCharacters="1" TextStrengthDescriptions="Very Poor;Weak;Average;Good;Excellent" 
TextStrengthDescriptionStyles="VeryPoorStrength;WeakStrength;
AverageStrength;GoodStrength;ExcellentStrength" runat="server" />

                    <br />

                    <asp:Label ID="lblHelp" runat="server" style="color: #FF0000"></asp:Label>
                </td>
                <td style="text-align: left" class="style11" colspan="3">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ErrorMessage="*  Password Not Entered" ForeColor="Red" 
                        ControlToValidate="tb_Password"></asp:RequiredFieldValidator>
                </td>
                <td style="text-align: left">
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                </td>
            </tr>
            <tr>
                <td class="style25" 
                    
                    
                    style="font-family: 'Times New Roman', Times, serif; font-size: medium; color: #003366">
                    Confirm Password:</td>
                <td style="text-align: left" class="style13" colspan="2">
                    <asp:TextBox ID="tb_ConfirmPassword" runat="server" TextMode="Password" 
                        Width="200px" Height="30px"></asp:TextBox>
                    <br />
                    <asp:Label ID="lbl_PasswordMismatch" runat="server" style="color: #FF0000"></asp:Label>
                </td>
                <td style="text-align: left" class="style12" colspan="4">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ErrorMessage="* Please Re-enter Password" ForeColor="Red" 
                        ControlToValidate="tb_ConfirmPassword"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style19" 
                    
                    style="font-family: 'Times New Roman', Times, serif; font-size: medium; color: #003366">
                    Sex:</td>
                <td colspan="6" style="text-align: left" class="style7">
                    <asp:RadioButtonList ID="rbtn_Sex" runat="server" RepeatDirection="Horizontal" 
                        style="font-family: 'Times New Roman', Times, serif; font-size: medium" 
                        Width="257px">
                        <asp:ListItem Selected="True">Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td class="style27" 
                    
                    style="font-family: 'Times New Roman', Times, serif; font-size: medium; color: #003366">
                    Phone:</td>
                <td style="text-align: left" colspan="2">
                    <asp:TextBox ID="tb_Phone" runat="server" Width="200px" Height="30px"></asp:TextBox>
                    <br />
                    <asp:Label ID="lbl_Phone" runat="server" style="color: #FF0000"></asp:Label>
                </td>
                <td style="text-align: left" colspan="3">
                    &nbsp;</td>
                <td style="text-align: left">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style27" 
                    
                    style="font-family: 'Times New Roman', Times, serif; font-size: medium; color: #003366">
                    Address:</td>
                <td style="text-align: left" class="style8" colspan="2">
                    <asp:TextBox ID="tb_Address" runat="server" Height="70px" TextMode="MultiLine" 
                        Width="200px"></asp:TextBox>
                </td>
                <td style="text-align: left" colspan="4">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="tb_Address" ErrorMessage="* Address Not Entered" 
                        ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style20" 
                    
                    style="font-family: 'Times New Roman', Times, serif; font-size: medium; color: #003366">
                    Terms and Conditions:</td>
                <td colspan="6" style="text-align: left" class="style14">
                    <asp:TextBox ID="TextBox8" runat="server" Height="70px" ReadOnly="True" 
                        TextMode="MultiLine" Width="200px">Bla Bla Bla A quick brown fox jumps over a lazy dog Bla Bla Bla A quick brown fox jumps over a lazy dog Bla Bla Bla A quick brown fox jumps over a lazy dog Bla Bla Bla A quick brown fox jumps over a lazy dog</asp:TextBox>
                    <br />
                </td>
            </tr>
            <tr>
                <td class="style26">
                </td>
                <td class="style15" style="text-align: right">
                    <asp:CheckBox ID="chk_TermsConditions" runat="server" style="text-align: right; font-family: 'Times New Roman', Times, serif; font-size: medium; color: #003366;" 
                        Text="I accept the terms and conditions" />
                    <br />
                    <asp:Label ID="lbl_CheckTermsConditions" runat="server" Visible="False" 
                        style="color: #FF0000"></asp:Label>
                </td>
                <td class="style4" style="text-align: right">
                    &nbsp;</td>
                <td class="style4" style="text-align: right">
                    &nbsp;</td>
                <td class="style4" colspan="3" style="text-align: right">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2" colspan="7">
                    <asp:Button ID="btn_CreateAccount" runat="server" 
                        onclick="btn_CreateAccount_Click" Text="Create Account" />
                </td>
            </tr>
            <tr>
                <td class="style6" colspan="7">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style6" colspan="7">
                    &nbsp;</td>
            </tr>
        </table>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        &nbsp;</p>
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        &nbsp;</p>
</asp:Content>
