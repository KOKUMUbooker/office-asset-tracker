<%@ Page Title="Categories Form" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="CategoriesForm.aspx.cs" Inherits="Pages_Forms_CategoriesForm" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
  <h1 runat="server" id="formTitle">Add new category</h1>
  <asp:Label ID="CategoryNameLabel" runat="server" Text="Enter Category Name: " />
  <asp:TextBox ID="CategoryName" runat="server" />
  <asp:RequiredFieldValidator
    ForeColor="Red"
    ErrorMessage="Staff name is required"
    ControlToValidate="CategoryName"
    ID="CategoryNameVld"
    runat="server"
  />
  <br /><br />

  <asp:Button ID="backBtn" runat="server" Text="Back" OnClick="BackBtn_Click" CssClass="btn btn-outlined"/>
  <asp:Button ID="btnSubmit" runat="server" Text="Create category" OnClick="BtnSubmit_Click" CssClass="btn btn-contained"/>
  <br /><br />
</asp:Content>