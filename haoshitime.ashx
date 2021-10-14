<%@ WebHandler Language="C#" Class="haoshitime" %>

using System;
using System.Web;
using System.Web.SessionState;

public class haoshitime : IHttpHandler, IRequiresSessionState
{

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        //context.Response.Write("Hello World");

        var  time= context.Request["haoshitime"];
        if (time!=null &&time!="" )
        {
            FYM_COMPANY   um = new FYM_COMPANY(int.Parse(context.Session["id"].ToString()));
            um.s_hot = int.Parse(time);
            um.Update();
        }





    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}