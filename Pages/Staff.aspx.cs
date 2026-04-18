using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using office_asset_tracker.DAL;

public partial class Staff : System.Web.UI.Page
{
    private StaffRepository _repo;

    public Staff()
    {
        _repo = new StaffRepository();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            var staff = _repo.GetStaffMembers();

            gvStaff.DataSource = staff;
            gvStaff.DataBind();
        }
    }

    protected void BtnAdd_Click(object sender, EventArgs e)
    {
        Response.Redirect("Forms/StaffForm.aspx");
    }
}