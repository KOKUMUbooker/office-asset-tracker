using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using office_asset_tracker.DAL;

public partial class Reports : System.Web.UI.Page
{
    private ReportRepository _repo;

    public Reports()
    {
        _repo = new ReportRepository();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            var assetCountByCategory = _repo.GetAssetCountByCategory();
            gvAssetCountByCategory.DataSource = assetCountByCategory;
            gvAssetCountByCategory.DataBind();

            var assetCountByStatus = _repo.GetAssetCountByStatus();
            gvAssetCountByStatus.DataSource = assetCountByStatus;
            gvAssetCountByStatus.DataBind();

            var assetReportOverview = _repo.GetReportOverview();
            gvAssetReportOverview.DataSource = assetReportOverview;
            gvAssetReportOverview.DataBind();
        }
    }
}