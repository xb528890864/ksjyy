<%@ Page Language="C#" AutoEventWireup="true" CodeFile="examlog.aspx.cs" Inherits="examlog" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
<head runat="server">
    <title><%=ConfigurationManager.AppSettings["Title"] %></title>
</head>
<body>
    <style type="text/css">
        .listzone td {
            border-bottom: 1px solid #cde6ff;
        }

        .style1 {
            width: 87px;
        }

        .td1 a {
            color: #fff;
        }

        /*这里写pc客户端的样式*/
        @media only screen and (min-width: 1029px) {
            body, html, td {
                font-size: 14px;
            }

            .tab-top td {
                font-size: 18px;
            }
        }
        /*这里写手机样式*/
        @media screen and (min-width: 320px) and (max-width: 480px) {
            body, html, td {
                font-size: 16px;
            }

            .listzone td a {
                display: block;
                line-height: 20px;
                text-align: center;
            }

            .listzone td em {
                display: none;
            }

            .tab-top td {
                font-size: 16px;
            }
        }
    </style>
    <form id="form1" action="examlog.aspx" method="post">



        <link href="<%=ConfigurationManager.AppSettings["IP"] %>/fymadmin/images/style.css" type="text/css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" media="screen" href="<%=ConfigurationManager.AppSettings["IP"] %>/fymadmin/css/tinyTips.css" />
        <script type="text/javascript" src="<%=ConfigurationManager.AppSettings["IP"] %>/fymadmin/js/jquery.min.js"></script>
        <script type="text/javascript" src="<%=ConfigurationManager.AppSettings["IP"] %>/fymadmin/js/jquery.tinyTips.js"></script>
        <link href="<%=ConfigurationManager.AppSettings["IP"] %>/images/style2.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript">
            $(document).ready(function () {
                $('a.tTip').tinyTips('title');
                $('img.imgTip').tinyTips('title');
                $('img.tTip').tinyTips('title');
                $('h1.tagline').tinyTips('tinyTips are totally awesome!');
            });
        </script>
        <script>
            function SelAll(theForm) {
                for (i = 0; i < theForm.elements.length; i++) {
                    if (theForm.elements[i].type == "checkbox" && theForm.elements[i].name != "SELALL") {
                        theForm.elements[i].checked = !theForm.elements[i].checked;
                    }
                }
            }
        </script>


        <div style="min-height: 680px !important;">

            <div id="timer" style="color: red; font-size: 16px; text-align: center; position: fixed; right: 15px; line-height: 30px; margin-top: 60px; right:10%;"></div>

            <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin: 0px auto;" class="tab-top">
                <tr height="55" style="background: #0e7bce;">
                    <td class="td1" width="65%" style="color: #fff; padding-left: 4%;">你好<span><%=Session["s_realname"] %></span>，欢迎登陆江西省高校教师岗前培训在线考试系统！
                    </td>
                    <td class="td2" style="padding-right: 4%;"><a href="/updateUser.aspx" >修改个人信息</a> <a href="/default.aspx?SignOut=1" style="display: block;">退出系统</a></td>
                </tr>


            </table>
            <%  
                //var id = Session["y_schoolId"].ToString();
                //var y_schoolName = DbHelperSQL.GetValueById("S_School", "y_schoolName", id);

                //var shiJuantype= Request["s_classid"];
                //var sql = " select  *  from  dbo.S_ShiJuan where sj_ok=1 ";
                //if (!string.IsNullOrWhiteSpace(shiJuantype)) {
                //    sql = "select *  from  dbo.S_ShiJuan where sj_ok=1 and s_classid="+shiJuantype;
                //}

                var sql = " a ";



                if (Request["s_classid"] != null && Request["s_classid"] != "")
                {
                    sql = AppConstant.huomu + " where id =" + Request["s_classid"];
                }
                else
                {
                    sql = AppConstant.huomu;
                }
                var shiJuan = DbHelperSQL.Query(sql);

            %>

            <table width="60%" border="0" cellspacing="0" cellpadding="0" style="margin: 0px auto; background: #fff;">
                <tr>
                    <td>
                        <div class="searchzone">
                            <table height="30" cellspacing="0" cellpadding="0" width="100%" border="0">
                                <tbody>
                                    <tr>
                                        <td height="30">欢迎参加江西省高校教师岗前培训考试，本考试为在线考试，考试时间为180分钟，点击“开始考试即可开始”。
                                            <%--<font style="float: right; margin-right: 100px">科目：<select name="s_classid" id="Select1" class="input">--%>
                                                <%--<option value="0">顶级分类</option>--%>
                                              <%--  <%=Tools.WriteOption2("S_ShiJuanType", "s_name", "id", 0, "0")%>--%>
                                           <%-- </select>
                                                &nbsp;&nbsp;<input type="submit" value="查询" class="input" />
                                                <input type="button" value="全部" id="chaxun" class="input" /></font>--%>
                                        </td>
                                        <td align="right" colspan="2"></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="listzone">
                            <table cellspacing="0" cellpadding="3" width="100%" align="center" border="0">
                                <tbody>
                                    <tr class="list">
                                        <td class="biaoti" width="15%" style="height: 50px;">科目</td>
                                        <%-- <td class="biaoti" width="20%" style="height: 50px;">试卷名</td>--%>
                                        <%--<td class="biaoti" width="10%" style="height: 50px;">时间</td>--%>
                                        <td class="biaoti" width="10%" style="height: 50px;">次数</td>
                                        <%--   <td class="biaoti" width="10%" style="height: 50px;">分数</td>--%>
                                        <td class="biaoti" width="10%" style="height: 50px;">考试状态</td>
                                        <td class="biaoti" width="25%" style="height: 50px;">操作</td>
                                    </tr>


                                    <%

                                        var user = DbHelperSQL.Query(AppConstant.FYM_COMPANY + "where id=" + Session["id"]).Tables[0];

                                        var time = int.Parse(user.Rows[0]["s_hot"].ToString());

                                        for (int i = 0; i < shiJuan.Tables[0].Rows.Count; i++)
                                        {

                                            var dt = DbHelperSQL.GetList("select COUNT(*),ISNULL(MAX(score),0) from ks_examuser where s_ok=1 and uid=" + Session["id"] + " and examid=" + shiJuan.Tables[0].Rows[i]["id"]).Tables[0];                     /*考试类型id                   试卷id*/

                                            if (dt.Rows.Count > 0)
                                            {
                                                count = dt.Rows[0][0].ToString();
                                                sorce = dt.Rows[0][1].ToString();

                                            }

                                    %>

                                    <tr bgcolor='#ffffff' onmouseover="this.bgColor='#CDE6FF'" onmouseout="this.bgColor='#FFFFFF'" style="height: 50px; text-align: center;">
                                        <%--<td><%=shiJuan.Tables[0].Rows[i]["s_classname"] %> </td>--%>
                                        <td><%=shiJuan.Tables[0].Rows[i]["s_name"] %> </td>
                                        <%--<td>45分钟</td>--%>
                                        <td><%=count%> </td>
                                        <%-- <td><%=sorce%> </td>--%>
                                        <td><%
                                                if (int.Parse(count) > 0 || time <= 1)
                                                {
                                                    Response.Write("<font color='red'>已完成</font>");
                                                }
                                                else
                                                {
                                                    Response.Write("<font>未开始</font>");
                                                }


                                        %> </td>
                                        <td>
                                            <% if (int.Parse(count) == 0 && time > 1)//
                                                {%>

                                            <a href="exam.aspx?id=<%=shiJuan.Tables[0].Rows[i]["id"] %>" class="btn"><strong>开始考试</strong></a>
                                            <%}
                                                else
                                                {
                                            %>
                                            <%-- <a href="examlo.aspx?id=<%=shiJuan.Tables[0].Rows[i]["id"] %>"><strong>考试记录</strong></a></td>--%>已作答完毕
                                            <%
                                                }


                                            %>
                                    </tr>
                                    <%} %>
                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
            </table>


            <br clear="all" />
            <br clear="all" />
            <br clear="all" />
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tab7">
                <tr height="75">
                    <td align="center" valign="middle"><%--<a href="default.aspx"><span>返回首页</span></a>   |    <a href="password.aspx"><span >修改密码</span></a><a href="training.aspx"><span >在线练习</span></a>   |    <a href="examlog.aspx"><span>在线考试</span></a>    |    <a href="examlo.aspx"><span>考试记录</span></a><br />--%> COPYIGHT © 2018-2019 江西省高等学校师资培训中心  技术支持：<a href="javascript:void(0);" target="_blank">云端科技</a></td>
                </tr>
            </table>
        </div>
    </form>
    <script>

        $("#chaxun").click(function () {
            window.location.href = "/examlog.aspx";
        })


    </script>


    <script>


        var maxtime =<%=time%>; //一个小时，按秒计算，自己调整!  



         function CountDown() {
                if (maxtime >1) {
                    minutes = Math.floor(maxtime / 60);
                    seconds = Math.floor(maxtime % 60);
                    msg = "距考试结束还有<br/>" + minutes + "分" + seconds + "秒";
                    document.all["timer"].innerHTML = msg;
                    if (maxtime == 3 * 60) alert('注意，还有3分钟!');

                    maxtime = maxtime - 1;

                  
                   //var str = maxtime % 60;
                  
                  
                   // if (str==1) {

                   
                   // $.ajax({
                   //     type: "POST",
                   //     url: "haoshitime.ashx",
                   //     data: { haoshitime: maxtime },
                   //     success: function (data) {

                   //     }
                   //     });

                   // }
                    setTimeout("CountDown()", 1000);
                }
                else {

                      $.ajax({
                    type: "POST",
                    url: "haoshitime.ashx",
                    data: { haoshitime: maxtime },
                    success: function (data) {

                    }
                   });
                    //clearInterval(timer);  
                    alert("时间到，结束!");
                    window.location.reload();
                   
                }
        }



        if ("<%=times%>" == "" && maxtime < 10800 && maxtime > 1) {

            setTimeout("CountDown()", 1000);
        }
        else if ("<%=times%>" == "") {

        }
        else {

            alert("考试时间未到或已过！");
        }


          //关机、切换网页。执行
    function setanswer2() {//a 题目编号，

  

          $.ajax({
                    type: "POST",
                    url: "haoshitime.ashx",
                    data: { haoshitime: maxtime },
                    success: function (data) {

                    }
                });

    }


          window.onblur = setanswer2;
     
    </script>

</body>
</html>
