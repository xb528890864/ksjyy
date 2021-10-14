<%@ WebHandler Language="C#" Class="jiaojuan" %>

using System;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.SessionState;
using System.Collections.Generic;
using LitJson;
using System.Linq;

public class jiaojuan : IHttpHandler, IRequiresSessionState
{
    public  double scores = 0;//考试分数
    public  string exam = "";//试卷所有题目
    public  string answer = "";//所有答案
    public  string meitidaan = "";//每题答案
    public  int yesNo = 1;//1对0错
    public  string ids = "";
    public  string mes = "";

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/html";


        var action = context.Request.QueryString["action"];
        //-------------------------------------------------------------------

        var eid2 = int.Parse(context.Request["eid"]);

        KS_ExamUser score1 = new KS_ExamUser(eid2);

        if (score1.s_name==null||score1.s_name=="") { action = "1"; }
        //--------------------------------------------------------------------

        if (action == "jiaojuan")
        {

            if (context.Request["eid"] != null && context.Request["eid"] != "")
            {
                var eid = int.Parse(context.Request["eid"]);

                KS_ExamUser score = new KS_ExamUser(eid);



                var quLsit = DbHelperSQL.Query("SELECT  * FROM KS_Questions where Parent_id in(SELECT  id FROM KS_Questions  where  t_type=5 and id in(" + score.exam + ")) or id in(" + score.exam + ")  and t_type !=5").Tables[0];

                var list2 = new List<test2>();//已答题的集合



                var ids = score.s_name.Split(',');//题id集合

                var answers = score.answer.Split('/');//答案集合

                var db = DbHelperSQL.Query(AppConstant.question + " where id in(" + score.s_name + ")").Tables[0];

                for (var i = 0; i < db.Rows.Count; i++)
                {

                    test2 te = new test2();

                    te.id = db.Rows[i]["id"].ToString();
                    te.answer = db.Rows[i]["answer"].ToString();
                    te.userAnswer = answers[i];
                    te.score = db.Rows[i]["score"].ToString();

                    list2.Add(te);

                }


                for (var i = 0; i < list2.Count; i++)
                {
                    var userAnswer = list2[i].userAnswer.Replace(",", "");
                    userAnswer = userAnswer.Replace(" ", "");

                    var answer = list2[i].answer.Replace(" ", "");


                    if (userAnswer.Length ==answer.Length && userAnswer==answer)
                    {

                        scores += double.Parse(list2[i].score);
                    }


                }

                var a= quLsit.Rows.Count-list2.Count;

                //if (a > 0)
                //{
                //    mes = "x";
                //}

                if (mes == "x")
                {

                    context.Response.Write(mes);
                    context.Response.Write(",");
                    context.Response.Write(scores);

                }
                else
                {

                    KS_ExamUser ks = new KS_ExamUser(int.Parse(context.Request["eid"]));



                    ks.score = decimal.Parse(scores.ToString());

                    ks.s_endtime = DateTime.Now;

                    ks.s_ok = 1;

                    ks.Update();
                    mes = "1";

                    context.Session["eid"] = null;

                    context.Response.Write(mes);
                    context.Response.Write(",");
                    context.Response.Write(scores);
                }






            }








        }
        else
        {
            mes = "至少要答一题";
            context.Response.Write(mes);
            context.Response.Write(",");
            context.Response.Write(scores);
        }


    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }



}


partial class test2
{
    public string id { get; set; }
    public string userAnswer { get; set; }//用户答案
    public string answer { get; set; }
    public string score { get; set; }
    //public string t_type { get; set; }
    //public string Parent_id { get; set; }

}