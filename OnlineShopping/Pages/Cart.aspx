<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="OnlineShopping.Pages.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            height: 40px;
            text-align: center;
            font-size: large;
        }
        .style3
        {
            height: 13px;
        }
        .style4
        {
            height: 27px;
        }
        .style5
        {
            height: 25px;
            font-weight: 700;
        }
        .style6
        {
            height: 25px;
            width: 105px;
        }
        .style7
        {
            width: 105px;
        }
        .style8
        {
            height: 39px;
            text-align: center;
        }
        .style9
        {
            height: 25px;
            font-weight: 700;
            width: 74px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="style1">
        <tr>
            <td class="style2" colspan="2">
                <strong>Your Cart</strong></td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2" colspan="2">
                <asp:Label ID="lbl_EmptyCart" runat="server" ForeColor="Red" 
                    Text="No items in cart!" Visible="False"></asp:Label>
            </td>
            <td class="style2">
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:DataList ID="CartList" runat="server" BackColor="White" 
                    BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                    GridLines="Horizontal" RepeatColumns="4" RepeatDirection="Horizontal" 
                    onselectedindexchanged="CartList_SelectedIndexChanged">
                    <AlternatingItemStyle BackColor="#F7F7F7" />
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <ItemStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <ItemTemplate>
                        <table class="style1">
                            <tr>
                                <td class="style3" colspan="3">
                                    <asp:Image ID="img_Thumbnail" Height="150px" Width="150px" ImageUrl='<%# Eval("Image") %>' runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td class="style4" colspan="3">
                                    <asp:Label ID="lbl_Brand" runat="server" Text='<%# Eval("Brand") %>'></asp:Label>
                                    &nbsp;<asp:Label ID="lbl_Prod_name" runat="server" Text='<%# Eval("Prod_name") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style6">
                                    <strong>Price:</strong>
                                    <asp:Label ID="lbl_Price" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                                </td>
                                <td class="style9">
                                    Qty:
                                    <asp:TextBox ID="tb_Qty" runat="server" Height="20px" 
                                        Text='<%# Eval("Quantity") %>' style="margin-left: 0px" 
                                        Width="33px" EnableViewState="False"></asp:TextBox>
                                </td>
                                <td class="style5">
                                    <asp:Button ID="btn_Ok" runat="server" onclick="btn_Ok_Click" Text="OK" />
                                </td>
                            </tr>
                            <tr>
                                <td class="style7">
                                    <asp:LinkButton ID="lbtn_Remove" runat="server" onclick="lbtn_Remove_Click">Remove</asp:LinkButton>
                                </td>
                                <td colspan="2">
                                    <asp:Label ID="lbl_Prod_id" runat="server" Visible="False" Text='<%# Eval("Prod_id") %>'></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                </asp:DataList>
            </td>
            <td>
                <asp:ImageButton ID="ImgBtnContinueShopping" runat="server" 
                    ImageUrl="~/images/buttons/icon_continue.png" onclick="ImageButton1_Click1" />
            </td>
        </tr>
        <tr>
            <td class="style8" colspan="2">
                <asp:Label ID="lbl_NetPrice" runat="server" 
                    style="font-size: large; font-weight: 700"></asp:Label>
                <br />
                <asp:Label ID="lbl_NoStock" runat="server" Visible="False"></asp:Label>
            </td>
            <td class="style8">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style8">
                <asp:ImageButton ID="ImqBtnBuyNow" runat="server" Height="64px" 
                    ImageUrl="~/images/buttons/blue-buy-now-button.jpg" 
                    onclick="ImqBtnBuyNow_Click" style="margin-left: 0px" Width="162px" />
                <asp:ImageButton ID="ImgBtnCashOnDelivery" runat="server" 
                    ImageUrl="~/images/buttons/cash-on-delivery.jpg" onclick="ImageButton1_Click" />
                <br />
                <br />
            </td>
            <td class="style8">
                &nbsp;</td>
            <td class="style8">
            </td>
        </tr>
    </table>
</asp:Content>
