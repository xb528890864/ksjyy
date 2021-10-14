<%@ WebHandler Language="C#" Class="denglu" %>

using System;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.SessionState;
using LitJson;
using System.Configuration;

public class denglu : IHttpHandler, IRequiresSessionState
{
    public string mes = "";
    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/html";

        var a = "1";

        switch (a)
        {
            case "1"://登录验证
                     //if (context.Request["code"].ToUpper() != context.Session["code"].ToString())
                     //{
                     //    mes = "验证码错误";
                     //    break;
                     //}


                var s_password = context.Request["s_password"];

                var carId = context.Request["phone"];//身份证




                if (s_password==""||carId=="")
                {
                    mes = "请认真填写完所有项";
                    break;
                }
                //if (!PageValidate.IsPhone(phone)) {

                //    mes = "身份证号不正确，请认真填写";
                //    break;
                //}

                var siteId = ConfigurationManager.AppSettings["siteId"];

                var user = DbHelperSQL.Query(" SELECT * FROM   FYM_COMPANY  WHERE y_carId='" + carId+"'").Tables[0];


                //var siteId = Convert.ToInt32(ConfigurationManager.AppSettings["siteId"]);

                //FYM_COMPANY fym;
                if (user.Rows.Count > 0)
                {
                    //fym = new FYM_COMPANY(int.Parse(user.Rows[0]["id"].ToString()));

                    if (user.Rows[0]["s_password"].ToString()!=s_password)
                    {
                        mes = "密码错误";
                        break;

                    }

                    if (user.Rows[0]["y_siteId"].ToString()!=siteId)
                    {
                        mes = "站点不匹配,此账号不允许在此站点登录！";
                        break;

                    }




                }
                else
                {
                    mes = "此身份证账号不存在！";
                    break;
                }


                mes = "1";

                context.Session["id"] = user.Rows[0]["id"].ToString();
                context.Session["phone"] =user.Rows[0]["s_phone"].ToString();


                context.Session["s_realname"] =user.Rows[0]["s_realname"].ToString();



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

}