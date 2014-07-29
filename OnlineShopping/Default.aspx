<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="OnlineShopping._Default" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">
        .style1
        {
            width: 98%;
        }
        .style3
        {
            text-align: left;
            width: 936px;
            height: 74px;
        }
        .style5
        {
            text-align: right;
            color: #FFFFFF;
        }
        .style12
        {
            width: 456px;
        }
        .style13
        {
            width: 123px;
        }
    </style>
    <script type="text/javascript">
        function pageLoad() {
            var slide = $find('SSBehaviorID');
            slide.add_slideChanging(animateSlides);
            var ae = $find("ae");
            var be = ae.get_OnLoadBehavior();
            var an = be.get_animation();
            fadein = an.get_animations()[1];
            fadeout = an.get_animations()[0];

            fadein.set_duration(1.0);
            fadeout.set_duration(1.0);

        }

        function animateSlides() {
            fadein.play();
            window.setTimeout("fadeout.play()", 2000);

        } 
   
    </script>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2 style="font-family: 'Times New Roman', Times, serif; font-size: x-large; color: #003366">
        WELCOME TO EASYCART!
        <asp:Label ID="lbl_PassChange" runat="server" BackColor="#66FF33" 
            style="text-align: center; font-family: 'Times New Roman', Times, serif; font-size: small" 
            Visible="False"></asp:Label>
    &nbsp;<asp:Label ID="lbl_Login" runat="server" BackColor="#FFCC00" 
            style="font-size: small" Text="Log in To Continue" Visible="False"></asp:Label>
    </h2>
    <p style="font-family: 'Times New Roman', Times, serif; font-size: medium; font-weight: bold; color: #FFFFFF; background-color: #445550;">
        OFFERS OF THE DAY</p>
    <table class="style1">
        <tr>
            <td bgcolor="White" class="style12">
            
                <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                </asp:ToolkitScriptManager>
                <asp:Image ID="Image1" runat="server" Height="238px" Width="568px" />
                <asp:AnimationExtender ID="Image1_AnimationExtender" runat="server" 
                    Enabled="True" TargetControlID="Image1" BehaviorID="ae">
                    <Animations>
                    <OnLoad>
                    <Sequence>
                    <FadeOut Duration="0" Fps="20" />
                    <FadeIn Duration="0" Fps="20" />
                    </Sequence>
                    </OnLoad>
                    </Animations>
                </asp:AnimationExtender>
                <asp:SlideShowExtender ID="Image1_SlideShowExtender" runat="server" 
                    Enabled="True"  TargetControlID="Image1"  SlideShowServiceMethod="GetImages" BehaviorID="SSBehaviorID"
                AutoPlay="true" Loop="true" 
                NextButtonID="btnNext" 
                PreviousButtonID="btnPrevious" >
                </asp:SlideShowExtender>
                <br />
                <asp:Button ID="btnPrevious" runat="server" Text="Previous" Width="55px" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnNext" runat="server" Text="Next" Width="55px" />
                <br />
                
            </td>
          
            <td bgcolor="White" class="style13" 
                
                style="font-family: 'Times New Roman', Times, serif; font-size: medium; font-style: normal; color: #008000; font-weight: bold;">
                &nbsp;Start Shopping NOW!<asp:Login ID="Login" runat="server" BackColor="#F7F6F3" BorderColor="#E6E2D8" 
                    BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" 
                    Font-Size="0.8em" ForeColor="#333333" Height="168px" Width="352px" 
                    onauthenticate="Login_Authenticate" style="margin-left: 0px">
                    <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
                    <LoginButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" 
                        BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284775" />
                    <TextBoxStyle Font-Size="0.8em" />
                    <TitleTextStyle BackColor="#5D7B9D" Font-Bold="True" Font-Size="0.9em" 
                        ForeColor="White" />
                </asp:Login>
                <br />
                <asp:HyperLink ID="hlink_ForgotPassword" runat="server" 
                    NavigateUrl="~/Pages/Change_Password.aspx" Width="300px">Forgot Password? Click Here!</asp:HyperLink>
                <br />
                <br />
                <asp:HyperLink ID="hlink_NewUser" runat="server" 
                    NavigateUrl="~/Pages/Account_Create.aspx" Width="200px">New User? Sign Up</asp:HyperLink>
            </td>
        </tr>
    </table>
<p class="style3">
        &nbsp;&nbsp;&nbsp;&nbsp;
        <!--<table class="style1">
            <tr>
                <td bgcolor="#336699" style="text-align: center">
                    <asp:HyperLink ID="hlink_ContactUs" runat="server" style="color: #FFFFFF" 
                        NavigateUrl="~/Pages/ContactUs.aspx">Contact Us</asp:HyperLink>
&nbsp;
                    <asp:HyperLink ID="hlink_Feedback" runat="server" style="color: #FFFFFF" 
                        NavigateUrl="~/Pages/Feedback.aspx">Feedback</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td bgcolor="#0099CC" class="style5">
                    Site best viewed on IE7 and above, 1024x768</td>
            </tr>
        </table>-->
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </p>
    </asp:Content>
