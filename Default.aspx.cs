using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


        Session["id"] = null;
        Session["phone"] = null;
        Session["s_realname"] = null;


        if (Request["SignOut"] =="1")
        {
           
            //Session["y_schoolId"] = null;
            //Session["eid"] = null;
          
          
        }

        //if ( Session["id"]!=null&& Session["id"].ToString() != "")
        //{
        // Response.Redirect("examlog.aspx");

        //}
       
    }
}