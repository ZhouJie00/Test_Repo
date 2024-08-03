<%@ Page Title="" Language="C#" MasterPageFile="~/BeforeLogin.Master" AutoEventWireup="true" CodeBehind="checkout.aspx.cs" Inherits="AWAD_Assignment.routes.checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">Checkout</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <script src="https://polyfill.io/v3/polyfill.min.js?version=3.52.1&features=fetch"></script>
    <script src="https://js.stripe.com/v3/"></script>
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
                            <h2>Checkout</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- slider Area End-->
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="body" runat="server">
    <!--================Checkout Area =================-->
    <section class="checkout_area section_padding">
        <div class="container">
            <div runat="server" id="theReturningCustomerDiv">
                <div class="returning_customer">
                    <div class="check_title">
                        <h2>Returning Customer?
            <a href="/login">Click here to login</a>
                        </h2>
                    </div>
                </div>
            </div>
            <br />
            <div class="billing_details">
                <div class="row">
                    <div class="col-lg-8">
                        <h3>Shipping Details</h3>
                        <div class="row contact_form" <%--action="#" method="post" novalidate="novalidate"--%>>

                            <div class="col-md-6 form-group p_star">
                                <asp:TextBox ID="TextBox_FirstName" CssClass="form-control" TabIndex="1" Placeholder="First Name" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator_FirstName" runat="server" ErrorMessage="Required Field" ForeColor="Red" Text="Required Field" ControlToValidate="TextBox_FirstName"></asp:RequiredFieldValidator>
                                <br />
                                <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator_FirstName" ForeColor="Red" ControlToValidate="TextBox_FirstName" ValidationExpression="^([a-zA-Z' ]+)$" ErrorMessage="Real names only have letters"></asp:RegularExpressionValidator>

                                <div class="">
                                    <!-- <input type="text" class="form-control" id="last" name="name" /> -->
                                    <!-- <span class="placeholder" data-placeholder="Last name"></span> -->
                                    <asp:TextBox ID="TextBox_MobileNumber" TabIndex="3" TextMode="Phone" CssClass="form-control" Placeholder="Mobile Number" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_MobileNumber" ForeColor="Red" runat="server" ErrorMessage="Required Field" Text="Required Field" ControlToValidate="TextBox_MobileNumber"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator_MobileNumber" ForeColor="Red" ControlToValidate="TextBox_MobileNumber" ValidationExpression="^\d{8}$" ErrorMessage="Invalid mobile number"></asp:RegularExpressionValidator>
                                </div>
                            </div>

                            <div class="col-md-6 form-group p_star">
                                <asp:TextBox ID="TextBox_LastName" CssClass="form-control" TabIndex="2" Placeholder="Last Name" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator_LastName" runat="server" ErrorMessage="Required Field" ForeColor="Red" Text="Required Field" ControlToValidate="TextBox_LastName"></asp:RequiredFieldValidator>
                                <br />
                                <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator_LastName" ForeColor="Red" ControlToValidate="TextBox_LastName" ValidationExpression="^([a-zA-Z' ]+)$" ErrorMessage="Real names only have letters"></asp:RegularExpressionValidator>
                            </div>

                            <div class="col-md-6 form-group p_star">
                                <asp:TextBox ID="TextBox_Email" TextMode="Email" TabIndex="4" CssClass="form-control" Placeholder="Email Address" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator_Email" runat="server" ForeColor="Red" ErrorMessage="Required Field" Text="Required Field" ControlToValidate="TextBox_Email"></asp:RequiredFieldValidator>
                            </div>

                            <div class="col-md-12 form-group p_star">
                                <select class="country_select">
                                    <option value="1">Singapore</option>
                                </select>
                            </div>

                            <div class="col-md-12 form-group p_star">
                                <!-- <input type="text" class="form-control" id="add1" name="add1" /> -->
                                <!-- <span class="placeholder" data-placeholder="Address line 01"></span> -->
                                <asp:TextBox ID="TextBox_Address1" TextMode="MultiLine" TabIndex="5" CssClass="form-control" Placeholder="Address line 01" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" runat="server" ErrorMessage="Required Field" Text="Required Field" ControlToValidate="TextBox_MobileNumber"></asp:RequiredFieldValidator>
                            </div>

                            <div class="col-md-12 form-group p_star">
                                <asp:TextBox ID="TextBox_Address2" TextMode="MultiLine" TabIndex="6" CssClass="form-control" Placeholder="Address line 02" runat="server"></asp:TextBox>
                            </div>

                            <div class="col-md-12 form-group">
                                <asp:TextBox ID="TextBox_Zipcode" TextMode="Phone" TabIndex="7" CssClass="form-control" Placeholder="Postcode/ZIP" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ForeColor="Red" runat="server" ErrorMessage="Required Field" Text="Required Field" ControlToValidate="TextBox_Zipcode"></asp:RequiredFieldValidator>
                                <br />
                                <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator5" ForeColor="Red" ControlToValidate="TextBox_Zipcode" ValidationExpression="^\d{6}$" ErrorMessage="Invalid Zipcode/Postal Code"></asp:RegularExpressionValidator>
                            </div>

                            <div runat="server" id="createAccountDiv">
                                <div class="col-md-12 form-group">
                                    <div class="creat_account">
                                        <asp:CheckBox runat="server" ID="Checkbox_AccountCreate" Checked="false" Text="Create an account?" ClientIDMode="Static" />
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-12 form-group p_star" id="passwordbox" style="display:none">
                                <input type="password" class="form-control" id="passwordCreate" name="passwordCreate" value="" placeholder="Enter Password" runat="server">
                                <span id="validpassword" style="color:red;"></span>
                            </div>

                        <div class="col-md-12 form-group">
                                <!--
                                <div class="creat_account">
                                    <h3>Shipping Details</h3>
                                    <input type="checkbox" id="f-option3" name="selector" />
                                    <label for="f-option3">Ship to a different address?</label>
                                </div>
                                -->
                                <textarea class="form-control" name="message" tabindex="8" id="message" rows="1"
                                    placeholder="Order Notes"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="order_box">
                            <h2>Your Order</h2>
                            <ul class="list">
                                <li><a href="#">Product<span>Total</span></a></li>

                                <asp:Repeater ID="Repeater1" runat="server">
                                    <ItemTemplate>
                                        <%--<li><a href="#">Fresh Blackberry<span class="middle">x 02</span><span class="last">$720.00</span></a></li>--%>
                                        <li>
                                            <asp:LinkButton runat="server">
                                                <asp:Label runat="server" ID="Label_name" Text='<%#Eval("name") %>'></asp:Label>
                                                <asp:Label runat="server" ID="Label_quantity" Text='<%# "x " + string.Format("{0:D2}", Eval("quantity").ToString()) %>' CssClass="middle"></asp:Label>
                                                <asp:Label runat="server" ID="Label_price" Text='<%# string.Format("${0:00.00}", double.Parse(Eval("price").ToString())) %>' CssClass="last"></asp:Label>
                                            </asp:LinkButton></li>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </ul>
                            <ul class="list list_2">
                                <li><a href="#">Subtotal<span><asp:Label runat="server" ID="Label_subtotal"></asp:Label></span></a></li>
                                <li><a href="#">Shipping<span><asp:Label runat="server" ID="Label_shipping"></asp:Label></span></a></li>
                                <li><a href="#">Total<span><asp:Label runat="server" ID="Label_total"></asp:Label></span></a></li>
                            </ul>
                            <div class="payment_item active">
                                <div class="radion_btn">
                                    <%--<input type="radio" id="f-option5" name="selector" />--%>
                                    <%--<label for="f-option5">Stripe payment</label>--%>
                                    <asp:RadioButton GroupName="selector" Checked="true" runat="server" Text="Stripe" />
                                    <div class="check"></div>
                                </div>
                                <p>
                                    Pay with Credit/Debit card
                                </p>
                            </div>
                            <div class="payment_item">
                                <div class="radion_btn">
                                    <asp:RadioButton GroupName="selector" Enabled="false" runat="server" Text="PayPal" />
                                    <img src="../assets/img/product/single-product/card.jpg" alt="" />
                                    <div class="check"></div>
                                </div>
                                <p>
                                    Pay with your PayPal account
                                </p>
                            </div>
                            <div class="creat_account">
                                <asp:CheckBox runat="server" ID="CheckBox_ToS" Checked="false" Text="I’ve read and accept the terms & conditions*" />
                            </div>
                            <asp:LinkButton runat="server" CssClass="btn_3" Text="Proceed to Payment" OnClick="LinkButton_Payment_Click" ID="LinkButton_Payment"></asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <script>
        const createUser = document.getElementById("Checkbox_AccountCreate");
        const password = document.getElementById("body_passwordCreate")
        const validpassword = document.getElementById("validpassword")

        createUser.addEventListener("change", function (e) {
            if (this.checked) {
                // alert("i am checked");
                document.getElementById("passwordbox").style.display = "block";
            } else {
                // alert("i am not checked")
                document.getElementById("passwordbox").style.display = "none";
            }
        });

        password.addEventListener("keydown", (e) => {
            if (/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$/.test(password.value)) validpassword.innerText = ""
            else validpassword.innerText = "Enter a stronger password please"
        })
        password.addEventListener("keyup", (e) => {
            if (/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$/.test(password.value)) validpassword.innerText = ""
            else validpassword.innerText = "Enter a stronger password please"
        })
    </script>
    <!--================End Checkout Area =================-->
</asp:Content>
