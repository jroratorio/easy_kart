<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="OnlineShopping.Pages.Profile" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            font-size: large;
        }
    .style2
    {
        width: 100%;
    }
    .style3
    {
        width: 191px;
        text-align: center;
    }
    .style4
    {
        width: 479px;
    }
        .style7
        {
            width: 20px;
        }
        .style8
        {
            width: 68px;
        }
        .style9
        {
            width: 173px;
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
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p class="style1">
        Welcome
        <asp:Label ID="lbl_Name" runat="server"></asp:Label>
    &nbsp;
        <asp:Label ID="lbl_PassChange" runat="server" BackColor="#66FF33" 
            style="font-size: medium; font-family: 'Times New Roman', Times, serif" 
            Visible="False"></asp:Label>
    </p>
<table class="style2">
    <tr>
        <td class="style3" rowspan="2">
            &nbsp;</td>
        <td class="style8">
            &nbsp;</td>
        <td>
            <asp:ImageButton ID="ImgBtnViewProfile" runat="server" Height="77px" 
                ImageUrl="~/images/buttons/profile-badge-icon_full.jpg" 
                onclick="ImgBtnViewProfile_Click" Width="154px" />
        </td>
        <td class="style9">
            <asp:ImageButton ID="ImgBtnChangePwd" runat="server" 
                ImageUrl="~/images/buttons/icon_changePassword.png" 
                onclick="ImgBtnChangePwd_Click" />
        </td>
        <td style="text-align: center" rowspan="2">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style8">
            &nbsp;</td>
        <td class="style7" colspan="2">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
            <asp:ImageButton ID="ImgBtnRecentPurchases" runat="server" Height="160px" 
                ImageUrl="~/images/buttons/recentpurchase.jpg" style="margin-left: 0px" 
                Width="125px" onclick="ImgBtnRecentPurchases_Click" />
        </td>
        <td class="style4" colspan="3">
            
            <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                </asp:ToolkitScriptManager>
                <asp:Image ID="Image1" runat="server" Height="238px" Width="550px" />
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
        <td style="text-align: center">
            <asp:ImageButton ID="ImgBtnViewCart" runat="server" 
                ImageUrl="~/images/buttons/view-cart-button.jpg" 
                onclick="ImgBtnViewCart_Click" />
        </td>
    </tr>
    <tr>
        <td class="style3">
            &nbsp;</td>
        <td class="style4" colspan="3">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
            &nbsp;</td>
        <td class="style4" colspan="3">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
            &nbsp;</td>
        <td class="style4" colspan="3">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
</table>
</asp:Content>
