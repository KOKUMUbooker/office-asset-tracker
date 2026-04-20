<%@ Page Title="Staff Form" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="StaffForm.aspx.cs" Inherits="Pages_Forms_StaffForm" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
  <h1>Add new staff</h1>
  <asp:Label ID="StaffNameLabel" runat="server" Text="Enter Staff Name: " />
  <asp:TextBox ID="StaffName" runat="server" />
  <br /><br />

  <asp:Button ID="backBtn" runat="server" Text="Back" OnClick="BackBtn_Click" CssClass="btn btn-outlined"/>
  <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="BtnSubmit_Click" CssClass="btn btn-contained"/>
  <br /><br />
</asp:Content>