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

    }

    protected void BtnSubmit_Click(object sender, EventArgs e)
    {
        var newStaff = new CreateStaffDto
        {
            Name = StaffName.Text
        };

        _repo.CreateStaff(newStaff);

        Response.Redirect("~/Pages/Staff.aspx");
    }

    protected void BackBtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Pages/Staff.aspx");
    }
}