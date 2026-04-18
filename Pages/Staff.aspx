<%@ Page Title="Staff" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Staff.aspx.cs" Inherits="Staff" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
   <asp:GridView ID="gvStaff" runat="server" AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="ID" />
            <asp:BoundField DataField="Name" HeaderText="Category Name" />
        </Columns>
    </asp:GridView>
     <asp:Button ID="AddNewStaffBtn" runat="server" Text="Add new staff" CssClass="btn btn-contained" OnClick="BtnAdd_Click"/>    
</asp:Content>