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
            LoadStaff();
        }
    }

    protected void gvStaff_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int staffId = Convert.ToInt32(e.CommandArgument);

        if (e.CommandName == "EditStaff")
        {
            Response.Redirect("~/Pages/Forms/StaffForm.aspx?id=" + staffId);
        }

        if (e.CommandName == "DeleteStaff")
        {
            _repo.DeleteStaff(staffId);

            // reload data
            LoadStaff();
        }
    }

    protected void BtnAdd_Click(object sender, EventArgs e)
    {
        Response.Redirect("Forms/StaffForm.aspx");
    }

    private void LoadStaff() 
    {
        var staff = _repo.GetStaffMembers();

        gvStaff.DataSource = staff;
        gvStaff.DataBind();
    }
}