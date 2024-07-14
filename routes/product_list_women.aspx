<%@ Page Title="" Language="C#" MasterPageFile="~/BeforeLogin.Master" AutoEventWireup="true" CodeBehind="product_list_women.aspx.cs" Inherits="AWAD_Assignment.routes.product_list_women" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">Women's clothes</asp:Content>

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
                            <h2>Women's Clothes</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- slider Area End-->
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="body" runat="server">
    <!-- product list part start-->
    <section class="product_list section_padding">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="product_sidebar">
                        <!--
                        <div class="single_sedebar">
                            <form action="#">
                                <input type="text" name="#" placeholder="Search keyword">
                                <i class="ti-search"></i>
                            </form>
                        </div>
                        -->
                        <div class="single_sedebar">
                            <div class="select_option">
                                <div class="select_option_list">Category <i class="right fas fa-caret-down"></i> </div>
                                <div class="select_option_dropdown">
                                    <!-- <p><a href="#">Category 1</a></p> -->

                                    <!-- https://social.msdn.microsoft.com/Forums/en-US/c6b83e4a-854b-48fa-9daf-d56b7f5abe1b/how-to-a-href-onclick-event-in-aspnet-c#:~:text=Just%20use%20an%20asp%3ALinkButton.%20That%20control%20is%20there,tag%20%28%3Ca%3E%29%20in%20the%20browser.%20%3Casp%3Alinkbutton%20runat%3D%22server%22%20OnClick%3D%22login_Click%22%3ELinkButton%3C%2Fasp%3Alinkbutton%3E -->
                                    
                                    <%--<p><asp:LinkButton runat="server" Text="" ID="LinkButtonCategory0" OnClick="LinkButtonCategory0_Click"></asp:LinkButton></p>--%>
                                    <p><asp:LinkButton runat="server" Text="" ID="LinkButtonCategory1" OnClick="LinkButtonCategory1_Click"></asp:LinkButton></p>
                                    <p><asp:LinkButton runat="server" Text="" ID="LinkButtonCategory2" OnClick="LinkButtonCategory2_Click"></asp:LinkButton></p>
                                    <p><asp:LinkButton runat="server" Text="" ID="LinkButtonCategory3" OnClick="LinkButtonCategory3_Click"></asp:LinkButton></p>
                                    <p><asp:LinkButton runat="server" Text="" ID="LinkButtonCategory4" OnClick="LinkButtonCategory4_Click"></asp:LinkButton></p>
                                    <p><asp:LinkButton runat="server" Text="" ID="LinkButtonCategory5" OnClick="LinkButtonCategory5_Click"></asp:LinkButton></p>

                                </div>
                            </div>
                        </div>
                        <!--
                        <div class="single_sedebar">
                            <div class="select_option">
                                <div class="select_option_list">Type <i class="right fas fa-caret-down"></i> </div>
                                <div class="select_option_dropdown">
                                    <p><a href="#">Type 1</a></p>
                                    <p><a href="#">Type 2</a></p>
                                    <p><a href="#">Type 3</a></p>
                                    <p><a href="#">Type 4</a></p>
                                </div>
                            </div>
                        </div>
                        -->
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="product_list">
                        <div class="row">
                            <asp:Repeater ID="Repeater1" runat="server">
                                <ItemTemplate>
                                    <div class="col-lg-6 col-sm-6">
                                        <div class="single_product_item">
                                            <asp:ImageButton ID="ImageButton_men_TBD" PostBackUrl='<%# ResolveUrl("../product?id=" + Eval("Id"))%>' ImageUrl='<%# "../assets/img/_clothing/carousel/" + Eval("Id").ToString() + "/1.jpg" %>' runat="server" CssClass="img-fluid" />
                                            <h3><asp:LinkButton ID="LinkButton_name" PostBackUrl='<%# ResolveUrl("../product?id=" + Eval("Id"))%>' runat="server" Text='<%# Eval("name")%>'></asp:LinkButton></h3>
                                            <p><asp:Label ID="Label_price" runat="server" Text='<%# string.Format("${0:00.00}", double.Parse(Eval("price").ToString()))%>'></asp:Label></p>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                        <!--
                        <div class="load_more_btn text-center">
                            <a href="#" class="btn_3">Load More</a>
                        </div>
                        -->
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- product list part end-->

    <!-- client review part here -->
    <!-- client review part end -->

    <!-- Shop Method Start-->
    <div class="shop-method-area section-padding30">
        <div class="container">
            <div class="row d-flex justify-content-between">
                <div class="col-xl-3 col-lg-3 col-md-6">
                    <div class="single-method mb-40">
                        <i class="ti-package"></i>
                        <h6>Free Shipping Method</h6>
                        <p>aorem ixpsacdolor sit ameasecur adipisicing elitsf edasd.</p>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-6">
                    <div class="single-method mb-40">
                        <i class="ti-unlock"></i>
                        <h6>Secure Payment System</h6>
                        <p>aorem ixpsacdolor sit ameasecur adipisicing elitsf edasd.</p>
                    </div>
                </div> 
                <div class="col-xl-3 col-lg-3 col-md-6">
                    <div class="single-method mb-40">
                        <i class="ti-reload"></i>
                        <h6>Secure Payment System</h6>
                        <p>aorem ixpsacdolor sit ameasecur adipisicing elitsf edasd.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Shop Method End-->

    <!-- subscribe part here -->
    <section class="subscribe_part section_padding">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="subscribe_part_content">
                        <h2>Get promotions & updates!</h2>
                        <p>Seamlessly empower fully researched growth strategies and interoperable internal or “organic” sources credibly innovate granular internal .</p>
                        <div class="subscribe_form">
                            <form action="#">
                            <input type="email" placeholder="Enter your mail">
                            <button class="btn_1">Subscribe</button> <!-- TODO, button or can i use anchor tag to submit form? -->
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- subscribe part end -->

</asp:Content>