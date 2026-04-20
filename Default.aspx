<%@ Page Title="Office Asset Tracker" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent" >
     <div>
        <asp:GridView ID="gvAssets" runat="server" AutoGenerateColumns="false" CssClass="table" OnRowCommand="gvAssets_RowCommand">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="ID" />
                <asp:BoundField DataField="Name" HeaderText="Asset Name" />
                <asp:BoundField DataField="CategoryName" HeaderText="Category" />
                <asp:BoundField DataField="AssignedToStaffName" HeaderText="Assigned To" />
                <asp:BoundField DataField="Status" HeaderText="Status" />

                <asp:TemplateField HeaderText="Actions">
                    <ItemTemplate>
                         <asp:Button ID="EditBtn" 
                            runat="server" 
                            Text="Edit"
                            CommandName="EditAsset"
                            CommandArgument='<%# Eval("Id") %>'
                            CssClass="btn btn-outlined" />

                         <asp:Button ID="DeleteBtn" 
                            runat="server" 
                            Text="Delete"
                            CommandName="DeleteAsset"
                            CommandArgument='<%# Eval("Id") %>'
                            CssClass="btn btn-destructive"
                            OnClientClick="return confirm('Are you sure you want to delete this asset?');" />
                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>
        </asp:GridView>
        <asp:Button ID="AddNewAssetBtn" runat="server" Text="Add new asset" CssClass="btn btn-contained" OnClick="BtnAdd_Click"/>    
    </div>
         
</asp:Content>
 