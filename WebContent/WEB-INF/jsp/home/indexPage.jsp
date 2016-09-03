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
<title>会员积分管理系统</title>
<link href="<%=path %>/css/index.css" rel="stylesheet" type="text/css" />
<link href="<%=path %>/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path %>/js/jquery-1.4.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/index.js"></script>
<script type="text/javascript" src="<%=path %>/js/layout.js"></script>
<script type="text/javascript" src="<%=path %>/js/layer.js"></script>
<!-- 
	弹出层方法 layerAction('要弹出层的id');
    关闭层方法 closeAction();
 -->

<!--[if IE 6]>
    <script src="js/DD_belatedPNG.js"></script>
    <script>
    DD_belatedPNG.fix('*');
    </script>
    <![endif]--> 
</head>
<body>
<div class="header">
  <div class="headtop">
    <div class="logo"  onclick="layerAction('add')"><img src="images/logo.png" alt="系统名字" /></div>
    <div class="shutdown" onclick="layerAction('quit')"><img src="images/shutdown.png" alt="退出" /></div>
  </div>
  <div class="menu">
    <div class="mleft"><img src="images/menuleft.gif" alt="" /></div>
    <ul class="fleft">
    <span><img src="images/user.gif" alt="用户" /></span>
	欢迎您，<label>admin</label>&nbsp;&nbsp;&nbsp;&nbsp;
    </ul>
    <div class="mright"><img src="images/menuright.gif" alt="" /></div>
    <ul class="mlistleft">
      <li><span><img src="images/m7.gif" alt="时间" /></span>
        <label>日期：2016年08月27日 星期六</label>
      </li>
    </ul>
  </div>
</div>
<!-- 主要部分 -->
<div class="main">
	<div class="left">
	<div class="lefttitle"></div>
    	<!-- 左侧菜单 -->
    	<ul class="leftlink">
		<li>
        <h3 class="linktitle linkAfter"><span><img src="images/leftlist1.gif" alt="关闭" /></span>会员账户管理</h3>
       		<ol class="linkOl" style="display:block">
            <li class="tabLink" id="1" tabName="会员账户查询" url="<%=path %>/member/memberPage.do"><span><img src="images/leftlist3.gif" /></span>会员账户查询</li>
         	</ol>
        </li>
        <li>
        	<h3 class="linktitle"><span><img src="images/leftlist2.gif" alt="打开" /></span>积分事件管理</h3>
        	<ol class="linkOl" style="display:block">
            <li class="tabLink" id="2" tabName="事件源设置" url="<%=path %>/event/getEventList.do" ><span><img src="images/leftlist3.gif" /></span>事件源设置</li>
          	</ol>
        </li>
        <li>
        	<h3 class="linktitle"><span><img src="images/leftlist2.gif" alt="打开" /></span>会员积分管理</h3>
        </li>
        <li>
        	<h3 class="linktitle"><span><img src="images/leftlist2.gif" alt="打开" /></span>会员等级管理</h3>
        	<ol class="linkOl" style="display:block">
            <li class="tabLink" id="4" tabName="等级规则设置" url="<%=path %>/grade/gradePage.do" >
            <span><img src="images/leftlist3.gif" /></span>等级规则设置
            </li>
            <li class="tabLink" id="5" tabName="手工等级设置" url="" >
            <span><img src="images/leftlist3.gif" /></span>手工等级设置
            </li>
            <li class="tabLink" id="6" tabName="等级变更日志" url="" >
            <span><img src="images/leftlist3.gif" /></span>等级变更日志
            </li>
            </ol>
        </li>
        <li>
        	<h3 class="linktitle"><span><img src="images/leftlist2.gif" alt="打开" /></span>会员评价管理</h3>
        </li>
    	</ul>
    <div class="leftinfo"></div>
    </div>
    <!-- 缩进按钮 -->
    <div class="qj_oc">
    	<a href="#" id="qjoc_button" ></a>
    </div>
    <!-- 右列 -->
    <div class="right">
    <div id="tab_frame">
    <ul id="tab">
    <li class="tab_after">
    	<a href="#" class="tabButn">欢迎页</a>
		<iframe name="desktop" src="welcome.html" width="100%" height="300px"   frameborder="0"></iframe>        
   	</li>
   </ul>
   </div>
    <ol class="rightan">
        <li id="goLeft" ></li>
        <li id="goRight" ></li>
        <li id="allClose"><img src="images/r03.gif" alt="关闭" /></li>
    </ol>
    
    </div>
</div>    
<!-- 底部 -->
<div class="footer">
    <span class="fright"><label>Call Center V2.0</label> 2006-2010</span>
</div>

<!-- 弹出层 -->
<div id="cBg" style="display:none;"></div>
<!-- 退出系统 -->
<div class="quit commonLayer" id="quit">
    	<div class="ttitle">退出系统</div>
        <div class="qinfo">
        <span><img src="images/quit.gif" alt="退出" /></span>
        <p>你确定要退出系统吗？<br />确定请选“是”，取消请点击“否”</p>
        </div>
        <div class="qbtn">
        <input name="" type="button" value="是" onclick="closeAction()"  class="tbtn" /> &nbsp;&nbsp;&nbsp;
        <input name="" type="button" value="否" onclick="closeAction()" class="tbtn"/></div>
</div>

<!-- 添加页 -->
<div class="mdl commonLayer" id="add">
    
    <table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="mtop"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="mtl">&nbsp;</td>
        <td valign="bottom" class="mtc"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="35" style="padding-left:10px; color:#eef1f2;">参数配置</td>
            <td>&nbsp;</td>
            <td style="text-align:right;"><img src="images/gb1.gif" width="20" height="20" onclick="closeAction()"></td>
          </tr>
        </table></td>
        <td class="mtr">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="mcl">&nbsp;</td>
        <td  class="mcc"><table width="100%" height="100%"border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td style="background:#f8f9fa;" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="editstyle">
              <tr>
                <td class="edittdleft">噪声原因：</td>
                <td><label>
                  <input type="text" name="textfield" id="textfield" class="addinpu">
                  <code>*不得少于10个字符</code></label></td>
              </tr>
              <tr>
                <td class="edittdleft">排序：</td>
                <td><input type="text" name="textfield2" id="textfield2" class="addinpu"></td>
              </tr>
              <tr>
                <td valign="top" class="edittdleft">详细说明：</td>
                <td style="padding-top:5px;"><label>
                  <textarea name="textarea" id="textarea" cols="45" rows="5" class="addtext"></textarea>
                </label></td>
              </tr>
              <tr>
                <td class="edittdleft">&nbsp;</td>
                <td style="padding-top:8px;"><input name="input" onclick="closeAction()"type="button" value="提交" class="tbtn" />
                  &nbsp;&nbsp;&nbsp;
                  <input name="input" type="button" value="取消"  onclick="closeAction()"class="tbtn"/></td>
              </tr>
            </table>
            
            <!--add start-->
            <!--add end-->
              
              </td>
          </tr>
        </table></td>
        <td class="mcr">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td class="mdb"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="mbl">&nbsp;</td>
        <td class="mbc">&nbsp;</td>
        <td class="mbr">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>

    </div>

</body>
</html>
