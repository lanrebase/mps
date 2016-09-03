<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>会员积分管理系统—用户登录</title>
<link href="<%=path%>/css/login.css" rel="stylesheet" type="text/css" />
<!--[if IE 6]>
    <script src="js/DD_belatedPNG.js"></script>
    <script>
    DD_belatedPNG.fix('*');
    </script>
    <![endif]-->
<script type="text/javascript">
function toHome(){
	window.location.href = "<%=path%>/home.do";
}
</script>    
</head>
<body>
	<div class="login">
		<div class="userlogin">
			<span class="logo"></span>
			<div class="loginbar">
				<ul>
					<li><label>用户</label><span class="user"><input name=""
							type="text" class="logininput" /></span></li>
					<li><label>密码</label><span class="password"> <input
							name="input" type="password" class="logininput" />
					</span></li>
					<li><label>&nbsp;</label><span><input name=""
							type="button" value="登录" class="loginbtn"
							onclick="toHome()" /><input
							name="" type="button" value="注册" class="loginbtn" /></span></li>
				</ul>
			</div>
			<div class="logindown"></div>
			<div class="systeminfo">
				<span>CopyRight2011&nbsp;&nbsp;版权所有&nbsp;&nbsp;酷云信息&nbsp;&nbsp;&nbsp;Kuyun.com</span>
			</div>
		</div>
	</div>
</body>
</html>

