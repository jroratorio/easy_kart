<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="OnlineShopping.Pages.ProductDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 99%;
        }
        .style2
        {
            height: 37px;
            text-align: center;
        }
        .style3
        {
            height: 45px;
            text-align: center;
        }
        .style5
        {
            height: 42px;
            text-align: center;
        }
        .style6
        {
            font-size: large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <asp:Label ID="lbl_NoStock" runat="server" ForeColor="Red" 
            Text="Product can not be added! No stock!"></asp:Label>
    &nbsp;<asp:Label ID="lbl_AddedToCart" runat="server" ForeColor="#00CC00" 
            Text="Added to Cart!" Visible="False"></asp:Label>
    </p>
    <p>
        <br />
        <asp:DataList ID="DetailList" runat="server" RepeatDirection="Horizontal" 
            onselectedindexchanged="DetailList_SelectedIndexChanged">
            <ItemTemplate>
                <table class="style1">
                    <tr>
                        <td>
                            <asp:Image ID="img_Thumbnail" Height="300px" Width="300px" ImageUrl='<%# Eval("image") %>' runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="lbl_Brand" runat="server" Text='<%# Eval("Brand") %>'></asp:Label>
                            &nbsp;<asp:Label ID="lbl_Prod_name" runat="server" Text='<%# Eval("Prod_name") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            <span class="style6"><strong>Specifications:</strong></span><br />
                            <asp:Label ID="lbl_Prod_specs" runat="server" Text='<%# Eval("Specs") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: center">
                            <span class="style6"><strong>Price:</strong></span><br />
                            <asp:Label ID="lbl_Price" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style5">
                            <strong>Stock:</strong>
                            <asp:Label ID="lbl_Stock" runat="server" Text='<%# Eval("Stock") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: center">
                            <asp:LinkButton ID="btn_AddToCart" runat="server" onclick="btn_AddToCart_Click"> Add To Cart</asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
    </p>
</asp:Content>
