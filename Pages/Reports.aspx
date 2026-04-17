<%@ Page Title="Reports" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Reports.aspx.cs" Inherits="Reports" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
   <asp:GridView ID="gvAssetCountByCategory" runat="server" AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField DataField="Category" HeaderText="Category" />
            <asp:BoundField DataField="Count" HeaderText="Count" />
        </Columns>
    </asp:GridView>

     <asp:GridView ID="gvAssetCountByStatus" runat="server" AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField DataField="Status" HeaderText="Status" />
            <asp:BoundField DataField="Count" HeaderText="Count" />
        </Columns>
    </asp:GridView>

     <asp:GridView ID="gvAssetReportOverview" runat="server" AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField DataField="TotalAssets" HeaderText="Total Assets" />
            <asp:BoundField DataField="AssignedCount" HeaderText="Assigned Count" />
            <asp:BoundField DataField="AvailableCount" HeaderText="Available Count" />
            <asp:BoundField DataField="DamagedCount" HeaderText="Damaged Count" />
        </Columns>
    </asp:GridView>
</asp:Content>