using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using office_asset_tracker.DAL;

public partial class Categories : Page
{
    private CategoryRepository _repo;

    public Categories()
    {
        _repo = new CategoryRepository();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            var categories = _repo.GetCategories();

            gvCategories.DataSource = categories;
            gvCategories.DataBind();
        }
    }

    protected void BtnAdd_Click(object sender, EventArgs e)
    {
        Response.Redirect("Forms/CategoriesForm.aspx");
    }
}