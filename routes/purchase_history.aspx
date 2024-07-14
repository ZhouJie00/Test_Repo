<%@ Page Title="" Language="C#" MasterPageFile="~/AfterLogin.Master" AutoEventWireup="true" CodeBehind="purchase_history.aspx.cs" Inherits="AWAD_Assignment.routes.purchase_history" %>


<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">Purchase History</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style>
    </style>

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
                            <h2>Purchase History</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- slider Area End-->
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="body" runat="server">

    <asp:Repeater ID="RepeaterHistory" runat="server">
    <ItemTemplate>
        <div style="margin-bottom:1.5rem;">
            <table class="table">
                <tr><td>Order</td><th><%# Eval("Id") %></th></tr>
                <tr><td>Total</td><td><%# Eval("total") %></td></tr>
                <tr><td>Date</td><td><%# Eval("date_purchased") %></td></tr>
                
               <%-- <asp:Repeater ID="RepeaterHistoryChild" runat="server" OnDataBinding="RepeaterHistoryChild_DataBinding">
                    <ItemTemplate>
                        <div class="s-ingle_product_img">
                            <table>
                                <tr><th><%# Eval("Id") %></th></tr>
                                <tr><td>Quantity</td><td><%# Eval("quantity") %></td></tr>
                                <tr><td>clothing</td><td><%# Eval("clothing_id") %></td></tr>
                            </table>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>--%>

            </table>
        </div>
    </ItemTemplate>
</asp:Repeater>


    <script>
    </script>
</asp:Content>

