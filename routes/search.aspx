<%@ Page Title="" Language="C#" MasterPageFile="~/BeforeLogin.Master" AutoEventWireup="true" CodeBehind="search.aspx.cs" Inherits="AWAD_Assignment.routes.search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">Search</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Preloader" runat="server">
    <!-- Preloader Start -->
    <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
                <div class="preloader-circle"></div>
                <div class="preloader-img pere-text">
                    <img src="../assets/img/logo/logo.png" alt="">
                </div>
            </div>
        </div>
    </div>
    <!-- Preloader End -->
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
                            <h2>Search</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- slider Area End-->
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="body" runat="server">
    <!-- Latest Products Start -->
    <section class="latest-product-area latest-padding">
        <div class="container">

            <!-- Nav Card -->
            <div class="tab-content" id="nav-tabContent">
                <!-- card one -->
                <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                    <div class="row">

                        <asp:Repeater ID="Repeater1" runat="server">
                            <ItemTemplate>
                                <div class="col-xl-4 col-lg-4 col-md-6">
                                    <div class="single-product mb-60">
                                        <div class="product-img">
                                            <!-- <img src="../assets/img/categori/product1.png" alt=""> -->
                                            <asp:ImageButton ID="ImageButton_men_TBD" PostBackUrl='<%# ResolveUrl("../product?id=" + Eval("Id"))%>' ImageUrl='<%# "../assets/img/_clothing/carousel/"+Eval("Id")+"/1.jpg"%>' Width="370px" Height="403px" runat="server" />

                                            <!--
                                            <div class="new-product">
                                                <span>New</span>
                                            </div>
                                            -->
                                        </div>
                                        <div class="product-caption">
                                            <!--
                                            <div class="product-ratting">
                                                <i class="far fa-star"></i>
                                                <i class="far fa-star"></i>
                                                <i class="far fa-star"></i>
                                                <i class="far fa-star low-star"></i>
                                                <i class="far fa-star low-star"></i>
                                            </div>
                                            -->
                                            <h4>
                                                <!-- <a href="#">Green Dress with details</a> -->
                                                <%--<asp:Label runat="server" Text='<%# Eval("name")%>'></asp:Label>--%>
                                                <asp:LinkButton runat="server" PostBackUrl='<%# ResolveUrl("../product?id=" + Eval("Id"))%>' Text='<%# Eval("name")%>'></asp:LinkButton>
                                            </h4>
                                            <div class="price">
                                                <ul>
                                                    <li>
                                                        <asp:Label ID="Label_price" runat="server" Text='<%# String.Format("${0:00.00}", double.Parse(Eval("price").ToString()))%>'></asp:Label></li>
                                                    <%--<li class="discount">$60.00</li>--%>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
                <div style="text-align: center;">
                    <asp:Label runat="server" CssClass="h3" Text="No Results Found" ID="Label_NoResultsFound"></asp:Label>
                </div>
            </div>
            <!-- End Nav Card -->
        </div>
    </section>
    <!-- Latest Products End -->

    <!-- Latest Offers Start -->
    <!-- Latest Offers End -->

    <!-- Shop Method Start-->
    <!-- Shop Method End-->

    <!-- Gallery Start-->
    <div class="gallery-wrapper lf-padding">
        <div class="gallery-area">
            <div class="container-fluid">
                <div class="row">
                    <div class="gallery-items">
                        <img src="../assets/img/gallery/gallery1.jpg" alt="">
                    </div>
                    <div class="gallery-items">
                        <img src="../assets/img/gallery/gallery2.jpg" alt="">
                    </div>
                    <div class="gallery-items">
                        <img src="../assets/img/gallery/gallery3.jpg" alt="">
                    </div>
                    <div class="gallery-items">
                        <img src="../assets/img/gallery/gallery4.jpg" alt="">
                    </div>
                    <div class="gallery-items">
                        <img src="../assets/img/gallery/gallery5.jpg" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Gallery End-->
</asp:Content>
