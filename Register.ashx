<%@ WebHandler Language="C#" Class="denglu" %>

using System;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.SessionState;
using LitJson;
using System.Configuration;
using Newtonsoft.Json;
using System.Collections;

public class denglu : IHttpHandler, IRequiresSessionState
{
    public string mes = "";
    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/html";

        var a = "1";
        Hashtable b;

        switch (a)
        {
            case "1"://登录验证
                     //if (context.Request["code"].ToUpper() != context.Session["code"].ToString())
                     //{
                     //    mes = "验证码错误";
                     //    break;
                     //}

                var s_realname = context.Request["s_realname"];
                var y_carId = context.Request["y_carId"];
                var phone = context.Request["phone"];
                var pwd = context.Request["pwd"];
                var pwd2 = context.Request["pwd2"];
                var schoolId = context.Request["schoolId"];
                var sex = context.Request["sex"];

                var kd = context.Request["kd"];

                if (s_realname == "" || y_carId == "" || phone == "" || pwd == "" || pwd2 == "")
                {

                    b = new Hashtable { { "mes", "请认真填写完所有项" } };

                    mes = JsonConvert.SerializeObject(b);
                    break;
                }
                if (phone.Length!=11)
                {


                    b = new Hashtable { { "mes", "手机号长度不正确，请认真填写" } };

                    mes = JsonConvert.SerializeObject(b);
                    break;
                }

                if (y_carId.Length!=18)
                {


                    b = new Hashtable { { "mes", "身份证长度不正确，请认真填写" } };

                    mes = JsonConvert.SerializeObject(b);
                    break;
                }
                if (pwd != pwd2)
                {


                    b = new Hashtable { { "mes", "二次密码不一致，请重新输入" } };

                    mes = JsonConvert.SerializeObject(b);
                    break;
                }
                if (pwd.Length<6)
                {

                    b = new Hashtable { { "mes", "密码长度不能小于6位" } };

                    mes = JsonConvert.SerializeObject(b);
                    break;
                }


                var siteId = Convert.ToInt32(ConfigurationManager.AppSettings["siteId"]);


                //var user = DbHelperSQL.Query(" SELECT * FROM   FYM_COMPANY  WHERE s_phone='" + phone+"'").Tables[0];

                //if (user.Rows.Count > 0)
                //{

                //    b = new Hashtable { { "mes", "此手机号有存在！" } };

                //    mes = JsonConvert.SerializeObject(b);
                //    break;

                //}
                var user2 = DbHelperSQL.Query(" SELECT * FROM   FYM_COMPANY  WHERE y_carId='" + y_carId+"'").Tables[0];

                if (user2.Rows.Count > 0)
                {

                    b = new Hashtable { { "mes", "此身份证号有存在！" } };

                    mes = JsonConvert.SerializeObject(b);
                    break;

                }



                FYM_COMPANY fym = new FYM_COMPANY();

                fym.y_carId = y_carId;
                fym.s_realname = s_realname;
                fym.s_sex = int.Parse(sex);
                fym.s_phone = phone;
                fym.y_schoolId = int.Parse(schoolId);
                fym.s_password = pwd;
                fym.y_siteId = siteId;
                fym.s_kdId = int.Parse(kd);
                fym.Add();



                //var pwd = GetValidation2(6);//注册生成的密码




                b = new Hashtable { { "mes", "ok" }, { "pwd", pwd } };
                mes = JsonConvert.SerializeObject(b);

                break;
            default:
                b = new Hashtable { { "mes", "非法操作" } };

                mes = JsonConvert.SerializeObject(b);

                break;
        }

        context.Response.Write(mes);
    }



    /// <summary>
    /// 随即获取验证码
    /// </summary>
    /// <param name="num">位数</param>
    /// <returns>返回验证码</returns>
    public string GetValidation2(int num)
    {
        string str = "1234567890"; //"或者写汉字也行"
        string validatecode = "";
        Random rd = new Random();
        for (int i = 0; i < num; i++)
        {
            validatecode += str.Substring(rd.Next(0, str.Length), 1);
        }
        return validatecode;
    }






    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}