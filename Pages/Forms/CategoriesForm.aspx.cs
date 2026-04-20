using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using office_asset_tracker.DAL;
using office_asset_tracker.Models;

public partial class Pages_Forms_CategoriesForm : System.Web.UI.Page
{
    private CategoryRepository _repo;

    public Pages_Forms_CategoriesForm()
    {
        _repo = new CategoryRepository();
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void BtnSubmit_Click(object sender, EventArgs e)
    {
        var newCategory = new CreateCategoryDto
        {
            Name = CategoryName.Text
        };

        _repo.CreateCategory(newCategory);

        Response.Redirect("~/Pages/Categories.aspx");
    }

    protected void BackBtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Pages/Categories.aspx");
    }
}