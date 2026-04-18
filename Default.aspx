<%@ Page Title="Office Asset Tracker" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent" >
     <div>
        <asp:GridView ID="gvAssets" runat="server" AutoGenerateColumns="false" CssClass="table">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="ID" />
                <asp:BoundField DataField="Name" HeaderText="Asset Name" />
                <asp:BoundField DataField="CategoryName" HeaderText="Category" />
                <asp:BoundField DataField="AssignedToStaffName" HeaderText="Assigned To" />
                <asp:BoundField DataField="Status" HeaderText="Status" />
            </Columns>
        </asp:GridView>
        <asp:Button ID="AddNewAssetBtn" runat="server" Text="Add new asset" CssClass="btn btn-contained" OnClick="BtnAdd_Click"/>    
    </div>
         
</asp:Content>
 