<%@ WebHandler Language="C#" Class="jiludaan" %>

using System;
using System.Web;

public class jiludaan : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";

        /******************************************
         * 保存已做题id,和答案           
         * **************************************/

        if (context.Request["eid"]!=null && context.Request["eid"]!="")
        {
            var  eid=int.Parse(context.Request["eid"]);
            KS_ExamUser score = new KS_ExamUser(eid);

            //所有题目包括子题
            var quLsit=DbHelperSQL.Query("SELECT  * FROM KS_Questions where Parent_id in(SELECT  id FROM KS_Questions  where  t_type=5 and id in("+score.exam+")) or id in("+score.exam+")").Tables[0];

            var    s_name = "";//用户回答的题目
            var    answer = "";//用户回答的答案


            for (var i=0; i<quLsit.Rows.Count;i++)
            {
                var ids=context.Request.Params[quLsit.Rows[i]["id"].ToString()];

                if (ids!=null &&ids!="")
                {
                    if (s_name=="")
                    {
                        s_name = quLsit.Rows[i]["id"].ToString();
                    }
                    else {
                        s_name +=","+ quLsit.Rows[i]["id"].ToString();
                    }

                    if (answer=="")
                    {
                        answer = ids;
                    }
                    else
                    {
                        answer += "/"+ids;
                    }

                }
            }

            score.s_name = s_name;
            score.answer = answer;


            //HttpCookie cookie = new HttpCookie("Uid");
            //cookie.Expires = DateTime.Now.AddDays(1);

            //context.Response.Cookies.Add(cookie);

            //context.Response.Cookies["s_name"].Value = s_name;
            //context.Response.Cookies["answer"].Value = answer;


            //cookie.Expires = DateTime.Now.AddDays(-1);//清除


             score.Update();







        }




        //context.Response.Write("Hello World");
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}