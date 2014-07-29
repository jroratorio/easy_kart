<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewProducts.aspx.cs" Inherits="OnlineShopping.Pages.ViewProducts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 172px;
            text-align: center;
        }
        .style3
        {
            width: 148px;
        }
        .style4
        {
            width: 659px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="lbl_CategoryTitle" runat="server" style="font-size: large"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="lbl_NoStock" runat="server" ForeColor="Red" 
        Text="Product could not be added! Stock nil!" Visible="False"></asp:Label>
    &nbsp;<asp:Label ID="lbl_AddedToCart" runat="server" ForeColor="#00CC00" 
        Text="Added to cart!" Visible="False"></asp:Label>
    <br />
    <br />
    <asp:Label ID="lbl_NoProducts" runat="server" ForeColor="Red" 
        Text="No products in this category!" Visible="False"></asp:Label>
    <br />
    <table class="style1">
        <tr>
            <td>
                &nbsp;</td>
            <td style="text-align: right">
&nbsp;<asp:Label ID="lbl_Sort" runat="server" Text="Sort by: "></asp:Label>
                <asp:DropDownList ID="drpdn_Sort" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="drpdn_Sort_SelectedIndexChanged">
                    <asp:ListItem>--Select--</asp:ListItem>
                    <asp:ListItem>Name</asp:ListItem>
                    <asp:ListItem>Price (low to high)</asp:ListItem>
                    <asp:ListItem>Price  (high to low)</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
    </table>
    <table class="style1">
        <tr>
            <td class="style2">
                <asp:DataList ID="BrandList" runat="server" CellPadding="4" ForeColor="#333333">
                    <AlternatingItemStyle BackColor="White" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <ItemStyle BackColor="#E3EAEB" />
                    <ItemTemplate>
                        <asp:LinkButton ID="lbtn_Brand" runat="server" Text='<%# Eval("Brand") %>' 
                            onclick="lbtn_Brand_Click">LinkButton</asp:LinkButton>
                    </ItemTemplate>
                    <SelectedItemStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                </asp:DataList>
            </td>
            <td class="style4">
                <asp:DataList ID="ProductList" runat="server" RepeatDirection="Horizontal" 
                    Visible="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" 
                    BorderWidth="1px" CellPadding="3" GridLines="Horizontal" RepeatColumns="4" 
                    onselectedindexchanged="ProductList_SelectedIndexChanged">
                    <AlternatingItemStyle BackColor="#F7F7F7" />
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <ItemStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <ItemTemplate>
                        <table class="style1">
                            <tr>
                                <td colspan="2">
                                    <asp:ImageButton ID="imgbtn_Thumbnail" Height="150px" Width="150px" ImageUrl='<%# Eval("Image") %>' runat="server" 
                                        onclick="imgbtn_Thumbnail_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:LinkButton ID="lbtn_ProductName" runat="server" 
                                        Text='<%# Eval("Prod_name") %>' onclick="lbtn_ProductName_Click">LinkButton</asp:LinkButton>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Label ID="lbl_Price" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style3">
                                    <asp:LinkButton ID="lbtn_AddToCart" runat="server" Text='Add to Cart' 
                                        onclick="lbtn_AddToCart_Click">Add to Cart</asp:LinkButton>
                                </td>
                                <td>
                                    <asp:Label ID="lbl_Prod_id" runat="server" Visible="False" Text='<%# Eval("Prod_id") %>'></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                </asp:DataList>
            </td>
            <td>
                <asp:ImageButton ID="ImgbtnViewCart" runat="server" 
                    ImageUrl="~/images/buttons/view-cart-button.jpg" 
                    onclick="ImgbtnViewCart_Click" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <br />
    <br />
</asp:Content>
