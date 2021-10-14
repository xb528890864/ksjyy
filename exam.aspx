<%@ Page Language="C#" AutoEventWireup="true" CodeFile="exam.aspx.cs" Inherits="exam" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta content="text/html; charset=gb2312" http-equiv="Content-Type">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <meta name="GENERATOR" content="MSHTML 9.00.8112.16514">
    <title><%=ConfigurationManager.AppSettings["Title"] %></title>
    <link rel="stylesheet" type="text/css" href="<%=ConfigurationManager.AppSettings["IP"] %>/images/css.css">
    <link rel="stylesheet" type="text/css" href="<%=ConfigurationManager.AppSettings["IP"] %>/images/css300.css">
    <link rel="stylesheet" type="text/css" href="<%=ConfigurationManager.AppSettings["IP"] %>/images/ShowDialog.css">
    <script src="<%=ConfigurationManager.AppSettings["IP"] %>/fymadmin/js/jquery-1.9.1.min.js"></script>
    <%-- <script src="js/jquery.tools.min.js" type="text/javascript"></script>--%>

    <link href="<%=ConfigurationManager.AppSettings["IP"] %>/images/style2.css" rel="stylesheet" type="text/css" />
    <link href="<%=ConfigurationManager.AppSettings["IP"] %>/fymadmin/css/bootstrap.min.css" rel="stylesheet" />
    <script src="<%=ConfigurationManager.AppSettings["IP"] %>/fymadmin/js/bootstrap.min.js"></script>

    <style type="text/css">
        /* the overlayed element */
        .simple_overlay { /* must be initially hidden */
            display: none; /* place overlay on top of other elements */
            z-index: 10000; /* styling */
            background-color: #333;
            width: 700px;
            min-height: 200px;
            border: 1px solid #666; /* CSS3 styling for latest browsers */
            -moz-box-shadow: 0 0 90px 5px #000;
            -webkit-box-shadow: 0 0 90px #000;
        }
            /* close button positioned on upper right corner */ .simple_overlay .close {
                background-image: url(images/close.png);
                position: absolute;
                right: -15px;
                top: -15px;
                cursor: pointer;
                height: 35px;
                width: 35px;
            }

        .picbox img {
            cursor: pointer
        }

        .examall {
            border-left: 1px solid #b2f1f5;
            border-top: 1px solid #b2f1f5;
            width: 300px;
            height: 150px;
        }

            .examall li {
                border-bottom: 1px solid #b2f1f5;
                border-right: 1px solid #b2f1f5;
                float: left;
                text-align: center;
                width: 29px;
                height: 29px;
                overflow: hidden;
                line-height: 29px;
                cursor: pointer;
            }

            .examall .biaozhu {
                background-image: url(images/biaozhi_s.png);
                background-position: right top;
                background-repeat: no-repeat;
            }

        input[type="radio"]:checked {
            color: blue;
        }
        /*2018-01-08修改的代码2018-2018-2018-2018-2018-2018-2018-2018-2018-2018-2018-2018*/
        /*这里是PC样式*/
        .righttllllluu {
            font-size: 18px;
            line-height: 38px;
            color: rgb(23, 114, 197);
            text-align: center;
            border-bottom: 1px solid rgb(164, 201, 238);
        }

        .ling2 {
            padding: 10px 20px;
            font-size: 16px;
            line-height: 28px;
            color: rgb(76, 76, 76);
            border-bottom: 1px solid rgb(164, 201, 238);
            font-weight: bold;
        }

        .it {
            box-sizing: border-box;
            margin: 0 auto;
            width: 100%;
        }

            .it h3 {
                margin: 0;
            }

            .it li div textarea {
                width: 90%;
                display: block;
                margin: 0 auto;
                box-sizing: border-box;
                border: 1px solid #ccc !important;
                resize: none;
            }

            .it .i li div {
                width: 100%;
            }

            .it h3 p, .it h3 b {
                font-size: 16px !important;
            }

        .da2 {
            background: #fff;
            color: #222;
        }

        /*这里写手机样式*/
        @media screen and (min-width: 320px) and (max-width: 480px) {
            .main {
                width: 96% !important;
            }

            .righttllllluu {
                font-size: 16px;
                line-height: 28px;
                color: rgb(23, 114, 197);
                text-align: center;
                border-bottom: 1px solid rgb(164, 201, 238);
                padding: 5px 0;
            }

            .it li div label {
                display: block;
            }
        }

        #datiha {
            position: fixed;
            top: 150px;
            right: 5px;
        }
    </style>

    <script type="text/javascript">
        // var ks = 0;

        function jiaojuan() {

            setanswer2();

            $.ajax({
                type: "POST",
                url: "jiaojuan.ashx?action=jiaojuan&eid=<%=eid %>",//id是科目id，eid成绩结果id,
                data: $('#form1').serialize(),
                success: function (data) {
                    yz(data);
                }
            });
        }
        function yz(data) {
            var dd = data.split(",");

            if (dd[0] == "x") {
                alert("题目未答完不能提交！");
            }
            else if (dd[0] == "至少要答一题") {
                alert("至少要答一题");
            }
            else {
                //alert("您考" + dd[1] + "分！");
                alert("此科目您已考完，请进入下一科目！");
                window.location.href = "examlog.aspx";
            }
        }

        function jiaojuan2() {

            setanswer2();

            $.ajax({
                type: "POST",
                url: "jiaojuan.ashx?action=jiaojuan&i=1&eid=<%=eid %>",//id是科目id，eid成绩结果id,
                data: $('#form1').serialize(),
                success: function (data) {
                    alert("已提交,考试时间已到,考试结束！");
                    window.location.href = "examlog.aspx";
                }
            });
        }
    </script>

</head>
<body>
    <form id="form1" name="" action="exam.aspx?action=jiaojuan&id=<%= Request.QueryString["id"]%>&eid=<%=eid %>" method="post" onsubmit="return jiaojuan();">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin: 0px auto; background: #fff;">
            <tr height="55" style="background: #0e7bce;">
                <td class="td1" width="55%" style="color: #fff; font-size: 19px; padding-left: 8%;"><span><%=Session["s_realname"] %></span> 你好，欢迎登录在线考试系统！</td>
                <td class="td2" style="padding-right: 8%;"><a href="examlog.aspx" style="margin-right: 40px">返回首页</a></td>
            </tr>
        </table>



        <div class="main juanzidandu" style="position: relative; width: 60%; padding-top: 20px;">
            <div id="timer" style="color: red; font-size: 16px; text-align: center; position: fixed; right: 4%; line-height: 20px;"></div>
            <div>
                <div style="height: auto;" class="rightcon">
                    <div class="righttllllluu">
                        <%=shiJuanM %>
                    </div>
                    <div class="rightmain">
                        <input id="EOVal" value="0" type="hidden">
                        <div class="rightmainleft">
                            <%
                                var j = 0;
                                var w = 1;
                                var g = 0;
                                for (var i = 0; i < cList.Count; i++)
                                {
                            %>
                            <div class="ling2"><%=cList[i].name%></div>

                            <%  for (var k = 0; k < dt.Rows.Count; k++)
                                {
                                    
                                    var answer = dt.Rows[k]["t_type"].ToString();
                                    var type = "radio";
                                    if (answer == "2")
                                    {
                                        type = "checkbox";

                                    }%>

                            <%
                                if (cList[i].id == dt.Rows[k]["t_type"].ToString())
                                {
                            %>

                            <%
                                if (dt.Rows[k]["t_type"].ToString() == "1")
                                {
                                    tishu = w;
                            %>
                            <div class="it <%if (j % 2 == 1)
                                {%>bgrr<%} %>"
                                id="quest<%=dt.Rows[k]["id"] %>">


                                <%if (dt.Rows[k]["question"].ToString() != "")
                                    { %>
                                <div style="float: left">
                                    <h3 id="<%=w%>"><%=w%>.&nbsp;</h3>
                                </div>
                                <h3 style="margin-left: 10px"><%=dt.Rows[k]["question"] %></h3>

                                <%} %>

                                <%if (dt.Rows[k]["s_img"] != null && dt.Rows[k]["s_img"].ToString() != "")
                                    { %>
                                <img src="<%=dt.Rows[k]["s_img"] %>" rel="#dt<%=dt.Rows[k]["id"] %>">
                                <%} %>


                                <ul class="i">
                                    <%if (dt.Rows[k]["answerA"] != null && dt.Rows[k]["answerA"].ToString() != "")
                                        { %>
                                    <li>
                                        <div>
                                            <label>
                                                <input size="<%=w%>" type="<%=type %>" name="<%=dt.Rows[k]["id"] %>" class="counts" onclick="setanswer('<%=w%>')" value="A" <%if (list.Keys.Contains(dt.Rows[k]["id"].ToString()) && list[dt.Rows[k]["id"].ToString()].Contains("A"))
                                                    { %>
                                                    checked <%  } %> />
                                                A.&nbsp;<%=dt.Rows[k]["answerA"] %>
                                            </label>
                                        </div>
                                    </li>
                                    <%} %>


                                    <%if (dt.Rows[k]["answerB"] != null && dt.Rows[k]["answerB"].ToString() != "")
                                        { %>
                                    <li>
                                        <div>
                                            <label>
                                                <input size="<%=w%>" type="<%=type %>" name="<%=dt.Rows[k]["id"] %>" class="counts" onclick="setanswer('<%=w%>')" value="B" <%if (list.Keys.Contains(dt.Rows[k]["id"].ToString()) && list[dt.Rows[k]["id"].ToString()].Contains("B"))
                                                    { %>
                                                    checked <% } %> />B.&nbsp;<%=dt.Rows[k]["answerB"] %></label>
                                        </div>
                                    </li>
                                    <%} %>

                                    <%if (dt.Rows[k]["answerC"] != null && dt.Rows[k]["answerC"].ToString() != "")
                                        { %>
                                    <li>
                                        <div>
                                            <label>
                                                <input size="<%=w%>" type="<%=type %>" name="<%=dt.Rows[k]["id"] %>" class="counts" onclick="setanswer('<%=w%>')" value="C" <%if (list.Keys.Contains(dt.Rows[k]["id"].ToString()) && list[dt.Rows[k]["id"].ToString()].Contains("C"))
                                                    { %>
                                                    checked <% } %> />C.&nbsp;<%=dt.Rows[k]["answerC"] %></label>
                                        </div>
                                    </li>
                                    <%} %>

                                    <%if (dt.Rows[k]["answerD"] != null && dt.Rows[k]["answerD"].ToString() != "")
                                        { %>
                                    <li>
                                        <div>
                                            <label>
                                                <input size="<%=w%>" type="<%=type %>" name="<%=dt.Rows[k]["id"] %>" class="counts" onclick="setanswer('<%=w%>')" value="D" <%if (list.Keys.Contains(dt.Rows[k]["id"].ToString()) && list[dt.Rows[k]["id"].ToString()].Contains("D"))
                                                    { %>
                                                    checked <% } %> />D.&nbsp;<%=dt.Rows[k]["answerD"] %></label>
                                        </div>
                                    </li>
                                    <%} %>
                                    <%if (dt.Rows[k]["answerE"] != null && dt.Rows[k]["answerE"].ToString() != "")
                                        { %>
                                    <li>
                                        <div>
                                            <label>
                                                <input size="<%=w%>" type="<%=type %>" name="<%=dt.Rows[k]["id"] %>" class="counts" onclick="setanswer('<%=w%>')" value="E" <%if (list.Keys.Contains(dt.Rows[k]["id"].ToString()) && list[dt.Rows[k]["id"].ToString()].Contains("E"))
                                                    { %>
                                                    checked <% } %> />E.&nbsp;<%=dt.Rows[k]["answerE"] %></label>
                                        </div>
                                    </li>
                                    <%} %>
                                    <%if (dt.Rows[k]["answerF"] != null && dt.Rows[k]["answerF"].ToString() != "")
                                        { %>
                                    <li>
                                        <div>
                                            <label>
                                                <input size="<%=w%>" type="<%=type %>" name="<%=dt.Rows[k]["id"] %>" class="counts" onclick="setanswer('<%=w%>')" value="F" <%if (list.Keys.Contains(dt.Rows[k]["id"].ToString()) && list[dt.Rows[k]["id"].ToString()].Contains("F"))
                                                    { %>
                                                    checked <% } %> />F.&nbsp;<%=dt.Rows[k]["answerF"] %></label>
                                        </div>
                                    </li>
                                    <%} %>
                                </ul>
                                <%--  <div>我的答案：<font style="color: blue; font-size: 15px; font-weight: 700" class="daHan<%=k %>"></font></div>--%>
                            </div>
                            <%} %>


                            <%if (dt.Rows[k]["t_type"].ToString() == "2")
                                {
                                    tishu = w;

                            %>

                            <div class="it <%if (j % 2 == 1)
                                {%>bgrr<%} %>">

                                <%if (dt.Rows[k]["question"].ToString() != "")
                                    { %>
                                <div style="float: left">
                                    <h3 id="<%=w%>"><%=w%>.&nbsp;</h3>
                                </div>
                                <h3><%=dt.Rows[k]["question"] %> </h3>
                                <%} %>


                                <%if (dt.Rows[k]["s_img"] != null && dt.Rows[k]["s_img"].ToString() != "")
                                    { %>
                                <img src="<%=dt.Rows[k]["s_img"] %>" rel="#dt<%=dt.Rows[k]["id"] %>">
                                <%} %>

                                <ul class="i">
                                    <%if (dt.Rows[k]["answerA"] != null && dt.Rows[k]["answerA"].ToString() != "")
                                        { %>
                                    <li>
                                        <div>
                                            <label>
                                                <input size="<%=w%>" type="<%=type %>" name="<%=dt.Rows[k]["id"] %>" onclick="setanswer('<%=w%>')" value="A" <%if (list.Keys.Contains(dt.Rows[k]["id"].ToString()) && list[dt.Rows[k]["id"].ToString()].Contains("A"))
                                                    { %>
                                                    checked <% } %> />A.&nbsp;<%=dt.Rows[k]["answerA"] %></label>
                                        </div>
                                    </li>
                                    <%} %>


                                    <%if (dt.Rows[k]["answerB"] != null && dt.Rows[k]["answerB"].ToString() != "")
                                        { %>
                                    <li>
                                        <div>
                                            <label>
                                                <input size="<%=w%>" type="<%=type %>" name="<%=dt.Rows[k]["id"] %>" onclick="setanswer('<%=w%>')" value="B" <%if (list.Keys.Contains(dt.Rows[k]["id"].ToString()) && list[dt.Rows[k]["id"].ToString()].Contains("B"))
                                                    { %>
                                                    checked <% } %> />B.&nbsp;<%=dt.Rows[k]["answerB"] %></label>
                                        </div>
                                    </li>
                                    <%} %>

                                    <%if (dt.Rows[k]["answerC"] != null && dt.Rows[k]["answerC"].ToString() != "")
                                        { %>
                                    <li>
                                        <div>
                                            <label>
                                                <input size="<%=w%>" type="<%=type %>" name="<%=dt.Rows[k]["id"] %>" onclick="setanswer('<%=w%>')" value="C" <%if (list.Keys.Contains(dt.Rows[k]["id"].ToString()) && list[dt.Rows[k]["id"].ToString()].Contains("C"))
                                                    { %>
                                                    checked <% } %> />C.&nbsp;<%=dt.Rows[k]["answerC"] %></label>
                                        </div>
                                    </li>
                                    <%} %>

                                    <%if (dt.Rows[k]["answerD"] != null && dt.Rows[k]["answerD"].ToString() != "")
                                        { %>
                                    <li>
                                        <div>
                                            <label>
                                                <input size="<%=w%>" type="<%=type %>" name="<%=dt.Rows[k]["id"] %>" onclick="setanswer('<%=w%>')" value="D" <%if (list.Keys.Contains(dt.Rows[k]["id"].ToString()) && list[dt.Rows[k]["id"].ToString()].Contains("D"))
                                                    { %>
                                                    checked <% } %> />D.&nbsp;<%=dt.Rows[k]["answerD"] %></label>
                                        </div>
                                    </li>
                                    <%} %>
                                    <%if (dt.Rows[k]["answerE"] != null && dt.Rows[k]["answerE"].ToString() != "")
                                        { %>
                                    <li>
                                        <div>
                                            <label>
                                                <input size="<%=w%>" type="<%=type %>" name="<%=dt.Rows[k]["id"] %>" onclick="setanswer('<%=w%>')" value="E" <%if (list.Keys.Contains(dt.Rows[k]["id"].ToString()) && list[dt.Rows[k]["id"].ToString()].Contains("E"))
                                                    { %>
                                                    checked <% } %> />E.&nbsp;<%=dt.Rows[k]["answerE"] %></label>
                                        </div>
                                    </li>
                                    <%} %>
                                    <%if (dt.Rows[k]["answerF"] != null && dt.Rows[k]["answerF"].ToString() != "")
                                        { %>
                                    <li>
                                        <div>
                                            <label>
                                                <input size="<%=w%>" type="<%=type %>" name="<%=dt.Rows[k]["id"] %>" onclick="setanswer('<%=w%>')" value="F" <%if (list.Keys.Contains(dt.Rows[k]["id"].ToString()) && list[dt.Rows[k]["id"].ToString()].Contains("F"))
                                                    { %>
                                                    checked <% } %> />F.&nbsp;<%=dt.Rows[k]["answerF"] %></label>
                                        </div>
                                    </li>

                                    <%} %>
                                </ul>
                                <%--  <div>我的答案：<font style="color: blue; font-size: 15px; font-weight: 700" class="daHan<%=k %>"></font></div>--%>
                            </div>
                            <%} %>
                            <% 
                                if (dt.Rows[k]["t_type"].ToString() == "3")/*判断*/
                                {
                                    tishu = w;
                            %>
                            <div class="it <%if (j % 2 == 1)
                                {%>bgrr<%} %>">

                                <%if (dt.Rows[k]["question"].ToString() != "")
                                    { %>
                                <div style="float: left">
                                    <h3 id="<%=w%>"><%=w%>.&nbsp;</h3>
                                </div>
                                <h3><%=dt.Rows[k]["question"] %> </h3>
                                <%} %>

                                <%if (dt.Rows[k]["s_img"] != null && dt.Rows[k]["s_img"].ToString() != "")
                                    { %>
                                <img src="<%=dt.Rows[k]["s_img"] %>" rel="#dt<%=dt.Rows[k]["id"] %>">
                                <%} %>

                                <ul class="i">
                                    <li>
                                        <div>
                                            <label>
                                                <input size="<%=w%>" type="radio" onclick="setanswer('<%=w%>')" name="<%=dt.Rows[k]["id"] %>" value="A" <%if (list.Keys.Contains(dt.Rows[k]["id"].ToString()) && list[dt.Rows[k]["id"].ToString()].Contains("A"))
                                                    { %>
                                                    checked <% } %> />
                                                对
                                            </label>
                                        </div>
                                        <div>
                                            <label>
                                                <input size="<%=w%>" type="radio" onclick="setanswer('<%=w%>')" name="<%=dt.Rows[k]["id"] %>" value="B" <%if (list.Keys.Contains(dt.Rows[k]["id"].ToString()) && list[dt.Rows[k]["id"].ToString()].Contains("B"))
                                                    { %>
                                                    checked <% } %> />
                                                错
                                            </label>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <%}
                                if (dt.Rows[k]["t_type"].ToString() == "5")/*阅读理解*/
                                {

                                    //这张试卷，这道题的子题目
                                    dt2 = DbHelperSQL.GetList("select * from ks_questions where Parent_id=" + dt.Rows[k]["id"] + " order by id asc").Tables[0];

                            %>
                            <div class="it <%if (j % 2 == 1)
                                {%>bgrr<%} %>">

                                <%if (dt.Rows[k]["question"].ToString() != "")
                                    { %>
                                <h3><%=dt.Rows[k]["question"] %> </h3>
                                <%} %>


                                <%  for (var m = 0; m < dt2.Rows.Count; m++)
                                    {
                                        g = w + m;
                                %>
                                <%
                                    if (dt2.Rows[m]["t_type"].ToString() == "1")
                                    {
                                %>

                                <%if (dt2.Rows[m]["question"].ToString() != "")
                                    { %>
                                <div style="float: left">
                                    <h3 id="<%=w+m%>"><%=w + m%>.&nbsp;</h3>
                                </div>
                                <h3><%=dt2.Rows[m]["question"] %></h3>
                                <%} %>
                                <%if (dt2.Rows[m]["s_img"] != null && dt2.Rows[m]["s_img"].ToString() != "")
                                    { %>
                                <img src="<%=dt2.Rows[m]["s_img"] %>" rel="#dt<%=dt2.Rows[m]["id"] %>">
                                <%} %>

                                <ul class="i">
                                    <%if (dt2.Rows[m]["answerA"] != null && dt2.Rows[m]["answerA"].ToString() != "")
                                        { %>
                                    <li>
                                        <div>
                                            <%if (dt2.Rows[m]["question"].ToString() == "")
                                                { %>
                                            <h3 id="<%=w+m%>"><%=w + m%>.&nbsp;</h3>
                                            <%} %>
                                            <label>
                                                <input size="<%=w + m%>" type="<%=type %>" name="<%=dt2.Rows[m]["id"]%>" onclick="setanswer('<%=w + m%>')" value="A" <%if (list.Keys.Contains(dt2.Rows[m]["id"].ToString()) && list[dt2.Rows[m]["id"].ToString()].Contains("A"))
                                                    { %>
                                                    checked <% } %> />
                                                A.&nbsp;<%=dt2.Rows[m]["answerA"] %>
                                            </label>
                                        </div>
                                        <%} %>


                                        <%if (dt2.Rows[m]["answerB"] != null && dt2.Rows[m]["answerB"].ToString() != "")
                                            { %>

                                        <div>
                                            <label>
                                                <input size="<%=w + m%>" type="<%=type %>" name="<%=dt2.Rows[m]["id"] %>" onclick="setanswer('<%=w + m%>')" value="B" <%if (list.Keys.Contains(dt2.Rows[m]["id"].ToString()) && list[dt2.Rows[m]["id"].ToString()].Contains("B"))
                                                    { %>
                                                    checked <% } %> />
                                                B.&nbsp;<%=dt2.Rows[m]["answerB"] %>
                                            </label>
                                        </div>
                                        <%} %>

                                        <%if (dt2.Rows[m]["answerC"] != null && dt2.Rows[m]["answerC"].ToString() != "")
                                            { %>

                                        <div>
                                            <label>
                                                <input size="<%=w + m%>" type="<%=type %>" name="<%=dt2.Rows[m]["id"] %>" onclick="setanswer('<%=w + m%>')" value="C" <%if (list.Keys.Contains(dt2.Rows[m]["id"].ToString()) && list[dt2.Rows[m]["id"].ToString()].Contains("C"))
                                                    { %>
                                                    checked <% } %> />
                                                C.&nbsp;<%=dt2.Rows[m]["answerC"] %>
                                            </label>
                                        </div>
                                        <%} %>

                                        <%if (dt2.Rows[m]["answerD"] != null && dt2.Rows[m]["answerD"].ToString() != "")
                                            { %>

                                        <div>
                                            <label>
                                                <input size="<%=w + m%>" type="<%=type %>" name="<%=dt2.Rows[m]["id"] %>" onclick="setanswer('<%=w + m%>')" value="D" <%if (list.Keys.Contains(dt2.Rows[m]["id"].ToString()) && list[dt2.Rows[m]["id"].ToString()].Contains("D"))
                                                    { %>
                                                    checked <% } %> />
                                                D.&nbsp;<%=dt2.Rows[m]["answerD"] %>
                                            </label>
                                        </div>
                                        <%} %>
                                        <%if (dt2.Rows[m]["answerE"] != null && dt2.Rows[m]["answerE"].ToString() != "")
                                            { %>

                                        <div>
                                            <label>
                                                <input size="<%=w + m%>" type="<%=type %>" name="<%=dt2.Rows[m]["id"] %>" onclick="setanswer('<%=w + m%>')" value="E" <%if (list.Keys.Contains(dt2.Rows[m]["id"].ToString()) && list[dt2.Rows[m]["id"].ToString()].Contains("E"))
                                                    { %>
                                                    checked <% } %> />
                                                E.&nbsp;<%=dt2.Rows[m]["answerE"] %>
                                            </label>
                                        </div>
                                        <%} %>
                                        <% dt2.Rows[k]["answerF"].ToString(); %>
                                        <%if (dt2.Rows[k]["answerF"] != null && dt2.Rows[k]["answerF"].ToString() != "")
                                            { %>

                                        <div>
                                            <label>
                                                <input size="<%=w + m%>" type="<%=type %>" name="<%=dt2.Rows[m]["id"] %>" onclick="setanswer('<%=w + m%>')" value="F" <%if (list.Keys.Contains(dt2.Rows[m]["id"].ToString()) && list[dt2.Rows[m]["id"].ToString()].Contains("F"))
                                                    { %>
                                                    checked <% } %> />
                                                F.&nbsp;<%=dt2.Rows[m]["answerF"] %>
                                            </label>
                                        </div>
                                    </li>

                                    <%} %>
                                </ul>

                                <%} %>


                                <%if (dt2.Rows[m]["t_type"].ToString() == "2")
                                    {
                                        tishu = w + m;

                                %>



                                <%if (dt2.Rows[m]["question"].ToString() != "")
                                    { %>
                                <div style="float: left">
                                    <h3 id="<%=w+m%>"><%=w + m%>.&nbsp;</h3>
                                </div>
                                <h3><%=dt2.Rows[m]["question"] %></h3>
                                <%} %>

                                <%if (dt2.Rows[m]["s_img"] != null && dt2.Rows[m]["s_img"].ToString() != "")
                                    { %>
                                <img src="<%=dt2.Rows[m]["s_img"] %>" rel="#dt<%=dt2.Rows[m]["id"] %>">
                                <%} %>


                                <ul class="i">
                                    <%if (dt2.Rows[m]["answerA"] != null && dt2.Rows[m]["answerA"].ToString() != "")
                                        { %>
                                    <li>
                                        <div>
                                            <label>
                                                <%if (dt2.Rows[m]["question"].ToString() == "")
                                                    { %>
                                                <h3 id="<%=w+m%>"><%=w + m%>.&nbsp;</h3>
                                                <%} %>
                                                <input size="<%=w + m%>" type="checkbox" name="<%=dt2.Rows[m]["id"] %>" onclick="setanswer('<%=w + m%>')" value="A" <%if (list.Keys.Contains(dt2.Rows[m]["id"].ToString()) && list[dt2.Rows[m]["id"].ToString()].Contains("A"))
                                                    { %>
                                                    checked <% } %> />
                                                A.&nbsp;<%=dt2.Rows[m]["answerA"] %>
                                            </label>
                                        </div>
                                        <%} %>


                                        <%if (dt2.Rows[m]["answerB"] != null && dt2.Rows[m]["answerB"].ToString() != "")
                                            { %>

                                        <div>
                                            <label>
                                                <input size="<%=w + m%>" type="checkbox" name="<%=dt2.Rows[m]["id"] %>" onclick="setanswer('<%=w + m%>')" value="B" <%if (list.Keys.Contains(dt2.Rows[m]["id"].ToString()) && list[dt2.Rows[m]["id"].ToString()].Contains("B"))
                                                    { %>
                                                    checked <% } %> />
                                                B.&nbsp;<%=dt2.Rows[m]["answerB"]%>
                                            </label>
                                        </div>
                                        <%} %>

                                        <%if (dt2.Rows[m]["answerC"] != null && dt2.Rows[m]["answerC"].ToString() != "")
                                            { %>

                                        <div>
                                            <label>
                                                <input size="<%=w + m%>" type="checkbox" name="<%=dt2.Rows[m]["id"] %>" onclick="setanswer('<%=w + m%>')" value="C" <%if (list.Keys.Contains(dt2.Rows[m]["id"].ToString()) && list[dt2.Rows[m]["id"].ToString()].Contains("C"))
                                                    { %>
                                                    checked <% } %> />
                                                C.&nbsp;<%=dt2.Rows[m]["answerC"]%>
                                            </label>
                                        </div>
                                        <%} %>

                                        <%if (dt2.Rows[m]["answerD"] != null && dt2.Rows[m]["answerD"].ToString() != "")
                                            { %>

                                        <div>
                                            <label>
                                                <input size="<%=w + m%>" type="checkbox" name="<%=dt2.Rows[m]["id"] %>" onclick="setanswer('<%=w + m%>')" value="D" <%if (list.Keys.Contains(dt2.Rows[m]["id"].ToString()) && list[dt2.Rows[m]["id"].ToString()].Contains("D"))
                                                    { %>
                                                    checked <% } %> />
                                                D.&nbsp;<%=dt2.Rows[m]["answerD"]%>
                                            </label>
                                        </div>
                                        <%} %>
                                        <%if (dt2.Rows[m]["answerE"] != null && dt2.Rows[m]["answerE"].ToString() != "")
                                            { %>

                                        <div>
                                            <label>
                                                <input size="<%=w + m%>" type="checkbox" name="<%=dt2.Rows[m]["id"] %>" onclick="setanswer('<%=w + m%>')" value="E" <%if (list.Keys.Contains(dt2.Rows[m]["id"].ToString()) && list[dt2.Rows[m]["id"].ToString()].Contains("E"))
                                                    { %>
                                                    checked <% } %> />
                                                E.&nbsp;<%=dt2.Rows[m]["answerE"]%>
                                            </label>
                                        </div>
                                        <%} %>
                                        <%if (dt2.Rows[m]["answerF"] != null && dt2.Rows[m]["answerF"].ToString() != "")
                                            { %>

                                        <div>
                                            <label>
                                                <input size="<%=w + m%>" type="checkbox" name="<%=dt2.Rows[m]["id"] %>" onclick="setanswer('<%=w + m%>')" value="F" <%if (list.Keys.Contains(dt2.Rows[m]["id"].ToString()) && list[dt2.Rows[m]["id"].ToString()].Contains("F"))
                                                    { %>
                                                    checked <% } %> />
                                                F.&nbsp;<%=dt2.Rows[m]["answerF"] %>
                                            </label>
                                        </div>
                                    </li>

                                    <%} %>
                                </ul>

                                <%} %>


                                <% 
                                    if (dt2.Rows[m]["t_type"].ToString() == "3")/*判断*/
                                    {
                                %>


                                <%if (dt2.Rows[m]["question"].ToString() != "")
                                    { %>
                                <div style="float: left">
                                    <h3><%=w + m%>.&nbsp;</h3>
                                </div>
                                <h3 id="<%=w+m%>"><%=dt2.Rows[m]["question"] %></h3>
                                <%} %>

                                <%if (dt2.Rows[m]["s_img"] != null && dt2.Rows[m]["s_img"].ToString() != "")
                                    { %>
                                <img src="<%=dt2.Rows[m]["s_img"] %>" rel="#dt<%=dt2.Rows[m]["id"] %>">
                                <%} %>

                                <ul class="i">
                                    <li>
                                        <div>
                                            <label>
                                                <%if (dt2.Rows[m]["question"].ToString() == "")
                                                    { %>
                                                <h3 id="<%=w+m%>"><%=w + m%>.&nbsp;</h3>
                                                <%} %>
                                                <input size="<%=w + m%>" type="radio" onclick="setanswer('<%=w + m%>')" name="<%=dt2.Rows[m]["id"] %>" value="A" <%if (list.Keys.Contains(dt2.Rows[m]["id"].ToString()) && list[dt2.Rows[m]["id"].ToString()].Contains("A"))
                                                    { %>
                                                    checked <% } %> />
                                                对</label>
                                        </div>
                                        <div>
                                            <label>
                                                <input size="<%=w + m%>" type="radio" onclick="setanswer('<%=w + m%>')" name="<%=dt2.Rows[m]["id"] %>" value="B" <%if (list.Keys.Contains(dt2.Rows[m]["id"].ToString()) && list[dt2.Rows[m]["id"].ToString()].Contains("B"))
                                                    { %>
                                                    checked <% } %> />
                                                错</label>
                                        </div>
                                    </li>
                                </ul>

                                <%} %>





                                <%}%>
                            </div>
                            <%w = g;
                                } %>

                            <% j++; w++;
                                        }

                                    }

                                }

                                //if (dt2==null) {
                                //    tishu = dt.Rows.Count + 0- int.Parse(Setup.Rows[0]["yedu"].ToString());
                                //}
                                //else { tishu = dt.Rows.Count + dt2.Rows.Count - int.Parse(Setup.Rows[0]["yedu"].ToString()); }



                            %>
                            <div class="panel panel-info" style="width: 18%" id="datiha">
                                <div class="panel-heading">
                                    <h3 class="panel-title">答题卡</h3>
                                </div>
                                <div class="panel-body" style="height: auto">
                                    <div id="datiha3">
                                    </div>
                                    <br />
                                </div>
                                <div style="overflow: hidden; background: #E8F1F9; padding: 10px 0; width: 100%">
                                    <input value="已答" type="button" style="width: 30px; background-color: #2f93fc; margin-left: 20px; border-radius: 3px; height: 26px; color: #fff; font-size: 12px" />
                                    <input value="未答" type="button" style="width: 30px; background-color: white; margin-left: 20px; border-radius: 3px; height: 26px; font-size: 12px" />
                                    <input value="交卷" type="button" style="width: 30px; background-color: #fd460c; margin-left: 20px; border-radius: 3px; height: 26px; font-size: 12px" onclick="window.location.hash = '#ti_jiao'" />

                                </div>
                            </div>

                            <style>
                                .da2 {
                                    width: 20px;
                                    margin-top: 4px;
                                    margin-left: 4px;
                                    color: #222;
                                    border: 1px solid #dcdcdc;
                                    border-radius: 3px;
                                    height: 25px !important;
                                    line-height: 30px;
                                }
                            </style>


                            <script type="text/javascript">
                                //$(document).ready(function () {
                                //    $("img[rel]").overlay();
                                //});
                            </script>

                            <div style="margin-top: 0px;" id="defen" class="defen"></div>
                            <a name="Bottom"></a>
                            <div style="padding: 18px; background-color: rgb(247, 251, 255); text-align: center" id="ti_jiao">

                                <input style="cursor: pointer; background-color: #fd460c;" class="inputto" type="button" value="提交试卷" onclick="jiaojuan()" />
                            </div>
                        </div>
                        <div class="rightmainright"></div>
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="clear"></div>
            </div>
        </div>
        <div class="clear"></div>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tab7">
            <tr height="75">
                <td align="center" valign="middle"><a href="examlog.aspx"><span>在线考试</span></a>   |    COPYIGHT 2018-2019 江西省高等学校师资培训中心</td>
            </tr>
        </table>


    </form>
</body>
<script type="text/javascript">

    var maxtime =<%=haoshitime%>; //一个小时，按秒计算，自己调整!  
    function CountDown() {
        if (maxtime > 1) {
            minutes = Math.floor(maxtime / 60);
            seconds = Math.floor(maxtime % 60);
            msg = "距考试结束还有<br/>" + minutes + "分" + seconds + "秒";
            document.all["timer"].innerHTML = msg;
            if (maxtime == 3 * 60) alert('注意，还有3分钟!');

            maxtime = maxtime - 1;


            setTimeout("CountDown()", 1000);
        }
        else {
            //clearInterval(timer);  
            //alert("时间到，结束!");
            jiaojuan2();
        }
    }
    setTimeout("CountDown()", 1000);
</script>


<script type="text/javascript">
    $("input[type='radio']").click(function () {
        if (this.checked) { $(this).next().css('color', 'blue') }
    });
    $("input[type='checkbox']").click(function () {
        if (this.checked) { $(this).next().css('color', 'blue') }
    });



    //做题时绑定答题卡
    function setanswer(a) {//a 题目编号，


        //$("#id_" + a).attr("style", "background-color:#2f93fc");

        var radio = $("input[size=\"" + a + "\"]");

        var dc = 0;//定义接收每题选中的次数
        for (var i = 0; i < radio.length; i++) {

            if (radio[i].checked == true) {
                dc += 1;
            }

        }

        if (dc > 0) {
            $("#id_" + a).attr("style", "background-color:#2f93fc");
        }
        else {
            $("#id_" + a).attr("style", "");
        }

    }




    function onTopClick(s) {

        window.location.hash = "#" + s;
    }


    
    function setanswer2() {

        $.ajax({
            async: false,
            type: "POST",
            url: "jiludaan.ashx?eid=<%=eid %>",//id是科目id，eid成绩结果id,
            data: $('#form1').serialize(),
            success: function (data) {
                //yz(data);
            }
        });

        $.ajax({
            type: "POST",
            url: "haoshitime.ashx",
            data: { haoshitime: maxtime },
            success: function (data) {

            }
        });

    }

    //切换网页
    // window.onblur = function () {
    //     setanswer2();
    // }


    //关闭、刷新时
    window.onbeforeunload = function () {
        setanswer2();
    }

    window.setInterval(setanswer2, Math.floor(Math.random(100-80+1)*(80)*10000)); 



    //加载完成后循环答题卡
    window.onload = function () {

        var text = "";
        for (var s = 1; s <= <%=tishu%>; s++) {

            text += "<input value=\"" + s + "\" id=\"id_" + s + "\" onclick=\"onTopClick(" + s + ")\" class=\"da2\" type=\"button\"  />";

        }

        $("#datiha3").append(text);



        var radio = $(":radio");

        for (var i = 0; i < radio.length; i++) {

            var dc = radio[i];
            if (radio[i].checked == true) {

                var selectvalue = "#id_" + radio[i].size;
                $(selectvalue).attr("style", "background-color:#2f93fc", "color:#fff");


            }

        }


        var checkbox = $(":checkbox");

        for (var i = 0; i < checkbox.length; i++) {

            if (checkbox[i].checked == true) {

                var selectvalue = "#id_" + checkbox[i].size;
                $(selectvalue).attr("style", "background-color:#2f93fc", "color:#fff");


            }

        }
    }




</script>

<script language="Javascript">  
    document.oncontextmenu = new Function("event.returnValue=false");
    document.onselectstart = new Function("event.returnValue=false");  
</script>




</html>
