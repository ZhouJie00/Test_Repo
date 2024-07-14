<%@ Page Title="" Language="C#" MasterPageFile="~/AfterLoginAdmin.Master" AutoEventWireup="true" CodeBehind="admin_charts.aspx.cs" Inherits="AWAD_Assignment.routes.admin_charts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">Admin Charts</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.0/dist/chart.min.js"></script>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Preloader" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="sliderAreaContent" runat="server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="body" runat="server">
    <br />
    <br />
    <br />
    <div class="container-fluid flex-center-start align-content-center justify-content-center flex-wrap">
        <div class="col-lg-5">
            <asp:Literal ID="Chart1" runat="server"></asp:Literal>
        </div>

        <div class="col-lg-5">
            <asp:Literal ID="Chart2" runat="server"></asp:Literal>
        </div>
        
        <div class="col-lg-5">
            <asp:Literal ID="Chart3" runat="server"></asp:Literal>
        </div>
    </div>
</asp:Content>
