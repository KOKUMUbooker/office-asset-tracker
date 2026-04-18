<%@ Page Title="Categories" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Categories.aspx.cs" Inherits="Categories" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div>
        <asp:GridView ID="gvCategories" runat="server" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="ID" />
                <asp:BoundField DataField="Name" HeaderText="Category Name" />
            </Columns>
        </asp:GridView>
        <asp:Button ID="AddNewStaffBtn" runat="server" Text="Add new category" CssClass="btn btn-contained" OnClick="BtnAdd_Click"/>    
    </div>
</asp:Content>