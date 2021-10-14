<%@ Page Language="C#" AutoEventWireup="true" CodeFile="updateUser.aspx.cs" Inherits="_Default" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<head>
    <html xmlns="http://www.w3.org/1999/xhtml">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
   <meta http-equiv="X-UA-Compatible" content="IE=8" />
    <script src="js/json2.js"></script>
    <script src="fymadmin/js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <link href="images/style.css" rel="stylesheet" type="text/css" />
    <title><%=ConfigurationManager.AppSettings["Title"] %></title>


    <script type="text/javascript">
        function onLoadList() {
            //$("#yzm").attr("src", "fymadmin/yanZhenMa.ashx?y=" + new Date());
        }
        function Alogin() {

            //if ($("#u_realname").val().length < 2) {
            //    alert("姓名长度错误");
            //    $("#u_realname").focus();
            //    return;
            //}

            //if ($("#u_name").val().length <18) {
            //    alert("身份证长度错误");
            //    $("#u_name").focus();
            //    return;
            //}
            //if ($("#password").val().length < 2) {
            //    alert("密码长度错误");
            //    $("#password").focus();
            //    return;
            //}
            //if ($("#phone").val().length < 11) {
            //    alert("手机号长度错误");
            //    $("#phone").focus();
            //    return;
            //}
            //if ($("#code").val().length != 5) {
            //    alert("验证码长度错误");
            //    $("#code").focus();
            //    return;
            //}


            $.ajax({
                type: "POST",
                url: "updateUser.ashx",
                data: $("#form1").serialize(),
                success: function (msg) {
                    var d = JSON.parse(msg);
                    if (d.mes != "ok") {
                        alert(d.mes);
                    }
                    else {

                        alert("修改成功,请重新登录");
                        window.location.href = "Default.aspx";
                    }


                }
            });
        }


        function Register() {
            window.location.href = "Register.aspx";
        }

        if (self != top) { top.location = self.location; }


        document.onkeydown = function (event) {
            var e = event || window.event || arguments.callee.caller.arguments[0];

            if (e && e.keyCode == 13) { // enter 键
                Alogin();
            }
        };


    </script>
</head>
<body onload="onLoadList()">
    <div class="content">
        <form id="form1" runat="server">
            <div class="reg-box">
                <img src="images/login1.png" />
                <div class="reg-right">
                    <div class="reg-title">江西省高校教师岗前培训在线考试</div>
                    <div class="main3">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td width="100" class="a1">姓名：</td>
                                <td>
                                    <input type="text" class="a2" id="s_realname" name="s_realname" value="<%=fu.s_realname %>" size="20" maxlength="20" onfocus="this.style.borderColor='#239fe3'" onblur="this.style.borderColor='#dcdcdc'" placeholder="请填写真实姓名" /></td>
                            </tr>
                            <tr>
                                <td width="100" class="a1">性别：</td>
                                <td>
                                    <select name="sex" id="sex" class="a2">
                                        <option value="1">男</option>
                                        <option value="0">女</option>
                                    </select>

                                </td>
                            </tr>
                            <tr>
                                <td width="100" class="a1">身份证：</td>
                                <td>
                                    <input type="text" class="a2" id="y_carId" name="y_carId" value="<%=fu.y_carId %>" size="20" maxlength="20" onfocus="this.style.borderColor='#239fe3'" onblur="this.style.borderColor='#dcdcdc'" placeholder="请填写身份证号码" /></td>
                            </tr>
                            <tr>
                                <td width="100" class="a1">手机号：</td>
                                <td>
                                    <input type="text" class="a2" id="phone" name="phone" value="<%=fu.s_phone%>" size="20" maxlength="20" onfocus="this.style.borderColor='#239fe3'" onblur="this.style.borderColor='#dcdcdc'" placeholder="请填写手机号码" /></td>
                            </tr>
                            <tr>
                                <td width="100" class="a1">密码：</td>
                                <td>
                                    <input type="text" class="a2" id="pwd" value="<%=fu.s_password %>" name="pwd" size="20" maxlength="20" onfocus="this.style.borderColor='#239fe3'" onblur="this.style.borderColor='#dcdcdc'" placeholder="请填写六位数字密码" /></td>
                            </tr>
                            <tr>
                                <td width="100" class="a1">确认密码：</td>
                                <td>
                                    <input type="text" class="a2" id="pwd2" name="pwd2" value="<%=fu.s_password %>" size="20" maxlength="20" onfocus="this.style.borderColor='#239fe3'" onblur="this.style.borderColor='#dcdcdc'" placeholder="请再次输入密码" /></td>
                            </tr>


                            <tr>
                                <td width="100" class="a1">考点：</td>
                                <td>

                                    <select name="kd" class="a2" id="kd">
                                        <%--  <option value="">请选择</option>--%>
                                        <%
                                            var kdlist = DbHelperSQL.Query("select * from  S_TestingCentre   order by id ").Tables[0];
                                            for (var i = 0; i < kdlist.Rows.Count; i++)
                                            {%>
                                        <option value="<%=kdlist.Rows[i]["id"] %>"><%=kdlist.Rows[i]["y_name"] %></option>
                                        <%} %>
                                    </select>




                                </td>
                            </tr>

                            <tr>
                                <td width="100" class="a1">学校：</td>
                                <td>

                                    <select name="schoolId33333" id="schoolId2" onchange=" school()" class="a2" style="width: 120px; float: left; margin-right: 10px;">
                                        <option value="">请选择</option>
                                        <%
                                            var type2 = DbHelperSQL.Query("select * from  S_School where s_level=1  order by y_order ").Tables[0];
                                            for (var i = 0; i < type2.Rows.Count; i++)
                                            {%>
                                        <option value="<%=type2.Rows[i]["id"] %>"><%=type2.Rows[i]["y_schoolName"] %></option>
                                        <%} %>
                                    </select>

                                    <select name="schoolId" id="schoolId" class="a2" style="width: 200px; float: left;">
                                    </select>

                                </td>
                            </tr>




                            <tr>
                                <td width="100"></td>
                                <td>
                                    <input type="button" value="修改" id="ttit" onclick="Alogin()" class="tj" />
                                    <a href="/examlog.aspx" class="tj" style="background: none; border: 1px solid #2f93fc; color: #2f93fc; display: block; float: right; line-height: 36px; height: 36px; margin-right: 70px;">返回</a>

                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>

        </form>
    </div>
</body>
<script>


    $('#sex').val('<%=fu.s_sex%>');

    $('#kd').val('<%=fu.s_kdId%>');

    $('#schoolId2').val('<%=dequ%>');
    school();





    function school() {




        var dequ = $('#schoolId2').val();

        $.ajax({
            type: "POST",
            url: "xialadequ.ashx",
            data: { dequ: dequ },
            success: function (data) {
                $("#schoolId").empty();
                //alert(JSON.parse(data));
                var list = JSON.parse(data);


                if (list.length != "" && list.length != null) {
                    for (var i = 0; i < list.length; i++) {
                        $('#schoolId').append("<option value=" + list[i].id + ">" + list[i].name + "</option>");
                    }
                    $('#schoolId').val('<%=fu.y_schoolId%>');
                } else {
                    classNext.append("<option value=\" \">---无---</option>");
                }


                //if (d.mes != "ok") {
                //    alert(d.mes);
                //}
                //else {

                //    alert("注册成功");
                //    //window.location.href = "Default.aspx";
                //}


            }
        });
    }

    window.onload = function () {

    }
</script>
</html>
