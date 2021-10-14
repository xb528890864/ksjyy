using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    public FYM_COMPANY fu;

    public string dequ = "";
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["id"] == null)
        {
            MessageBox.ShowAndRedirect(this, "请先登录", "/default.aspx");
            return;
        }

        var id = int.Parse(Session["id"].ToString());
        fu = new FYM_COMPANY(id);

      var sch=DbHelperSQL.Query(" select * from S_School where id="+fu.y_schoolId).Tables[0];

        if (sch.Rows.Count>0)
        {
            dequ = sch.Rows[0]["Parent_id"].ToString();
        }

    }

}
