<%@ Page Title="" Language="C#" MasterPageFile="~/BeforeLogin.Master" AutoEventWireup="true" CodeBehind="change_password.aspx.cs" Inherits="AWAD_Assignment.routes.recover_password" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">Change Password</asp:Content>

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
                            <h2>Change Password</h2>
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
                                    <!-- <input type="password" class="form-control" id="password" name="password" value="" placeholder="Password"> -->
                                    <asp:TextBox ID="TextBox_Password" TextMode="Password" CssClass="form-control" Placeholder="Password" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_Password" runat="server" ForeColor="Red" ErrorMessage="Required Field" Text="Required Field" ControlToValidate="TextBox_Password"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator_Password" ForeColor="Red" ErrorMessage="It is not a strong password, try another one" ControlToValidate="TextBox_Password" ValidationExpression="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$"></asp:RegularExpressionValidator>
                                </div>

                                <div class="col-md-12 form-group p_star">
                                    <!-- <input type="password" class="form-control" id="password2" name="password2" value="" placeholder="Confirm Password"> -->
                                    <asp:TextBox ID="TextBox_ConfirmPassword" TextMode="Password" CssClass="form-control" Placeholder="Confirm Password" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_ConfirmPassword" runat="server" ForeColor="Red" ErrorMessage="Required Field" Text="Required Field" ControlToValidate="TextBox_ConfirmPassword"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator_ConfirmPassword" ForeColor="Red" ErrorMessage="It is not a strong password, try another one" ControlToValidate="TextBox_ConfirmPassword" ValidationExpression="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$"></asp:RegularExpressionValidator>
                                </div>
                                <asp:CompareValidator ID="CompareValidator_Password" runat="server"
                                    ControlToCompare="TextBox_Password"
                                    ControlToValidate="TextBox_ConfirmPassword"
                                    Operator="Equal" Type="String"
                                    ForeColor="Red"
                                    ErrorMessage="Passwords must match!"></asp:CompareValidator>


                                <div class="col-md-12 form-group">
                                    <!-- <button type="submit" value="submit" class="btn_3" style="cursor:pointer;">log in</button> -->
                                    <asp:Button CssClass="btn_3" ID="Button_ChangePassword" Text="Forget Password" OnClick="Button_ChangePassword_Click" runat="server" />
                                </div>

                                <asp:Label runat="server" ID="Label_ChangePassword"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--================login_part end =================-->
</asp:Content>
