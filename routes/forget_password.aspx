<%@ Page Title="" Language="C#" MasterPageFile="~/BeforeLogin.Master" AutoEventWireup="true" CodeBehind="forget_password.aspx.cs" Inherits="AWAD_Assignment.routes.forget_password" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">Forget Password</asp:Content>
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
                            <h2>Forget Password</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- slider Area End-->
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="body" runat="server">
    <!--================login_part Area =================-->
    <section class="login_part section_padding ">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6">
                    <div class="login_part_form">
                        <div class="login_part_form_iner">
                            <h3>Enter email address to reset password</h3>
                            <div class="row contact_form">
                                <div class="col-md-12 form-group p_star">
                                    <!-- <input type="text" class="form-control" id="name" name="name" value="" placeholder="Username"> -->
                                    <asp:TextBox ID="TextBox_Email" TabIndex="1" TextMode="Email" CssClass="form-control" Placeholder="Email Address" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_Email" runat="server" ForeColor="Red" ControlToValidate="TextBox_Email" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                                </div>

                                <div class="col-md-12 form-group p_star" style="text-align: center;">
                                    <asp:Label runat="server" ID="Label_Status" Text="" ForeColor="YellowGreen"></asp:Label>
                                </div>

                                <div class="col-md-12 form-group">
                                    <!-- <button type="submit" value="submit" class="btn_3" style="cursor:pointer;">log in</button> -->
                                    <asp:Button CssClass="btn_3" ID="Button_Login" Text="Forget Password" OnClick="btnForgetPassword_Click" runat="server" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--================login_part end =================-->
</asp:Content>
