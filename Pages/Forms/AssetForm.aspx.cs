using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using office_asset_tracker.DAL;
using office_asset_tracker.Models;

public partial class Pages_Forms_AssetForm : System.Web.UI.Page
{
    private CategoryRepository _categoryRepo;
    private AssetRepository _assetRepo;

    public Pages_Forms_AssetForm()
    {
        _categoryRepo = new CategoryRepository();
        _assetRepo = new AssetRepository();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindValuesToCategoryDropdown();
            BindValuesToStatusDropdown();
        }
    }

    protected void BtnSubmit_Click(object sender, EventArgs e)
    {
        var newAsset = new AssetCreateDto
        {
            Name = AssetName.Text,
            CategoryId = int.Parse(AssetCategory.SelectedValue),
            Status = AssetStatus.SelectedValue
        };

        _assetRepo.CreateAsset(newAsset);
        Response.Redirect("/");
    }

    private void BindValuesToCategoryDropdown() 
    {
        var categories = _categoryRepo.GetCategories();

        AssetCategory.DataSource = categories;
        AssetCategory.DataTextField = "Name"; // what user sees
        AssetCategory.DataValueField = "Id";  // actual value

        AssetCategory.DataBind();
        AssetCategory.Items.Insert(0, new ListItem("-- Select Category --", ""));
    }

    private void BindValuesToStatusDropdown()
    {
        AssetStatus.Items.Add(new ListItem("-- Select Status --", ""));
        AssetStatus.Items.Add("Available");
        AssetStatus.Items.Add("Assigned");
        AssetStatus.Items.Add("Damaged");

        AssetCategory.DataBind();
        AssetStatus.SelectedValue = "Available";
    }
}