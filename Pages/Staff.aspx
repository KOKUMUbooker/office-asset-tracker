<%@ Page Title="Staff" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Staff.aspx.cs" Inherits="Staff" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
   <asp:GridView ID="gvStaff" runat="server" AutoGenerateColumns="false" OnRowCommand="gvStaff_RowCommand">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="ID" />
            <asp:BoundField DataField="Name" HeaderText="Staff" />

            <asp:TemplateField HeaderText="Actions">
                <ItemTemplate>
                        <asp:Button ID="EditBtn" 
                        runat="server" 
                        Text="Edit"
                        CommandName="EditStaff"
                        CommandArgument='<%# Eval("Id") %>'
                        CssClass="btn btn-outlined" />

                        <asp:Button ID="DeleteBtn" 
                        runat="server" 
                        Text="Delete"
                        CommandName="DeleteStaff"
                        CommandArgument='<%# Eval("Id") %>'
                        CssClass="btn btn-destructive"
                        OnClientClick="return confirm('Are you sure you want to delete this staff?');" />
                </ItemTemplate>
             </asp:TemplateField>
        </Columns>
    </asp:GridView>
     <asp:Button ID="AddNewStaffBtn" runat="server" Text="Add new staff" CssClass="btn btn-contained" OnClick="BtnAdd_Click"/>    
</asp:Content>