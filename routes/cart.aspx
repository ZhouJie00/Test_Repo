<%@ Page Title="" Language="C#" MasterPageFile="~/BeforeLogin.Master" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="AWAD_Assignment.routes.cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">Shopping Cart</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Preloader" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="sliderAreaContent" runat="server">
    <!-- slider Area Start-->
    <div class="slider-area ">
        <!-- Mobile Menu -->
        <div class="single-slider slider-height2 d-flex align-items-center" data-background="../assets/img/hero/category.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="hero-cap text-center">
                            <h2>Shopping Cart</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- slider Area End-->
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="body" runat="server">
    <!--================Cart Area =================-->
    <section class="cart_area section_padding">
        <div class="container">
            <div class="cart_inner">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Product</th>
                                <th scope="col">Price</th>
                                <th scope="col">Quantity</th>
                                <th scope="col">Total</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%--<asp:Repeater ID="Repeater1" runat="server" OnItemCommand="R1_ItemCommand">--%> 
                            <asp:Repeater ID="Repeater1" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <div class="media">
                                                <div class="d-flex">
                                                    <asp:Image runat="server" ImageUrl='<%# Eval("image")%>' ID="Image_Checkout" />
                                                </div>
                                                <div class="media-body">
                                                    <p>
                                                        <asp:Label runat="server" Text='<%# Eval("name")%>' ID="Label_Name"></asp:Label>
                                                        <asp:Label runat="server" Visible="false" Enabled="false" Font-Size="XX-Small" Text='<%# Eval("id")%>' ID="Label_ID"></asp:Label>
                                                    </p>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <h5>
                                                <asp:Label runat="server" ID="Label_Price" Text='<%# string.Format("${0:00.00}", double.Parse(Eval("price").ToString()))%>'></asp:Label></h5>
                                        </td>
                                        <td>
                                            <div class="product_count">
                                                <asp:TextBox runat="server" TextMode="Number" Text='<%# Eval("quantity")%>' CssClass="boxquantity" ID="TextBox_CartQuantity"></asp:TextBox>
                                            </div>
                                        </td>
                                        <td>
                                            <h5>
                                                <asp:Label runat="server" ID="Label_Total" Text='<%# string.Format("${0:00.00}", double.Parse(Eval("total").ToString()))%>'></asp:Label></h5>
                                        </td>
                                        <td>
                                            <%--//==== Here we have used CommandName property to distinguish which button is  clicked and we have passed our primary key to CommandArgument property. ====//--%>
                                            <%--<asp:Button runat="server" ID="Button_Edit" Text="Update" CommandName="Edit" ToolTip="Update a record." CommandArgument='<%#Eval("id")+","+ Eval("quantity")%>'/>--%>
                                            <%--<asp:Button runat="server" ID="Button_Delete" Text="Delete" CommandName="Delete" ToolTip="Delete a record." CommandArgument='<%#Eval("id")%>'/>--%>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                            
                            <tr class="bottom_button">
                                <td>
                                    <!-- <a class="btn_1" href="#">t</a> -->
                                    <%--<asp:LinkButton runat="server" CssClass="btn_1" Text="Update Cart" OnClick="LinkButton_UpdateCart_Click" ID="LinkButton_UpdateCart"></asp:LinkButton>--%>
                                    <%--<asp:LinkButton runat="server" CssClass="btn_1" Text="Update Cart" OnClick="LinkButton_UpdateCart_Click" ID="LinkButton_UpdateCart"></asp:LinkButton>--%>
                                    <asp:Button runat="server" CssClass="btn_1" Text="Update Cart" OnClick="Button_UpdateCart_Click" ID="Button_UpdateCart" />
                                </td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td>
                                    <h5>Subtotal</h5>
                                </td>
                                <td>
                                    <h5>
                                        <asp:Label ID="Label_SubTotal" runat="server"></asp:Label></h5>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="checkout_btn_inner float-right">
                        <a class="btn_1 checkout_btn_1" href="/checkout">Proceed to checkout</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--================End Cart Area =================-->
    <script defer>
        const qty = document.querySelectorAll('.boxquantity');
        console.log(qty);
        qty.forEach(element => {
            element.setAttribute('min', 0);
            element.setAttribute('max', 5);
        })
    </script>
</asp:Content>
