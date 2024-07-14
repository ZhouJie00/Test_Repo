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
            <div class="row justify-content-center">
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
                            <strong>Description</strong>
                            Coat <span class="Star"></span>with quilted lining and an adjustable hood. Featuring long sleeves with adjustable cuff 
                                        tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening with placket.
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

                        <div class="add_to_cart" style="margin-top: 20px;margin-bottom:50px;display:flex;flex-direction:row-reverse;">
                            <!-- <a href="#" class="btn_3">add to cart</a> -->
                            <asp:Button ID="Button_AddToCart" CssClass="btn_3" Text="Add to Cart" OnClick="Button_AddToCart_Click" runat="server" />
                        </div>
                    </div>
                </div>

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

                <div style="background-color: lightgray">
                    <ul class="nav nav-tabs" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab" aria-selected="true">Overview</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab" aria-selected="false">Customer Reviews (<asp:Label runat="server" ID="Label_ReviewCount"></asp:Label>)</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab" aria-selected="false">Additional information</a>
                        </li>
                    </ul>
                </div>


                <div class="tab-content">
                    <div class="tab-pane active" id="tabs-1" role="tabpanel">
                        <br />
                        <asp:Label ID="Label_Clothes_overview" runat="server"></asp:Label>
                        <br />
                        <br />
                        <br />
                    </div>
                    <div class="tab-pane" id="tabs-2" role="tabpanel">
                        <br />
                        <h5>Products Infomation</h5>
                        <p>
                            this is a product review, ------------------------------------------------------------------|
                                        <br />
                            At least one review needs to be length 92 or above to avoid breaking this tab-panel, it is usually the very first review, fill it with non-breaking space
                        </p>

                        <%-- Repeater Here to go through all reviews --%>
                        <asp:Repeater ID="RepeaterReview" runat="server">
                            <ItemTemplate>
                                <h5>
                                    <asp:Label runat="server" Text='<%# Eval("name")%>'></asp:Label></h5>
                                <p>
                                    <asp:Label runat="server" Text='<%# Eval("review")%>'></asp:Label></p>
                            </ItemTemplate>
                        </asp:Repeater>

                    </div>
                    <br />
                    <br />
                    <br />

                    <div class="tab-pane" id="tabs-3" role="tabpanel">

                        <div class="product__details__tab__content">
                            <p class="note">
                                Nam tempus turpis at metus scelerisque placerat nulla deumantos solicitud felis. Pellentesque diam dolor, elementum etos lobortis des mollis ut risus. Sedcus faucibus an sullamcorper mattis drostique des commodo pharetras loremos.
                            </p>
                            <div class="product__details__tab__content__item">
                                <h5>Products Infomation</h5>
                                <p>
                                    A Pocket PC is a handheld computer, which features many of the same capabilities as a modern PC. These handy little devices allow individuals to retrieve and store e-mail messages, create a contact file, coordinate appointments, surf the internet, exchange text messages and more. Every product that is labeled as a Pocket PC must be accompanied with specific software to operate the unit and must feature a touchscreen and touchpad.
                                </p>
                                <p>
                                    As is the case with any new technology product, the cost of a Pocket PC was substantial during it’s early release. For approximately $700.00, consumers could purchase one of top-of-the-line Pocket PCs in 2003. These days, customers are finding that prices have become much more reasonable now that the newness is wearing off. For approximately $350.00, a new Pocket PC can now be purchased.
                                </p>
                            </div>
                            <div class="product__details__tab__content__item">
                                <h5>Material used</h5>
                                <p>
                                    Polyester is deemed lower quality due to its none natural quality’s. Made from synthetic materials, not natural like wool. Polyester suits become creased easily and are known for not being breathable. Polyester suits tend to have a shine to them compared to wool and cotton suits, this can make the suit look cheap. The texture of velvet is luxurious and breathable. Velvet is a great choice for dinner party jacket and can be worn all year round.
                                </p>
                            </div>
                        </div>

                    </div>
                </div>

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
