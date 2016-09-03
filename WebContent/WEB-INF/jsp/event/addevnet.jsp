<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/table.css" rel="stylesheet" type="text/css" />
</head>
<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td nowrap="nowrap">
    <div class="toolbar">
    <div class="tableinfo"><b>应用事件配置</b></div>
    </div>
    </td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0"  class="ntable">
  <tr>
    <td width="20%">应用名称:</td>
    <td width="30%"><input /></td>
    <td width="20%">事件名称:</td>
    <td width="30%"><input /></td>
  </tr>
  <tr>
    <td>事件描述:</td>
    <td><input /></td>
    <td>操作类型:</td>
    <td><input /></td>
    
  </tr>
  <tr>
    <td>积分</td>
    <td><input /></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
 </table>
 <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center">
    <div style="padding-left: 200px;padding-top: 20px;">
    <ul class="btnlist">
	    <li onclick="addEvent()"><a href="#"><span><img src="images/btn01.gif" alt="添加" /></span>保存</a></li>
        <li onclick="addEvent()"><a href="#"><span><img src="images/btn01.gif" alt="添加" /></span>重置</a></li>
    </ul>
    </div>
    
    </td>
  </tr>
</table>
</body>
</html>
