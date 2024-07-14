<%@ Page Title="" Language="C#" MasterPageFile="~/BeforeLogin.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="AWAD_Assignment.routes.index1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">Estore V2</asp:Content>

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
    <!-- slider Area Start -->
        <div class="slider-area ">
            <!-- Mobile Menu -->
            <div class="slider-active">
                <div class="single-slider slider-height" data-background="../assets/img/hero/h1_hero.jpg">
                    <div class="container">
                        <div class="row d-flex align-items-center justify-content-between">
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 d-none d-md-block">
                                <div class="hero__img" data-animation="bounceIn" data-delay=".4s">
                                    <img src="../assets/img/hero/hero_man.png" alt="">
                                </div>
                            </div>
                            <div class="col-xl-5 col-lg-5 col-md-5 col-sm-8">
                                <div class="hero__caption">
                                    <span data-animation="fadeInRight" data-delay=".4s">60% Discount</span>
                                    <h1 data-animation="fadeInRight" data-delay=".6s">Winter <br> Collection</h1>
                                    <p data-animation="fadeInRight" data-delay=".8s">Best Cloth Collection By 2024!</p>
                                    <!-- Hero-btn -->
                                    <div class="hero__btn" data-animation="fadeInRight" data-delay="1s">
                                        <a href="#" class="btn hero-btn">Shop Now</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="single-slider slider-height" data-background="../assets/img/hero/h1_hero.jpg">
                    <div class="container">
                        <div class="row d-flex align-items-center justify-content-between">
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 d-none d-md-block">
                                <div class="hero__img" data-animation="bounceIn" data-delay=".4s">
                                    <img src="../assets/img/hero/hero_man.png" alt="">
                                </div>
                            </div>
                            <div class="col-xl-5 col-lg-5 col-md-5 col-sm-8">
                                <div class="hero__caption">
                                    <span data-animation="fadeInRight" data-delay=".4s">60% Discount</span>
                                    <h1 data-animation="fadeInRight" data-delay=".6s">Winter <br> Collection</h1>
                                    <p data-animation="fadeInRight" data-delay=".8s">Best Cloth Collection By 2020!</p>
                                    <!-- Hero-btn -->
                                    <div class="hero__btn" data-animation="fadeInRight" data-delay="1s">
                                        <a href="#" class="btn hero-btn">Shop Now</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- slider Area End-->
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="body" runat="server">
    <!-- Category Area Start-->
        <section class="category-area section-padding30">
    z
            <div class="container-fluid">
                <!-- Section Tittle -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-tittle text-center mb-85">
                            <h2>Shop by Category</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xl-4 col-lg-6">
                        <div class="single-category mb-30">
                            <div class="category-img">
                                <img src="../assets/img/categori/cat1.jpg" alt="">
                                <div class="category-caption">
                                    <h2>Women`s</h2>
                                    <span class="best"><a href="/productsWomen?q=tops">Best New Deals</a></span>
                                    <span class="collection">New Collection</span>
                                </div>
                            </div>
                        </div>
                    </div>
                     <div class="col-xl-4 col-lg-6">
                        <div class="single-category mb-30">
                            <div class="category-img text-center">
                                <img src="../assets/img/categori/cat2.jpg" alt="">
                                <div class="category-caption">
                                    <span class="collection">Discount!</span>
                                    <h2>Winter Cloth</h2>
                                   <p>New Collection</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-6">
                        <div class="single-category mb-30">
                            <div class="category-img">
                                <img src="../assets/img/categori/cat3.jpg" alt="">
                                <div class="category-caption">
                                    <h2>Man`s Cloth</h2>
                                    <span class="best"><a href="/productsMen?q=tops">Best New Deals</a></span>
                                    <span class="collection">New Collection</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Category Area End-->

        <!-- Latest Products Start -->
        <section class="latest-product-area padding-bottom">
            <div class="container">
                <div class="row product-btn d-flex justify-content-end align-items-end">
                    <!-- Section Tittle -->
                    <div class="col-xl-4 col-lg-5 col-md-5">
                        <div class="section-tittle mb-30">
                            <h2>Latest Products</h2>
                        </div>
                    </div>
                    <div class="col-xl-8 col-lg-7 col-md-7">
                        <div class="properties__button f-right">
                            <!--Nav Button  -->
                            <nav>                                                                                                
                                <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                    <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">New</a>
                                    <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">Featured</a>
                                </div>
                            </nav>
                            <!--End Nav Button  -->
                        </div>
                    </div>
                </div>
                <!-- Nav Card -->
                <div class="tab-content" id="nav-tabContent">
                    <!-- card one -->
                    <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                        <div class="row">
                            <asp:Repeater ID="RepeaterNew" runat="server">
                                <ItemTemplate>
                                    <div class="col-xl-4 col-lg-4 col-md-6">
                                        <div class="single-product mb-60">
                                            <div class="product-img">
                                                <asp:ImageButton PostBackUrl='<%# ResolveUrl("../product?id=" + Eval("Id"))%>' ImageUrl='<%# "../assets/img/_clothing/carousel/"+Eval("Id")+"/1.jpg"%>' Width="370px" Height="403px" runat="server" />
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
                                                <h4><asp:LinkButton runat="server" PostBackUrl='<%# ResolveUrl("../product?id=" + Eval("Id"))%>' Text='<%# Eval("name")%>'></asp:LinkButton></h4>
                                                <div class="price">
                                                    <ul>
                                                        <li><asp:Label ID="Label_price" runat="server" Text='<%# String.Format("${0:00.00}", double.Parse(Eval("price").ToString()))%>'></asp:Label></li>
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
                    <!-- Card two -->
                    <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                        <div class="row">
                            <asp:Repeater ID="RepeaterRandom" runat="server">
                                <ItemTemplate>
                                    <div class="col-xl-4 col-lg-4 col-md-6">
                                        <div class="single-product mb-60">
                                            <div class="product-img">
                                                <asp:ImageButton PostBackUrl='<%# ResolveUrl("../product?id=" + Eval("Id"))%>' ImageUrl='<%# "../assets/img/_clothing/carousel/"+Eval("Id")+"/1.jpg"%>' Width="370px" Height="403px" runat="server" />
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
                                                <h4><asp:LinkButton runat="server" PostBackUrl='<%# ResolveUrl("../product?id=" + Eval("Id"))%>' Text='<%# Eval("name")%>'></asp:LinkButton></h4>
                                                <div class="price">
                                                    <ul>
                                                        <li><asp:Label ID="Label_price" runat="server" Text='<%# String.Format("${0:00.00}", double.Parse(Eval("price").ToString()))%>'></asp:Label></li>
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
                </div>
                <!-- End Nav Card -->
            </div>
        </section>
        <!-- Latest Products End -->

        <!-- Best Product Start -->
        <!-- Best Product End-->

        <!-- Best Collection Start -->
        <!-- Best Collection End -->

        <!-- Latest Offers Start -->
        <div class="latest-wrapper lf-padding">
            <div class="latest-area latest-height d-flex align-items-center" data-background="../assets/img/collection/latest-offer.png">
                <div class="container">
                    <div class="row d-flex align-items-center">
                        <div class="col-xl-5 col-lg-5 col-md-6 offset-xl-1 offset-lg-1">
                            <div class="latest-caption">
                                <h2>Get Our<br>Latest Offers News</h2>
                                <p>Subscribe news letter</p>
                            </div>
                        </div>
                         <div class="col-xl-5 col-lg-5 col-md-6 ">
                            <div class="latest-subscribe">
                                <form action="#">
                                    <input type="email" placeholder="Your email here">
                                    <button>Shop Now</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- man Shape -->
                <div class="man-shape">
                    <img src="../assets/img/collection/latest-man.png" alt="">
                </div>
            </div>
        </div>
        <!-- Latest Offers End -->

        <!-- Shop Method Start-->
        <div class="shop-method-area section-padding30">
            <div class="container">
                <div class="row d-flex justify-content-between">
                    <div class="col-xl-3 col-lg-3 col-md-6">
                        <div class="single-method mb-40">
                            <i class="ti-package"></i>
                            <h6>Free Shipping Method</h6>
                            <p>
                                We offer free shipping globally.
                            </p>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-6">
                        <div class="single-method mb-40">
                            <i class="ti-unlock"></i>
                            <h6>Secure Payment System</h6>
                            <p>
                                Estore maintains the highest levels of security.<Br />
                                Our website uses high-level encryption technology, advanced security software currently available for online transactions.
                            </p>
                        </div>
                    </div> 
                    <div class="col-xl-3 col-lg-3 col-md-6">
                        <div class="single-method mb-40">
                            <i class="ti-reload"></i>
                            <h6>Easy Exchanges & Returns</h6>
                            <p>Change your mind anytime! <br />
                               You can exchange or return at any one of our stores or return online anytime!
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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
