<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<head>
    <html xmlns="http://www.w3.org/1999/xhtml">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <script src="<%=ConfigurationManager.AppSettings["IP"] %>/fymadmin/js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <link href="<%=ConfigurationManager.AppSettings["IP"] %>/images/style.css" rel="stylesheet" type="text/css" />
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
                url: "denglu.ashx",
                data: $("#form1").serialize(),
                success: function (msg) {
                    yz(msg);
                }
            });
        }
        function yz(msg) {
            if (msg != "1")
                alert(msg);
            else

                window.location.href = "examlog.aspx";
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


            <!--<div class="main">

                <div class="main1">
                    <div class="title">江西省高校教师岗前培训在线考试</div>
                    <div class="main2">
                        <div class="main3">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="100" class="a1">手机号：</td>
                                    <td>
                                        <input type="text" class="a2" id="phone" name="phone" size="20" maxlength="20" onfocus="this.style.borderColor='#239fe3'" onblur="this.style.borderColor='#dcdcdc'" placeholder="请填写手机号码" /></td>
                                </tr>
                                <tr>
                                    <td width="100" class="a1">密码：</td>
                                    <td>
                                        <input type="password" class="a2" id="s_password" name="s_password" size="20" maxlength="20" onfocus="this.style.borderColor='#239fe3'" onblur="this.style.borderColor='#dcdcdc'" placeholder="请填写密码" /></td>
                                </tr>
                                                    
                                <tr>
                                    <td width="100"></td>
                                    <td>
                                        <input type="button" value="登录" id="ttit" onclick="Alogin()" class="tj" />  <input type="button" value="注册" id="ttit" onclick="Register()" class="tj" /></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>-->
            
        
            <div class="reg-box">
            <img src="images/login1.png" />
            <div class="reg-right">
            <div class="reg-title">江西省高校教师岗前培训在线考试</div>
            <div class="main3" style="padding-top:5px;">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                 <tr>
                                    <td width="100" class="a1">身份证：</td>
                                    <td>
                                        <input type="text" class="a2" id="phone" name="phone" size="20" maxlength="20" onfocus="this.style.borderColor='#239fe3'" onblur="this.style.borderColor='#dcdcdc'" placeholder="请填写身份证号码" /></td>
                                </tr>
                                <tr>
                                    <td width="100" class="a1">密码：</td>
                                    <td>
                                        <input type="password" class="a2" id="s_password" name="s_password" size="20" maxlength="20" onfocus="this.style.borderColor='#239fe3'" onblur="this.style.borderColor='#dcdcdc'" placeholder="请填写密码" /></td>
                                </tr>
                                                    
                                <tr>
                                    <td width="100"></td>
                                    <td>
                                        <input type="button" value="登录" id="ttit" onclick="Alogin()" class="tj" />  <input type="button" value="注册" id="ttit" onclick="Register()" class="tj" style=" background:#FD5622" /></td>
                                </tr>
                            </table>
                        </div>
                        
<div style="font-size:16px; line-height:28px; padding:20px 0 0 0; width:88%; margin:0 auto; color:#686767">
考试注意事项：<br />
第一步：请各位考生先注册，注册时请认真填写个人信息<br />
第二步：注册完成之后，采用个人身份证号+密码进行登陆<br />
第三步：登陆成功之后，请选择四门科目考试其中任意一门科<br>目开始进行考试，四门课考试时间总共180分钟。
本场考试为全闭卷考试，考生在答完每一门科目的试题后务必点击"提交试卷"，提交试卷后，该门科目将不再显示。
</div>
            </div>
            </div>


        </form>
    </div>
</body>
</html>
