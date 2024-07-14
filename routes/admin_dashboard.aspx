<%@ Page Title="" Language="C#" MasterPageFile="~/AfterLoginAdmin.Master" AutoEventWireup="true" CodeBehind="admin_dashboard.aspx.cs" Inherits="AWAD_Assignment.routes.admin_dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">Dashboard</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style>
        .categorycontainer{
            display:flex;
            justify-content:space-between;
            /*align-content:flex-end*/
        }
        .categories{
            padding:2rem;
            border:2px dashed red;
        }
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
                            <h2>Clothes</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- slider Area End-->
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="body" runat="server">
    <br />
    <div class="categorycontainer">
        <span class="categories">1	Chino</span>
        <span class="categories">2	Jeans</span>
        <span class="categories">3	Pants</span>
        <span class="categories">4	Shorts</span>
        <span class="categories">5	Casual Shirts</span>
        <span class="categories">6	Polo Shirts</span>
        <span class="categories">7	T-Shirts</span>
        <span class="categories">8	UT(Graphic T-Shirts)</span>
        <span class="categories">9	Legging Pants</span>
        <span class="categories">10	Skirts</span>
        <span class="categories">11	Shirts & Blouses</span>
        <span class="categories">12	Sweaters</span>
        <span class="categories">13	Sweats</span>
    </div>
    <br />
    <br />
    <br />
    <br />


    <asp:GridView runat="server" ID="GridView_ProductTable" CssClass="table table-bordered" AutoGenerateColumns="false" DataKeyNames="Id" ShowHeader="true" ShowHeaderWhenEmpty="true"
        OnRowCommand="GridView_ProductTable_RowCommand" OnRowEditing="GridView_ProductTable_RowEditing" OnRowCancelingEdit="GridView_ProductTable_RowCancelingEdit"
        OnRowUpdating="GridView_ProductTable_RowUpdating" OnRowDeleting="GridView_ProductTable_RowDeleting" ClientIDMode="Static">
        <Columns>
            <asp:TemplateField HeaderText="Name">
                <HeaderTemplate>
                    <asp:Label runat="server" Text="Name"></asp:Label>
                    <asp:TextBox runat="server" ID="Add_Name" CssClass="form-control-lg"></asp:TextBox>
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("name") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox runat="server" ID="TextBox_name" Text='<%# Eval("name") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Quantity">
                <HeaderTemplate>
                    <asp:Label runat="server" Text="Quantity" Width="100px"></asp:Label>
                    <asp:TextBox runat="server" ID="Add_Quantity" Width="100px" CssClass="form-control-sm"></asp:TextBox>
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("quantity") %>' Width="100px"></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox runat="server" ID="TextBox_quantity" Text='<%# Eval("quantity") %>' Width="100px"></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Price">
                <HeaderTemplate>
                    <asp:Label runat="server" Text="Price" Width="100px"></asp:Label>
                    <asp:TextBox runat="server" ID="Add_Price" Width="100px" CssClass="form-control-sm"></asp:TextBox>
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# string.Format("${0:00.00}", double.Parse(Eval("price").ToString()))%>' Width="100px"></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox runat="server" ID="TextBox_price" Text='<%# Eval("price") %>' Width="100px"></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Overview">
                <HeaderTemplate>
                    <asp:Label runat="server" Text="Overview"></asp:Label>
                    <br />
                    <asp:TextBox runat="server" TextMode="MultiLine" Width="" ID="Add_Overview" CssClass="form-control"></asp:TextBox>
                    <%--<textarea runat="server" style="width:100%" id="Add_Overview"></textarea>--%>
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("overview") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox runat="server" TextMode="MultiLine" ID="TextBox_Overview" Text='<%# Eval("overview") %>'></asp:TextBox>
                    <%--<textarea runat="server" style="width:100%" id="TextBox_Overview" Text='<%# Eval("overview") %>'></textarea>--%>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Gender">
                <HeaderTemplate>
                    <asp:Label runat="server" Text="Gender" Width="60px"></asp:Label>
                    <asp:TextBox runat="server" ID="Add_Gender" MaxLength="1" Width="100px" CssClass="form-control-sm"></asp:TextBox>
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("gender") %>' Width="60px"></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox runat="server" ID="TextBox_gender" Text='<%# Eval("gender") %>' Width="60px"></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Category ID">
                <HeaderTemplate>
                    <asp:Label runat="server" Text="Category ID" Width="100px"></asp:Label>
                    <asp:TextBox runat="server" ID="Add_CategoryID" Width="100px" CssClass="form-control-sm"></asp:TextBox>
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("category_id") %>' Width="100px"></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox runat="server" ID="TextBox_categoryID" Text='<%# Eval("category_id") %>' Width="100px"></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Link">
                <HeaderTemplate>
                    <asp:Label runat="server" Text="Link"></asp:Label>
                    <asp:TextBox runat="server" ID="Add_Link" CssClass="form-control-sm"></asp:TextBox>
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("link") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox runat="server" ID="TextBox_link" Text='<%# Eval("link") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>

            <%-- Image --%>
            <asp:TemplateField>
                <HeaderTemplate>
                    <asp:FileUpload runat="server" AllowMultiple="true" accept=".jpg" ID="FileUpload_image" Width="250px" CssClass="form-control-file"/>
                </HeaderTemplate>
                <ItemTemplate>
                    <a style="color:darkcyan;text-decoration:underline;" href='<%# "/product?id=" + Eval("Id") %>'>View Page</a>
                </ItemTemplate>
                <EditItemTemplate>
                    <%-- How should make it so I can add & delete image here... --%>
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton runat="server" CssClass="fa fa-edit" ForeColor="deepskyblue" CommandName="Edit" ToolTip="Edit"></asp:LinkButton>
                    <asp:LinkButton runat="server" CssClass="fa fa-trash" ForeColor="Purple" CommandName="Delete" ToolTip="Delete"></asp:LinkButton>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:LinkButton runat="server" CssClass="fa fa-save" ForeColor="SaddleBrown" CommandName="Update" ToolTip="Update"></asp:LinkButton>
                    <asp:LinkButton runat="server" CssClass="fa fa-window-close" ForeColor="OrangeRed" CommandName="Cancel" ToolTip="Cancel"></asp:LinkButton>
                </EditItemTemplate>
                <HeaderTemplate>
                    <asp:LinkButton runat="server" CssClass="fa fa-plus" ForeColor="GreenYellow" CommandName="Add" ToolTip="Add"></asp:LinkButton>
                </HeaderTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    

     
</asp:Content>
