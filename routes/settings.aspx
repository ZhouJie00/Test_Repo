<%@ Page Title="" Language="C#" MasterPageFile="~/AfterLogin.Master" AutoEventWireup="true" CodeBehind="settings.aspx.cs" Inherits="AWAD_Assignment.routes.settings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">Settings</asp:Content>

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
                            <h2>My Account</h2>
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
                            <h3>My Account Details</h3>
                            <div class="row contact_form">

                                <div class="col-md-12 form-group p_star">
                                    <asp:TextBox ID="TextBox_Firstname" TabIndex="1" TextMode="SingleLine" CssClass="form-control" Placeholder="First Name" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red" ControlToValidate="TextBox_Firstname" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                                </div>

                                <div class="col-md-12 form-group p_star">
                                    <asp:TextBox ID="TextBox_Lastname" TabIndex="1" TextMode="SingleLine" CssClass="form-control" Placeholder="Last Name" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red" ControlToValidate="TextBox_Lastname" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                                </div>

                                <div class="col-md-12 form-group p_star">
                                    <asp:TextBox ID="TextBox_MobileNumber" TabIndex="1" TextMode="Phone" CssClass="form-control" Placeholder="Mobile Number" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="Red" ControlToValidate="TextBox_MobileNumber" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator_MobileNumber" ForeColor="Red" ControlToValidate="TextBox_MobileNumber" ValidationExpression="^\d{8}$" ErrorMessage="Invalid mobile number"></asp:RegularExpressionValidator>

                                </div>

                                <div class="col-md-12 form-group p_star">
                                    <asp:TextBox ID="TextBox_CurrentPassword" TextMode="Password" CssClass="form-control" Placeholder="Current Password" runat="server"></asp:TextBox>
                                </div>

                                <div class="col-md-12 form-group p_star">
                                    <asp:TextBox ID="TextBox_NewPassword" TextMode="Password" CssClass="form-control" Placeholder="New Password" runat="server"></asp:TextBox>
                                    <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator_NewPassword" ForeColor="Red" ErrorMessage="It is not a strong password, try another one" ControlToValidate="TextBox_NewPassword" ValidationExpression="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="login_part_form">
                        <div class="login_part_form_iner">
                            <h3>Shipping Details</h3>
                            <div class="row contact_form">

                                <div class="col-md-12 form-group p_star">
                                    <asp:TextBox ID="TextBox_Address1" TextMode="MultiLine" TabIndex="5" CssClass="form-control" Placeholder="Address line 01" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ForeColor="Red" runat="server" ErrorMessage="Required Field" Text="Required Field" ControlToValidate="TextBox_Address1"></asp:RequiredFieldValidator>
                                </div>

                                <div class="col-md-12 form-group p_star">
                                    <asp:TextBox ID="TextBox_Address2" TextMode="MultiLine" TabIndex="6" CssClass="form-control" Placeholder="Address line 02" runat="server"></asp:TextBox>
                                </div>

                                <div class="col-md-12 form-group">
                                    <asp:TextBox ID="TextBox_Zipcode" TextMode="Phone" TabIndex="7" CssClass="form-control" Placeholder="Postcode/ZIP" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ForeColor="Red" runat="server" ErrorMessage="Required Field" Text="Required Field" ControlToValidate="TextBox_Zipcode"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator5" ForeColor="Red" ControlToValidate="TextBox_Zipcode" ValidationExpression="^\d{6}$" ErrorMessage="Invalid Zipcode/Postal Code"></asp:RegularExpressionValidator>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="login_part_form">
                        <div class="login_part_form_iner">
                            <h3>Security Settings</h3>
                            <div class="row contact_form">
                                <div class="col-md-12 form-group p_star">
                                    <asp:Label runat="server" ID="Label_mfa" Text="Current 2FA status: Disabled"></asp:Label>
                                    <asp:LinkButton runat="server" ID="LinkButton_mfa" OnClick="LinkButton_mfa_Click" Text="Disable / Enable" CssClass="btn_1 btn-danger"></asp:LinkButton>
                                    <asp:PlaceHolder ID="PlaceHolder_QRCode" runat="server"></asp:PlaceHolder>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-12 form-group">
                    <asp:Button CssClass="btn_3" ID="Button_UpdateAccount" Text="Update account details" OnClick="Button_UpdateAccount_Click" runat="server" />
                </div>
            </div>
        </div>
    </section>
    <!--================login_part end =================-->
</asp:Content>
