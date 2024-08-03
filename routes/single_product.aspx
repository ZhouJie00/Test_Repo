<%@ Page Title="" Language="C#" MasterPageFile="~/BeforeLogin.Master" AutoEventWireup="true" CodeBehind="single_product.aspx.cs" Inherits="AWAD_Assignment.routes.single_product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">Product</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style>
        .Star {
            background-image: url(../assets/img/_ratingStars/Star.gif);
            height: 17px;
            width: 17px;
        }

        .WaitingStar {
            background-image: url(../assets/img/_ratingStars/WaitingStar.gif);
            height: 17px;
            width: 17px;
        }

        .FilledStar {
            background-image: url(../assets/img/_ratingStars/FilledStar.gif);
            height: 17px;
            width: 17px;
        }

        .RatingBoxStars {
            display: flex;
            flex-direction: column;
            align-content: center;
            flex-wrap: nowrap;
            justify-content: center;
            float: left
        }

        .RatingBoxText {
            padding-left: 100px;
        }

        .SubmitReviewButton {
            border-radius: 10px;
        }
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
                            <h2>product Details</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- slider Area End-->
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="body" runat="server">
    <!--================Single Product Area =================-->
    <div class="product_image_area">
        <div class="container">
            <di class="row justify-content-center">
                <div class="col-lg-10">
                    <div class="product_img_slide owl-carousel">
                        <!--
                        <div class="single_product_img">
                            <img src="../assets/img/product/single_product.png" alt="#" class="img-fluid">
                        </div>
                        -->

                        <asp:Repeater ID="RepeaterImages" runat="server">
                            <ItemTemplate>
                                <div class="single_product_img">
                                    <asp:Image runat="server" ImageUrl='<%# Eval("paths")%>' />
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>

                        <!--
                        <div class="single_product_img">
                            <img src="../assets/img/product/single_product.png" alt="#" class="img-fluid">
                        </div>

                        <div class="single_product_img">
                            <img src="../assets/img/product/single_product.png" alt="#" class="img-fluid">
                        </div>
                        -->
                    </div>
                </div>

                <div class="row d-flex justify-content-center">
                    <div class="col-lg-8">
                        <div class="single_product_text text-center" style="margin-bottom: 10px;">
                            <h3>
                                <asp:Label ID="Label_Clothes_name" runat="server"></asp:Label></h3>
                            <div class="rating">
                                <div id="ratingContainer" style="display: inline">
                                </div>
                                <span>-
                                <asp:Label runat="server" ID="Label_AverageReviewStar" Text=""></asp:Label>&nbsp;Stars</span>
                            </div>
                        </div>
                        <h3 style="text-align: center;">
                            <asp:Label ID="Label_Clothes_price" runat="server"></asp:Label></h3>
                        <p style="margin: 30px 0 30px 0">
                            <h3>Description</h3>

                            <asp:Label ID="Label_Clothes_overview" runat="server"></asp:Label>

                        </p>


                        <span>Size:</span>
                        <div class="product_count d-inline-block">
                            <asp:ListBox ID="ListBox_Size" runat="server">
                                <asp:ListItem CssClass="spacing_given" Text="XS" Value="XS"></asp:ListItem>
                                <asp:ListItem CssClass="spacing_given" Text="S" Value="S"></asp:ListItem>
                                <asp:ListItem CssClass="spacing_given" Text="M" Value="M" Selected="True"></asp:ListItem>
                                <asp:ListItem CssClass="spacing_given" Text="L" Value="L"></asp:ListItem>
                                <asp:ListItem CssClass="spacing_given" Text="XL" Value="XL"></asp:ListItem>
                            </asp:ListBox>
                        </div>

                        <span style="margin-left: 30px;"></span>

                        <span>Colour:</span>
                        <div class="product_count d-inline-block">
                            <asp:ListBox ID="ListBox_Colour" runat="server">
                                <asp:ListItem Text="Black" Value="Black" Selected="True"></asp:ListItem>
                                <asp:ListItem Text="White" Value="White"></asp:ListItem>
                                <asp:ListItem Text="Blue" Value="Blue"></asp:ListItem>
                            </asp:ListBox>
                        </div>

                        <span style="margin-left: 30px;"></span>

                        <span>Quantity:</span>
                        <div class="product_count d-inline-block">
                            <asp:ListBox ID="ListBox_Quantity" runat="server">
                                <asp:ListItem Text="1" Value="1" Selected="True"></asp:ListItem>
                                <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                <asp:ListItem Text="5" Value="5"></asp:ListItem>
                            </asp:ListBox>
                        </div>

                        <div class="add_to_cart" style="margin-top: 20px; margin-bottom: 50px; display: flex; flex-direction: row-reverse;">
                            <!-- <a href="#" class="btn_3">add to cart</a> -->
                            <asp:Button ID="Button_AddToCart" CssClass="btn_3" Text="Add to Cart" OnClick="Button_AddToCart_Click" runat="server" />
                        </div>
                    
                    





                                            <br />
<br />
<br />
<br /> <br /> <br /> <br /> <br />

                   <h2>Customer Reviews (<asp:Label runat="server" ID="Label_ReviewCount"></asp:Label>)</h2>


                    <div class="col-lg-8">
    <!-- Rating Div -->
    <div class="RatingBoxStars">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <ajaxToolkit:Rating ID="Rating1" runat="server"
            StarCssClass="Star"
            WaitingStarCssClass="WaitingStar"
            EmptyStarCssClass="Star"
            FilledStarCssClass="FilledStar">
        </ajaxToolkit:Rating>
    </div>
    <div class="RatingBoxText">
        <asp:TextBox ID="TextBox_ReviewDescription" TextMode="MultiLine" Placeholder="Leave a review!" Width="30em" runat="server"></asp:TextBox>
        <asp:Button runat="server" ID="Button_SubmitReview" CssClass="btn-warning SubmitReviewButton" Text="Submit Review" OnClick="Button_SubmitReview_Click" />
    </div>
</div>
<br />
<br />
<br />
<br />
<%-- Repeater Here to go through all reviews --%>
<asp:Repeater ID="RepeaterReview" runat="server">
    <ItemTemplate>
        <h5>
            <asp:Label runat="server" Text='<%# Eval("name")%>'></asp:Label></h5>
        <p>
            <asp:Label runat="server" Text='<%# Eval("review")%>'></asp:Label>
        </p>
    </ItemTemplate>
</asp:Repeater>





                    
                    
                    </div>

                    



                </div>


                                

               



        </div>
    </div>
    <!--================End Single Product Area =================-->


    <!-- subscribe part here -->
    <section class="subscribe_part section_padding">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="subscribe_part_content">
                        <h2>Get promotions & updates!</h2>
                        <p>Seamlessly empower fully researched growth strategies and interoperable internal or “organic” sources credibly innovate granular internal .</p>
                        <div class="subscribe_form">
                            <input type="email" placeholder="Enter your mail">
                            <a href="#" class="btn_1">Subscribe</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- subscribe part end -->
    <script>

        const avgRating = document.getElementById('body_Label_AverageReviewStar').innerText;
        const ratingDiv = document.getElementById('ratingContainer'); //document.querySelector(".rating");

        // Create rating stars
        const star = document.createElement("i");
        star.classList.add("fa");
        star.classList.add("fa-star");
        const halfStar = document.createElement("i");
        halfStar.classList.add("fa");
        halfStar.classList.add("fa-star-half");


        if (Number.isInteger(Number(avgRating))) {
            for (let i = 0; i < Number(avgRating); i++) {
                ratingDiv.appendChild(star.cloneNode(true));
            }
        } else {
            // Check if the decimal is more then .50
            const decimalNumber = Number("0" + avgRating.split('.')[1][0]); // Only get the first decimal place
            if (decimalNumber >= 5) {
                for (let i = 0; i < Number(avgRating) - 1; i++) {
                    ratingDiv.appendChild(star.cloneNode(true));
                }
                ratingDiv.appendChild(halfStar);
            } else {
                for (let i = 0; i < Number(avgRating); i++) {
                    ratingDiv.appendChild(star.cloneNode(true));
                }
            }
        }


    </script>
</asp:Content>
