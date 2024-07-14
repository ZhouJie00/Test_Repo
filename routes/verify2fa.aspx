<%@ Page Title="" Language="C#" MasterPageFile="~/BeforeLogin.Master" AutoEventWireup="true" CodeBehind="verify2fa.aspx.cs" Inherits="AWAD_Assignment.routes.verify2fa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">2FA Verification</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Preloader" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="sliderAreaContent" runat="server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="body" runat="server">
    <div style="display:grid;place-items:center;margin-top:50px;">
        <div>
            <span>OTP PIN: </span>
            <asp:TextBox runat="server" ID="TextBox_2fa" MaxLength="6" CssClass="form-control"></asp:TextBox>
        </div>
        <br />
        <asp:LinkButton runat="server" ID="LinkButton_2fa" CssClass="btn boxed-btn3" Text="Login" OnClick="LinkButton_2fa_Click"></asp:LinkButton>
        <br />
        <asp:Label runat="server" ID="Label_error" ForeColor="Red"></asp:Label>
    </div>
</asp:Content>
