<%@ Page Language="C#" MasterPageFile="~/AfterLoginAdmin.Master" AutoEventWireup="true" CodeBehind="admin_users.aspx.cs" Inherits="AWAD_Assignment.routes.admin_users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">View users</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style>
    </style>
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
                            <h2>View users</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- slider Area End-->
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="body" runat="server">
    <asp:GridView runat="server" ID="GridView_UserTable" CssClass="table table-bordered" AutoGenerateColumns="false" DataKeyNames="Id"
        ShowHeader="true" ShowHeaderWhenEmpty="true" OnRowDeleting="GridView_UserTable_RowDeleting" ClientIDMode="Static">

        <Columns>
            <asp:TemplateField HeaderText="Name">
                <HeaderTemplate>
                    <asp:Label runat="server" Text="Name"></asp:Label>
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# $"{Eval("first_name")} {Eval("last_name")}"  %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Email">
                <HeaderTemplate>
                    <asp:Label runat="server" Text="Email"></asp:Label>
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("email") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Admin?">
                <HeaderTemplate>
                    <asp:Label runat="server" Text="isAdmin"></asp:Label>
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("isAdmin") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Mobile">
                <HeaderTemplate>
                    <asp:Label runat="server" Text="Mobile"></asp:Label>
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("mobile_number") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton runat="server" CssClass="fa fa-trash" ForeColor="Purple" CommandName="Delete" ToolTip="Delete"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>