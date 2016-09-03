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
</head>
<body>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tablelist">
  <tr>
    <th width="10%">应用名称</th>
    <th width="12%">事件ID</th>
    <th width="20%">事件名称</td>
    <th width="35%">事件描述</th>
    <th width="10%">操作类型</th>
    <th width="10%">积分</th>
    <th width="10%">操作</th>
  </tr>
  <c:forEach var="event" items="${eventPage.result}" varStatus="vstatus">
  <tr>
    <td class="tdl" style="text-align: center" <c:if test="${idx.index%2 ne 0}">bgcolor="#f9fcfd"</c:if>>${event.app_code}</td>
    <td class="tdright" style="text-align: center" <c:if test="${idx.index%2 ne 0}">bgcolor="#f9fcfd"</c:if>>${event.event_id}</td>
    <td class="tdright" style="text-align: center" <c:if test="${idx.index%2 ne 0}">bgcolor="#f9fcfd"</c:if>>${event.event_name}</td>
    <td class="tdright" style="text-align: center" <c:if test="${idx.index%2 ne 0}">bgcolor="#f9fcfd"</c:if>>${event.event_desc}</td>
    <td class="tdright" style="text-align: center" <c:if test="${idx.index%2 ne 0}">bgcolor="#f9fcfd"</c:if>>${event.op_type}</td>
    <td class="tdright" style="text-align: center" <c:if test="${idx.index%2 ne 0}">bgcolor="#f9fcfd"</c:if>>${event.score}</td>
    <td><a href="javascript:updateEventById('${event.event_id}');">编辑</a> | <a href="javascript:deleteEventById('${event.event_id}');">删除</a></td> 
  </tr>
  </c:forEach>
  <tr>
    <td colspan="8" class="page"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td><img src="<%=request.getContextPath()%>/images/jt1.gif" width="4" height="7" /> 共 135 条记录，每页 10 条</td>
        <td style="text-indent:opx; padding-right:8px;"><table width="320" border="0" align="right" cellpadding="0" cellspacing="0">
          <tr>
            <td><a href="javascript:goPage('1')">首页</a></td>
            <td><img src="<%=request.getContextPath()%>/images/pleft.gif" width="12" height="12" /></td>
            <td>${page.pageNo}/${page.pageCount}页</td>
            <td><img src="<%=request.getContextPath()%>/images/pright.gif" width="12" height="12" /></td>
            <td ><a href="javascript:goPage('${page.pageCount}')">尾页</a></td>
            <td>转到第</td>
            <td><label>
              <input type="text" id="goPageNo"  class="pageinput" />
            </label></td>
            <td>页</td>
            <td><img src="<%=request.getContextPath()%>/images/go.gif" width="16" height="16" /></td>
            <td>转</td>
          </tr>
        </table></td>
      </tr>
    </table>
</body>
</html>
