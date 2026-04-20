using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using office_asset_tracker.DAL;

public partial class _Default : Page
{
    private AssetRepository _repo;

    public _Default()
    {
        _repo = new AssetRepository();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadAssets();
        }
    }

    protected void BtnAdd_Click(object sender, EventArgs e)
    {
        Response.Redirect("Pages/Forms/AssetForm.aspx");
    }

    protected void gvAssets_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int assetId = Convert.ToInt32(e.CommandArgument);

         if (e.CommandName == "EditAsset")
        {
            Response.Redirect("~/Pages/Forms/AssetForm.aspx?id=" + assetId);
        }

        if (e.CommandName == "DeleteAsset")
        {
           _repo.DeleteAsset(assetId);

            // reload data
            LoadAssets();
        }
    }
    
    private void LoadAssets()
    {
        var assets = _repo.GetAssets();
        gvAssets.DataSource = assets;
        gvAssets.DataBind();
    }
}