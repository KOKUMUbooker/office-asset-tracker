<%@ Page Title="Asset Form" Language="C#" MasterPageFile="~/Site.Master"
AutoEventWireup="true" CodeFile="AssetForm.aspx.cs"
Inherits="Pages_Forms_AssetForm" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
  <h1 id="formTitle" runat="server">Add new asset</h1>
  <asp:Label ID="AssetNameLabel" runat="server" Text="Enter Asset Name: " />
  <asp:TextBox ID="AssetName" runat="server" />
  <asp:RequiredFieldValidator
    ForeColor="Red"
    ErrorMessage="Asset name is required"
    ControlToValidate="AssetName"
    ID="AssetNameVld"
    runat="server"
  />
  <br /><br />

  <asp:Label
    ID="AssetCategoryLabel"
    runat="server"
    Text="Specify Category : "
  ></asp:Label>
  <asp:DropDownList ID="AssetCategory" runat="server" CssClass="select">
  </asp:DropDownList>
  <asp:RequiredFieldValidator
    ID="AssetCategoryVld"
    runat="server"
    ControlToValidate="AssetCategory"
    InitialValue=""
    ErrorMessage="Category is required"
    ForeColor="Red"
  />
  <br /><br />

  <asp:Label
    ID="AssetStatusLabel"
    runat="server"
    Text="Specify Status : "
  ></asp:Label>
  <asp:DropDownList
    ID="AssetStatus"
    AutoPostBack="false"
    runat="server"
    CssClass="select"
  >
  </asp:DropDownList>
  <asp:RequiredFieldValidator
    ID="AssetStatusVld"
    runat="server"
    ControlToValidate="AssetStatus"
    InitialValue=""
    ErrorMessage="Status is required"
    ForeColor="Red"
  />
  <br /><br />

  <asp:Label
    ID="AssignedToStaffLabel"
    runat="server"
    Text="Assigned To : "
  ></asp:Label>
  <asp:DropDownList ID="AssignedToStaff" runat="server" CssClass="select">
  </asp:DropDownList>
  <asp:CustomValidator
    ID="AssignedToStaffValidator"
    runat="server"
    ControlToValidate="AssignedToStaff"
    ErrorMessage="Staff is required when status is Assigned"
    ValidateEmptyText="true"
    ForeColor="Red"
    ClientValidationFunction="validateAssignedToStaff"
    OnServerValidate="AssignedToStaffValidator_ServerValidate"
  />
  <br /><br />

  <asp:Button
    ID="backBtn"
    runat="server"
    Text="Back"
    OnClick="BackBtn_Click"
    CssClass="btn btn-outlined"
  />
  <asp:Button
    ID="btnSubmit"
    runat="server"
    Text="Create asset"
    OnClick="BtnSubmit_Click"
    CssClass="btn btn-contained"
  />
  <br /><br />

  <script type="text/javascript">
    function validateAssignedToStaff(sender, args) {
      var status = document.getElementById('<%= AssetStatus.ClientID %>').value;
      var staff = document.getElementById(
        '<%= AssignedToStaff.ClientID %>',
      ).value;

      if (status === 'Assigned' && staff === '') {
        args.IsValid = false;
      } else {
        args.IsValid = true;
      }
    }
  </script>
</asp:Content>
