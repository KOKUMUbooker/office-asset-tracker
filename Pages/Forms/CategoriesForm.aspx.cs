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
        if (!IsPostBack)
        {
            var categoryId = Request.QueryString["id"];
            if (!string.IsNullOrEmpty(categoryId))
            {
                formTitle.InnerText = "Edit Category";
                btnSubmit.Text = "Update category";

                int id = int.Parse(categoryId);
                LoadCategory(id);
            }
        }
    }

    protected void BtnSubmit_Click(object sender, EventArgs e)
    {
        var dto = new CreateCategoryDto
        {
            Name = CategoryName.Text
        };

        var idParam = Request.QueryString["id"];
        if (string.IsNullOrEmpty(idParam))
        {
            // CREATE
            _repo.CreateCategory(dto);
        }
        else
        {
            // UPDATE
            int categoryId = int.Parse(idParam);
            _repo.UpdateCategory(categoryId, dto);
        }

        Response.Redirect("~/Pages/Categories.aspx");
    }

    protected void BackBtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Pages/Categories.aspx");
    }

    private void LoadCategory(int categoryId)
    {
        var category = _repo.GetCategoryById(categoryId);

        if (category == null)
        {
            // Handle not found
            Response.Redirect("~/Pages/Categories.aspx");
            return;
        }

        CategoryName.Text = category.Name;
    }
}