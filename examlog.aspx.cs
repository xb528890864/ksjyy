using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class examlog : System.Web.UI.Page
{
    public string count = "0";
    public string sorce = "0";

    public string times = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["dtscorse"] = null;//只在考试页面中存在，其它页面都要清空

        if (Session["id"] == null)
        {
            // MessageBox.ShowAndRedirect(this, "请先登录！", "default.aspx");
            Response.Redirect("default.aspx");
            return;
        }
       
        if (Request["time"]!=null)
        {
            times = Request["time"];
        }
      
       
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        System.Data.DataTable dt = DbHelperSQL.GetList(" select * from ks_examuser where uid=" + Session["uid"] + " and s_endtime > '" + DateTime.Now + "' and s_time< '" + DateTime.Now + "' and s_ok=0").Tables[0];

        if (dt.Rows.Count > 0)
        {
            Response.Redirect("exam.aspx");
        }
        else
        {
            MessageBox.Show(this, "您暂时没有需要参加的考试！");
            //  Response.Redirect("main.aspx");
            return;
        }
    }

    //protected void Button1_Click(object sender, EventArgs e)
    //{
    //    KS_ExamBspk ks = new KS_ExamBspk();
    //    ks.uid = int.Parse(Session["uid"].ToString());
    //    ks.uno = Session["u_name"].ToString();
    //    FYM_COMPANY fc = new FYM_COMPANY(int.Parse(Session["uid"].ToString()));
    //    ks.uxueyuan = fc.s_City;
    //    ks.uzhuanye = fc.s_Province;
    //    ks.uname = fc.s_realname;
    //    ks.Add();
    //    MessageBox.Show(this, "预约成功！请等待系统安排考试！");
    //}
}