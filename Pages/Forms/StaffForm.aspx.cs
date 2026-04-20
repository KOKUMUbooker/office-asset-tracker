using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using office_asset_tracker.DAL;
using office_asset_tracker.Models;

public partial class Pages_Forms_StaffForm : System.Web.UI.Page
{
    private StaffRepository _repo;

    public Pages_Forms_StaffForm()
    {
        _repo = new StaffRepository();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) 
        {
            var staffId = Request.QueryString["id"];
            if (!string.IsNullOrEmpty(staffId))
            {
                formTitle.InnerText = "Edit Staff";
                btnSubmit.Text = "Update staff";

                int id = int.Parse(staffId);
                LoadStaff(id);
            }
        }
    }

    protected void BtnSubmit_Click(object sender, EventArgs e)
    {
        var dto = new CreateStaffDto
        {
            Name = StaffName.Text
        };

        var staffId = Request.QueryString["id"];
        if (!string.IsNullOrEmpty(staffId))
        {
            // UPDATE
            int id = int.Parse(staffId);
            _repo.UpdateStaff(id, dto);
        }
        else
        {
            // CREATE
            _repo.CreateStaff(dto);
        }

        Response.Redirect("~/Pages/Staff.aspx");
    }

    protected void BackBtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Pages/Staff.aspx");
    }

    private void LoadStaff(int staffId)
    {
        var staff = _repo.GetStaffById(staffId);

        if (staff == null)
        {
            // Handle not found
            Response.Redirect("~/Pages/Staff.aspx");
            return;
        }

        StaffName.Text = staff.Name;
    }
}