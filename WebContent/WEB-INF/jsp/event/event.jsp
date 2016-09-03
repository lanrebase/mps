<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="<%=request.getContextPath()%>/css/table.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.4.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/layout.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/layer.js"></script>

<script type="text/javascript">
    // 新增事件 
    function   addEvent(){
    	layerAction('eventadd');
    }
    
    function submit(){
    	$("#").submit();
    }

   
</script>
</head>
<body  >
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="search">
  <tr>
    <td width="40" align="center"><img src="<%=request.getContextPath()%>/images/search.gif" width="32" height="32" /></td>
    <td width="46" class="cx">查询</td>
    <td width="85" align="center">应用名称：</td>
    <td width="106"><input name="textfield" type="text" class="searchinput" id="textfield" /></td>
    <td width="20">&nbsp;</td>
    <td width="85" align="center">事件名称：</td>
    <td width="106"><input name="textfield" type="text" class="searchinput" id="textfield" /></td>
    <td>
      <label>
        <input type="submit" name="button" id="button" value="查询" class="searchbtn" />
      </label>
    </td>
    </tr>
</table>
<div style="height: 20px;"></div>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tablelist">
  <tr>
    <th width="3%" style="border-left:none;"><input name="" type="checkbox" value="" /></th>
    <th width="10%">应用名称</th>
    <th width="12%">事件ID</th>
    <th width="20%">事件名称</td>
    <th width="35%">事件描述</th>
    <th width="10%">操作类型</th>
    <th width="10%">积分</th>
  </tr>
  <c:forEach var="event" items="${eventPage.result}" varStatus="vstatus">
  <tr>
    <td class="tdleft"><span style="border-left:none;">
      <input name="input" type="checkbox" value="" />
      </span>
    </td>
    <td class="tdl">${event.app_code}</td>
    <td class="tdright">${event.event_id}</td>
    <td class="tdright">${event.event_name}</td>
    <td class="tdright">${event.event_desc}</td>
    <td class="tdright">${event.op_type}</td>
    <td class="tdright">${event.score}</td>
  </tr>
  </c:forEach>
  <tr>
    <td colspan="8" class="page"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td><img src="<%=request.getContextPath()%>/images/jt1.gif" width="4" height="7" /> 共 135 条记录，每页 10 条</td>
        <td style="text-indent:opx; padding-right:8px;"><table width="320" border="0" align="right" cellpadding="0" cellspacing="0">
          <tr>
            <td>首页</td>
            <td><img src="<%=request.getContextPath()%>/images/pleft.gif" width="12" height="12" /></td>
            <td>1/3页</td>
            <td><img src="<%=request.getContextPath()%>/images/pright.gif" width="12" height="12" /></td>
            <td>尾页</td>
            <td>转到第</td>
            <td><label>
              <input type="text" name="textfield" id="textfield"  class="pageinput" />
            </label></td>
            <td>页</td>
            <td><img src="<%=request.getContextPath()%>/images/go.gif" width="16" height="16" /></td>
            <td>转</td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center">
    <div style="padding-left: 200px;padding-top: 20px;">
    <ul class="btnlist">
	    <li onclick="addEvent()"><a href="#"><span><img src="<%=request.getContextPath()%>/images/btn01.gif" alt="添加" /></span>添加</a></li>
	    <li onclick="deleteEvent()"><a href="#"><span><img src="<%=request.getContextPath()%>/images/btn01.gif" alt="添加" /></span>删除</a></li>
	    <li onclick="updateEvent()"><a href="#"><span><img src="<%=request.getContextPath()%>/images/btn01.gif" alt="添加" /></span>修改</a></li>
	    <li><a href="#"><span><img src="<%=request.getContextPath()%>/images/btn02.gif" alt="导出到Excel" /></span>导出到Excel</a></li>
	    
    </ul>
    </div>
    
    </td>
  </tr>
</table>
<div class="mdl commonLayer" id="eventadd" style="display: none;">  
<form action="<%=request.getContextPath()%>/event/saveEvent.do" method="post"  id="eventForm" > 
 <table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="mtop"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="mtl">&nbsp;</td>
        <td valign="bottom" class="mtc"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="35" style="padding-left:10px; color:#eef1f2;">应用事件添加</td>
            <td>&nbsp;</td>
            <td style="text-align:right;"><img src="<%=request.getContextPath()%>/images/gb1.gif" width="20" height="20" onclick="closeAction()"></td>
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
                <td class="edittdleft">应用名称：</td>
                <td>
	                 <label>
	                  <input type="text" name="app_code" id="app_code" class="addinpu">
	                  <code>*</code>
	                 </label>
                </td>
                <td class="edittdleft">事件名称：</td>
                <td>
	                 <label>
	                  <input type="text" name="event_name" id="evnet_name" class="addinpu">
	                  <code>*</code>
	                 </label>
                </td>
              </tr>
              <tr>
                <td valign="top" class="edittdleft">操作类型：</td>
                <td><label>
                   <input type="text" name="op_type" id="op_type" class="addinpu">
	               <span >*</span>
                </label></td>
                <td valign="top" class="edittdleft">积分数：</td>
                <td>
                 <label>
                   <input type="text" name="score" id="score" class="addinpu">
	               <code>*</code>
                </label>
                </td>
              </tr>
              <tr>
                <td valign="top" class="edittdleft">事件描述：</td>
                <td colspan="3"><label>
                  <textarea name="event_desc" id="textarea" cols="45" rows="40" class="addtext"></textarea>
                </label></td>
              </tr>
              
              <tr>
                <td class="edittdleft">&nbsp;</td>
                <td style="padding-top:8px;"><input name="input"  type="button" value="提交" class="tbtn" onclick="submit()"/>
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
</form>
</div>

</body>
</html>
