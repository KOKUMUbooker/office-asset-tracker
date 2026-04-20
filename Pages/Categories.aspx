<%@ Page Title="Categories" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Categories.aspx.cs" Inherits="Categories" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div>
        <asp:GridView ID="gvCategories" runat="server" AutoGenerateColumns="false"  OnRowCommand="gvCategories_RowCommand">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="ID" />
                <asp:BoundField DataField="Name" HeaderText="Category" />

                <asp:TemplateField HeaderText="Actions">
                    <ItemTemplate>
                         <asp:Button ID="EditBtn" 
                            runat="server" 
                            Text="Edit"
                            CommandName="EditCategory"
                            CommandArgument='<%# Eval("Id") %>'
                            CssClass="btn btn-outlined" />

                         <asp:Button ID="DeleteBtn" 
                            runat="server" 
                            Text="Delete"
                            CommandName="DeleteCategory"
                            CommandArgument='<%# Eval("Id") %>'
                            CssClass="btn btn-destructive"
                            OnClientClick="return confirm('Are you sure you want to delete this category?');" />
                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>
        </asp:GridView>
        <asp:Button ID="AddNewStaffBtn" runat="server" Text="Add new category" CssClass="btn btn-contained" OnClick="BtnAdd_Click"/>    
    </div>
</asp:Content>