<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SearchResults.aspx.cs" Inherits="OnlineShopping.Pages.SearchResults" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 96%;
        }
        .style4
        {
            height: 32px;
            text-align: left;
        }
        .style6
        {
            width: 137px;
        }
        .style7
        {
            height: 32px;
            width: 721px;
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="style1">
        <tr>
            <td class="style7">
                <asp:Label ID="lbl_NoResults" runat="server" ForeColor="Red" 
                    Text="No results found!" Visible="False" style="text-align: left"></asp:Label>
            &nbsp;
                <asp:Label ID="lbl_NoStock" runat="server" ForeColor="Red" 
                    Text="Product can not be added! No Stock!" Visible="False"></asp:Label>
            &nbsp;<asp:Label ID="lbl_AddedToCart" runat="server" ForeColor="#00CC00" 
                    Text="Added to Cart!" Visible="False"></asp:Label>
            </td>
            <td class="style4">
                &nbsp;&nbsp;
                <asp:Label ID="lbl_SortBy" runat="server" Text="Sort By"></asp:Label>
&nbsp;&nbsp;
                <asp:DropDownList ID="drpdwn_Sort" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="drpdwn_Sort_SelectedIndexChanged">
                    <asp:ListItem>--Select--</asp:ListItem>
                    <asp:ListItem>Name</asp:ListItem>
                    <asp:ListItem>Price</asp:ListItem>
                    <asp:ListItem>Category</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:DataList ID="SearchList" runat="server" RepeatDirection="Horizontal" 
                    style="text-align: left" BackColor="White" BorderColor="#E7E7FF" 
                    BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                    GridLines="Horizontal" RepeatColumns="5" Width="100px">
                    <AlternatingItemStyle BackColor="#F7F7F7" />
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <ItemStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <ItemTemplate>
                        <table class="style1">
                            <tr>
                                <td colspan="2">
                                    <asp:ImageButton ID="imgbtn_Thumbnail" height="150px" Width="150px" 
                                        ImageUrl='<%# Eval("Image") %>' runat="server" 
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
                                <td class="style6">
                                    <asp:LinkButton ID="lbtn_AddToCart" runat="server" Text='Add to Cart' 
                                        onclick="lbtn_AddToCart_Click">Add to Cart</asp:LinkButton>
                                </td>
                                <td>
                                    <asp:Label ID="lbl_Prod_id" runat="server" Text='<%# Eval("Prod_id") %>' Visible="False"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                </asp:DataList>
            </td>
            <td style="text-align: center">
                <asp:ImageButton ID="imgbtn_ViewCart" runat="server" 
                    ImageUrl="~/images/buttons/view-cart-button.jpg" 
                    onclick="imgbtn_ViewCart_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
