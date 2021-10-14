using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Configuration;
using System.Data;
using NPOI.HSSF.Record.Chart;
using NPOI.SS.Formula.Functions;

public partial class exam : System.Web.UI.Page
{
    public ArrayList questions = new ArrayList();

    public string eid = "";//成绩表id
    public FYM_COMPANY um; //用户
    public List<column2> cList;//所有栏目
    public System.Data.DataTable dt;//该试卷的所有考题
    public System.Data.DataTable dt2;//阅读理解子题
    public string shiJuanM;//试卷名
    public string shiJuanSM;//试卷说明

    public int tishu = 0;

    public System.Data.DataTable Setup;

    public int haoshitime = 0;
    public Dictionary<string, string> list = new Dictionary<string, string>();//已答题的集合
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (Session["id"] == null)
        {
            // MessageBox.ShowAndRedirect(this, "请先登录！", "default.aspx");
            Response.Redirect("default.aspx");
            return;
        }
        else
        {
            var ks= DbHelperSQL.Query(" select * from KS_setup").Tables[0];
            var time1=DateTime.Parse( ks.Rows[0]["starttime"].ToString());
            var time2 = DateTime.Parse(ks.Rows[0]["endtime"].ToString());
            if (DateTime.Now<time1  || DateTime.Now>time2)
            {
                //MessageBox.ShowAndRedirect(this, "考试时间未到或已过！", "examlog.aspx");
                Response.Redirect("examlog.aspx?time=1");
                return ;
               
            }
            um = new FYM_COMPANY(int.Parse(Session["id"].ToString()));
        }
        var set = DbHelperSQL.Query("select * from KS_setup").Tables[0];
        DateTime end = Convert.ToDateTime(set.Rows[0]["endtime"]);
        var now = (end - DateTime.Now).TotalSeconds;
        var siteId = Convert.ToInt32(ConfigurationManager.AppSettings["siteId"]);
        if (now <= 1)//考试时间用完了回到首页。
        {

            Response.Redirect("examlog.aspx");
            return;
        }
        else
        {

            haoshitime = (int)now;
        }
       



        var huomuId = Request["id"];

        if (huomuId==null || huomuId=="")
        {
            MessageBox.ShowAndRedirect(this, "非法操作！", "examlog.aspx");
            return;
        }
        //已考完这个科目，回到首页
        var dd = DbHelperSQL.Query(" select * from KS_ExamUser where examid=" + huomuId + " and y_year=" + DateTime.Now.Year + " and uid=" + Session["id"] + "order by id desc").Tables[0];

        if (dd.Rows.Count > 0)
        {
            if (dd.Rows[0]["s_ok"].ToString() == "1")
            {
                Response.Redirect("examlog.aspx");
                return;
            }
        }


        //考试科目名
        shiJuanM = DbHelperSQL.Query(AppConstant.huomu +" where id= "+ huomuId).Tables[0].Rows[0]["s_name"].ToString();


      


        cList = new List<column2>();
        column2 col = new column2();
        col.id = "1";
        col.name = "单选题（每题1.5分, 共30分）";
        cList.Add(col);
        column2 col2 = new column2();
        col2.id = "2";
        col2.name = "不定项选择题（每题2分, 共20分）";
        cList.Add(col2);
        column2 col3 = new column2();
        col3.id = "3";
        col3.name = "判断题（每题1.5分, 共30分）";
        cList.Add(col3);
        column2 col4 = new column2();
        col4.id = "5";
        col4.name = "情境分析题（每题4问，每问2.5分，共20分）";
        cList.Add(col4);


        //清空以往未提交的考试记录-------------------------------------------------------
        //var y_time = DateTime.Now.AddDays(-1).Date;
        //DbHelperSQL.Query(" delete   from   KS_ExamUser    where   s_ok=0 and    s_examtime <'" + y_time + "'");
        //------------------------------------------------------------------------------







        //查找此用户，该科目，该年份是否有记录
        var userScore = DbHelperSQL.Query(" select * from KS_ExamUser where uid=" + Session["id"] + " and examid=" + huomuId + " and y_year=" + DateTime.Now.Year).Tables[0];

        //试卷题数设置数量
        Setup = DbHelperSQL.Query(" select top 1 * from KS_setup ").Tables[0];

        if (userScore.Rows.Count>0)
        {

            var Qa = userScore.Rows[0]["exam"].ToString();//所有题不包括子题


            dt = DbHelperSQL.Query(" select * from KS_Questions where id in( "+ Qa + ")").Tables[0];

            Session["eid"]= userScore.Rows[0]["id"].ToString();

            eid = userScore.Rows[0]["id"].ToString();


             

         var ids=userScore.Rows[0]["s_name"].ToString().Split(',');//题id
         var answers=userScore.Rows[0]["answer"].ToString().Split('/');

            for (var i=0;i<ids.Length;i++)
            {
                list.Add(ids[i],answers[i]);
            }

        }
        else
        {
            

            var year = DateTime.Now.Year;

            var dt1 = DbHelperSQL.Query("  select top " + Setup.Rows[0]["danxuan"] + " * from KS_Questions  where Parent_id=0 and t_type=1  and y_huomuId=" + huomuId + " and y_year=" + year + " order by NEWID();  ").Tables[0];

            var dt3 = DbHelperSQL.Query("  select top " + Setup.Rows[0]["duoxuan"] + " * from KS_Questions  where Parent_id=0 and t_type=2  and y_huomuId=" + huomuId + " and y_year=" + year + " order by NEWID();  ").Tables[0];

            var dt4 = DbHelperSQL.Query("  select top " + Setup.Rows[0]["panduan"] + " * from KS_Questions where Parent_id=0 and t_type=3  and y_huomuId=" + huomuId + " and y_year=" + year + " order by NEWID();  ").Tables[0];

            var dt5 = DbHelperSQL.Query("  select top " + Setup.Rows[0]["yedu"] + " * from KS_Questions  where Parent_id=0 and t_type=5  and y_huomuId=" + huomuId + " and y_year=" + year + " order by NEWID();  ").Tables[0];

            //合并各选择数量组成考试所有题目
            dt = dt1.Clone();

            object[] obj = new object[dt.Columns.Count];
            for (int i = 0; i < dt1.Rows.Count; i++)
            {
                dt1.Rows[i].ItemArray.CopyTo(obj, 0);
                dt.Rows.Add(obj);
            }

            for (int i = 0; i < dt3.Rows.Count; i++)
            {
                dt3.Rows[i].ItemArray.CopyTo(obj, 0);
                dt.Rows.Add(obj);
            }

            for (int i = 0; i < dt4.Rows.Count; i++)
            {
                dt4.Rows[i].ItemArray.CopyTo(obj, 0);
                dt.Rows.Add(obj);
            }


            for (int i = 0; i < dt5.Rows.Count; i++)
            {
                dt5.Rows[i].ItemArray.CopyTo(obj, 0);
                dt.Rows.Add(obj);
            }

            //记录所有的题目(子题不记录),保存数存中-
            var exam = "";
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (exam == "")
                {
                    exam = dt.Rows[i]["id"].ToString();
                }
                else
                {
                    exam += "," + dt.Rows[i]["id"].ToString();
                }


            }



            //添加一条成绩数据-------------------------------------
            KS_ExamUser kseu = new KS_ExamUser();
            kseu.uid = int.Parse(Session["id"].ToString());
            kseu.s_examtime = DateTime.Now;

            kseu.uno = Session["phone"].ToString();
            kseu.y_siteId = siteId;
            kseu.examid = int.Parse(huomuId);
            kseu.y_year = DateTime.Now.Year;
            kseu.exam = exam;//所有题目（不包括子题）

            int ii = kseu.Add();
            eid = ii.ToString();
            //Session["eid"] = eid;


        }
   
       // Session["dtscorse"] = dt;//计算成绩所有

    }
}
//科目
public class column2
{
    public string id { get; set; }
    public string name { get; set; }
}
