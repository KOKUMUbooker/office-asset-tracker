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
            var assets = _repo.GetAssets();

            gvAssets.DataSource = assets;
            gvAssets.DataBind();
        }
    }

    protected void BtnAdd_Click(object sender, EventArgs e)
    {
        Response.Redirect("Pages/Forms/AssetForm.aspx");
    }
}