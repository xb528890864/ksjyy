<%@ WebHandler Language="C#" Class="denglu" %>

using System;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.SessionState;
using LitJson;
using System.Configuration;
using System.Collections.Generic;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;

public class denglu : IHttpHandler, IRequiresSessionState
{
    public string mes = "";
    public  List<Dequ> list = new List<Dequ>();
    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/html";

        var a = "1";

        switch (a)
        {
            case "1":


                var dequ = context.Request["dequ"];
                if (dequ!="")
                {


             


                var user = DbHelperSQL.Query(" SELECT * FROM   S_School  WHERE Parent_id=" + dequ +" order by y_order ").Tables[0];





                for (var i=0;i<user.Rows.Count;i++)
                {
                    Dequ de = new Dequ();
                    de.id = user.Rows[i]["id"].ToString();
                    de.name=user.Rows[i]["y_schoolName"].ToString();

                    list.Add(de);
                }



                   mes= JsonConvert.SerializeObject(list);

               }
                break;
            case "2"://退出
                     //user item2 = (user)context.Session["user"];
                context.Session.Clear();
                mes = "<script language='javascript' defer>alert('已成功退出系统！');window.location=\"default.aspx\"</script>";
                //DbHelp.addrzhi(item2.Ygname + " 安全退出系统！", item2.Ygid);
                break;
            default:
                mes = "非法操作";
                break;
        }
      
        context.Response.Write(mes);
    }


    public bool IsReusable
    {
        get
        {
            return false;
        }
    }


    public class  Dequ
    {
        public string id { get; set; }
        public string name{ get; set; }
    }
}