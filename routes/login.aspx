<%@ Page Title="" Language="C#" MasterPageFile="~/BeforeLogin.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="AWAD_Assignment.routes.login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">Login</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style>
        #social-container {
        display: flex; 
         flex-direction: row; 
         justify-content: space-evenly;
        }
        .signinFB {
            font-family: 'Poppins', sans-serif;
            font-size: 12px;
            color: black;
            padding:6px;
        }
        .signinFB:hover {
            /*opacity: 0.9;*/
            background-color: #1242c9;
            color: white;
            border-radius:5%;
        }
        .signinGoogle {
            background-color: transparent;
            font-family: 'Poppins', sans-serif;
            font-size: 12px;
            color: black;
            padding:6px;
        }
        .signinGoogle:hover {
            /*border: 1.5px solid;*/
            background-color: #1242c9;
            color: white;
            border-radius:5%;
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
                            <h2>Login</h2>
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
                    <div class="login_part_text text-center">
                        <div class="login_part_text_iner">
                            <h2>New to our Shop?</h2>
                            <p>
                                There are advances being made in science and technology
                                everyday, and a good example of this is the
                            </p>
                            <a href="/register" class="btn_3">Create an Account</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="login_part_form">
                        <div class="login_part_form_iner">
                            <h3>Welcome Back !
                                <br>
                                Please Sign in now</h3>
                            <div class="row contact_form">
                                <!-- <form class="row contact_form" action="#" method="post" novalidate="novalidate"> -->
                                <div class="col-md-12 form-group p_star">
                                    <!-- <input type="text" class="form-control" id="name" name="name" value="" placeholder="Username"> -->
                                    <asp:TextBox ID="TextBox_Email" TabIndex="1" TextMode="Email" CssClass="form-control" Placeholder="Email Address" runat="server"></asp:TextBox>
                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator_Email" runat="server" ForeColor="Red" ControlToValidate="TextBox_Email" ErrorMessage="Required Field"></asp:RequiredFieldValidator>--%>
                                    <asp:Label runat="server" ID="Label_Email_Validator_Message" ForeColor="Red" Text=""></asp:Label>
                                </div>

                                <div class="col-md-12 form-group p_star">
                                    <!-- <input type="password" class="form-control" id="password" name="password" value="" placeholder="Password"> -->
                                    <asp:TextBox ID="TextBox_Password" TabIndex="2" TextMode="Password" Text="" CssClass="form-control" Placeholder="Password" runat="server"></asp:TextBox>
                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator_Password" runat="server" ForeColor="Red" ControlToValidate="TextBox_Password" ErrorMessage="Required Field"></asp:RequiredFieldValidator>--%>
                                    <asp:Label runat="server" ID="Label_Password_Validator_Message" ForeColor="Red" Text=""></asp:Label>
                                </div>

                                <div class="col-md-12 form-group p_star" style="text-align: center;">
                                    <asp:Label runat="server" ID="Label_LoginFailure" Text="" ForeColor="Red"></asp:Label>
                                </div>

                                <div class="col-md-12 form-group">
                                    <div class="creat_account d-flex align-items-center">
                                        <input type="checkbox" id="f-option" name="selector">
                                        <label for="f-option">Remember me</label>
                                    </div>
                                    <!-- <button type="submit" value="submit" class="btn_3" style="cursor:pointer;">log in</button> -->
                                    <asp:Button CssClass="btn_3" ID="Button_Login" Text="log in" OnClick="btnSignIn_Click" runat="server" />
                                     <a class="lost_pass" href="/forgetpassword">forget password?</a> 
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="social-container">
                        <a class="signinFB" href="JavaScript:void(0);">
                            <img src="../assets/img/_social_login/fbbutton.png" height="60px" />
                            Sign in with Facebook
                        </a>
                        <asp:LinkButton runat="server" CssClass="signinGoogle" Text="Sign in with Google" ID="LinkButton_SignInWithGoogle" OnClick="LinkButton_SignInWithGoogle_Click" >
                            <asp:Image runat="server" ImageUrl="../assets/img/_social_login/googlebtn.png" Height="60px"/>
                        </asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--================login_part end =================-->
</asp:Content>
