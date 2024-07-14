<%@ Page Title="" Language="C#" MasterPageFile="~/BeforeLogin.Master" AutoEventWireup="true" CodeBehind="confirmation.aspx.cs" Inherits="AWAD_Assignment.routes.confirmation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">Confirmation</asp:Content>

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
                            <h2>Confirmation</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- slider Area End-->
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="body" runat="server">
    <!--================ confirmation part start =================-->
    <section class="confirmation_part section_padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="confirmation_tittle">
                        <span>Thank you. Your order has been received.</span>
                    </div>
                </div>
                <div class="col-lg-6 col-lx-4">
                    <div class="single_confirmation_details">
                        <h4>order info</h4>
                        <ul>
                            <li>
                                <p>order number</p>
                                <span>:
                                    <asp:Label runat="server" ID="Label_OrderNumber"></asp:Label></span>
                            </li>
                            <li>
                                <p>date</p>
                                <span>:
                                    <asp:Label runat="server" ID="Label_Date"></asp:Label></span>
                            </li>
                            <li>
                                <p>total</p>
                                <span>:
                                    <asp:Label runat="server" ID="Label_total"></asp:Label></span>
                            </li>
                            <li>
                                <p>payment method</p>
                                <span>: Stripe payment</span>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-6 col-lx-4">
                    <div class="single_confirmation_details">
                        <h4>shipping Address</h4>
                        <ul>
                            <li>
                                <p>Street</p>
                                <span>:
                                    <asp:Label runat="server" ID="Label_street"></asp:Label></span>
                            </li>
                            <li>
                                <p>city</p>
                                <span>: Singapore</span>
                            </li>
                            <li>
                                <p>country</p>
                                <span>: Singapore</span>
                            </li>
                            <li>
                                <p>postcode</p>
                                <span>:
                                    <asp:Label runat="server" ID="Label_Zipcode"></asp:Label></span>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="order_details_iner">
                        <h3>Order Details</h3>
                        <table class="table table-borderless">
                            <thead>
                                <tr>
                                    <th scope="col" colspan="2">Product</th>
                                    <th scope="col">Quantity</th>
                                    <th scope="col">Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <asp:Repeater ID="Repeater1" runat="server">
                                        <ItemTemplate>
                                            <th colspan="2"><span><asp:Label runat="server" ID="Label_Name" Text='<%#Eval("name") %>'></asp:Label></span></th>
                                            <th><asp:Label runat="server" ID="Label_Quantity" Text='<%# "x " + string.Format("{0:D2}", Eval("quantity").ToString()) %>'></asp:Label></th>
                                            <th><span><asp:Label runat="server" ID="Label_TotalPrice" Text='<%# string.Format("${0:00.00}", double.Parse(Eval("price").ToString())) %>'></asp:Label></span></th>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tr>
                                <tr>
                                    <th colspan="3">Subtotal</th>
                                    <th><span>
                                        <asp:Label runat="server" ID="Label_Subtotal"></asp:Label></span></th>
                                </tr>
                                <tr>
                                    <th colspan="3">shipping</th>
                                    <th><span>flat rate: $50.00</span></th>
                                </tr>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th scope="col" colspan="3">Quantity</th>
                                    <th scope="col">Total</th>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--================ confirmation part end =================-->
</asp:Content>
