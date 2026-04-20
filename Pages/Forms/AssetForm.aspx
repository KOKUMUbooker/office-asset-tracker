<%@ Page Title="Asset Form" Language="C#" MasterPageFile="~/Site.Master"
AutoEventWireup="true" CodeFile="AssetForm.aspx.cs"
Inherits="Pages_Forms_AssetForm" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
  <h1 id="formTitle" runat="server">Add new asset</h1>
  <asp:Label ID="AssetNameLabel" runat="server" Text="Enter Asset Name: " />
  <asp:TextBox ID="AssetName" runat="server" />
  <br /><br />

  <asp:Label
    ID="AssetCategoryLabel"
    runat="server"
    Text="Specify Category : "
  ></asp:Label>
   <asp:DropDownList ID="AssetCategory" runat="server" CssClass="select">
   </asp:DropDownList>
    <br /><br />

   <asp:Label
    ID="AssetStatusLabel"
    runat="server"
    Text="Specify Status : "
  ></asp:Label>
   <asp:DropDownList ID="AssetStatus" runat="server" CssClass="select">
   </asp:DropDownList>
    <br /><br />

    <asp:Label
    ID="AssignedToStaffLabel"
    runat="server"
    Text="Assigned To : "
  ></asp:Label>
   <asp:DropDownList ID="AssignedToStaff" runat="server" CssClass="select">
   </asp:DropDownList>
    <br /><br />

   <asp:Button ID="backBtn" runat="server" Text="Back" OnClick="BackBtn_Click" CssClass="btn btn-outlined"/>
   <asp:Button ID="btnSubmit" runat="server" Text="Create asset" OnClick="BtnSubmit_Click" CssClass="btn btn-contained"/>
   <br /><br />
</asp:Content>
