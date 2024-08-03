<%@ Page Title="" Language="C#" MasterPageFile="~/BeforeLogin.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="AWAD_Assignment.routes.register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">Register</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <!-- <link rel="stylesheet" href="../assets/fonts/material-design-iconic-font/css/material-design-iconic-font.min.css"> -->
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
                            <h2>Register</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- slider Area End-->
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="body" runat="server">
    <!--================ register_part Area =================-->
    <section class="login_part section_padding ">
        <div class="container">
            <div class="row align-items-center">

                <div class="col-lg-6 col-md-6">
                    <div class="login_part_text text-center">
                        <div class="login_part_text_iner">
                            <h2>Already have an account?</h2>
                            <p>
                                There are advances being made in science and technology
                                everyday, and a good example of this, is this website
                            </p>
                            <a href="/login" class="btn_3">Login</a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6 col-md-6">
                    <div class="login_part_form">
                        <div class="login_part_form_iner">
                            <h3>Registration</h3>
                            <div class="row contact_form">
                                <!-- <form class="row contact_form" action="#" method="post" novalidate="novalidate"> -->

                                <div class="col-md-12 form-group p_star">
                                    <!-- <input type="text" class="form-control" id="firstname" name="firstname" value="" placeholder="First Name"> -->
                                    <asp:TextBox ID="TextBox_FirstName" CssClass="form-control" Placeholder="First Name" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_FirstName" runat="server" ErrorMessage="Required Field" ForeColor="Red" Text="Required Field" ControlToValidate="TextBox_FirstName"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator_FirstName" ForeColor="Red" ControlToValidate="TextBox_FirstName" ValidationExpression="^([a-zA-Z' ]+)$" ErrorMessage="Real names only have letters"></asp:RegularExpressionValidator>
                                </div>

                                <div class="col-md-12 form-group p_star">
                                    <!-- <input type="text" class="form-control" id="lastname" name="lastname" value="" placeholder="Last Name"> -->
                                    <asp:TextBox ID="TextBox_LastName" CssClass="form-control" Placeholder="Last Name" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_LastName" runat="server" ErrorMessage="Required Field" ForeColor="Red" Text="Required Field" ControlToValidate="TextBox_LastName"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator_LastName" ForeColor="Red" ControlToValidate="TextBox_LastName" ValidationExpression="^([a-zA-Z' ]+)$" ErrorMessage="Real names only have letters"></asp:RegularExpressionValidator>
                                </div>

                                <div class="col-md-12 form-group p_star">
                                    <!-- <input type="email" class="form-control" id="email" name="email" value="" placeholder="Email Address"> -->
                                    <asp:TextBox ID="TextBox_Email" TextMode="Email" CssClass="form-control" Placeholder="Email Address" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_Email" runat="server" ForeColor="Red" ErrorMessage="Required Field" Text="Required Field" ControlToValidate="TextBox_Email"></asp:RequiredFieldValidator>
                                </div>

                                <div class="col-md-12 form-group p_star">
                                    <!-- <input type="number" class="form-control" id="mobile_number" name="mobile_number" value="" placeholder="Mobile Number"> -->
                                    <asp:TextBox ID="TextBox_MobileNumber" TextMode="Phone" CssClass="form-control" Placeholder="Mobile Number" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_MobileNumber" ForeColor="Red" runat="server" ErrorMessage="Required Field" Text="Required Field" ControlToValidate="TextBox_MobileNumber"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator_MobileNumber" ForeColor="Red" ControlToValidate="TextBox_MobileNumber" ValidationExpression="^\d{8}$" ErrorMessage="Invalid mobile number"></asp:RegularExpressionValidator>
                                </div>

                                <div class="col-md-12 form-group p_star">
                                    <!-- <input type="password" class="form-control" id="password" name="password" value="" placeholder="Password"> -->
                                    <asp:TextBox ID="TextBox_Password" TextMode="Password" CssClass="form-control" Placeholder="Password" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_Password" runat="server" ForeColor="Red" ErrorMessage="Required Field" Text="Required Field" ControlToValidate="TextBox_Password"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator_Password" ForeColor="Red" ErrorMessage="It must be at least 8 characters long and include at least one uppercase letter, one lowercase letter, and one digit." ControlToValidate="TextBox_Password" ValidationExpression="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$"></asp:RegularExpressionValidator>
                                </div>

                                <div class="col-md-12 form-group p_star">
                                    <!-- <input type="password" class="form-control" id="password2" name="password2" value="" placeholder="Confirm Password"> -->
                                    <asp:TextBox ID="TextBox_ConfirmPassword" TextMode="Password" CssClass="form-control" Placeholder="Confirm Password" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_ConfirmPassword" runat="server" ForeColor="Red" ErrorMessage="Required Field" Text="Required Field" ControlToValidate="TextBox_ConfirmPassword"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator_ConfirmPassword" ForeColor="Red" ErrorMessage="It must be at least 8 characters long and include at least one uppercase letter, one lowercase letter, and one digit." ControlToValidate="TextBox_ConfirmPassword" ValidationExpression="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$"></asp:RegularExpressionValidator>
                                </div>
                                <asp:CompareValidator ID="CompareValidator_Password" runat="server"
                                    ControlToCompare="TextBox_Password"
                                    ControlToValidate="TextBox_ConfirmPassword"
                                    Operator="Equal" Type="String"
                                    ForeColor="Red"
                                    ErrorMessage="Passwords must match!"></asp:CompareValidator>
                                <br />

                                <asp:Label ID="Label_EmailExists" ForeColor="Red" Text="" runat="server"></asp:Label>

                                <div class="col-md-12 form-group">
                                    <!-- <button type="submit" value="submit" class="btn_3">Register</button> -->
                                    <asp:Button ID="Button_Register" OnClick="btnRegister_Click" CssClass="btn_3" runat="server" Text="Register" />
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--================ register_part end =================-->
</asp:Content>
