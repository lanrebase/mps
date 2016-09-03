<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>会员账户查询</title>
<link href="<%=request.getContextPath()%>/css/table.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.4.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/layout.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/layer.js"></script>
<script type="text/javascript">
function goPage(pageNo){
	$("#pageNo").val(pageNo);
	$("#memberForm").submit();
}
function goPageNo(){
	var go = $("#goPageNo").val();
	var pageCount = $("#pageCount").val();
	if(parseInt(go) < 1){
		alert("输入页数不正确！");
		return;
	}
	if(parseInt(go) > parseInt(pageCount)){
		alert("输入页数不正确！");
		return;
	}
	$("#pageNo").val(go);
	$("#memberForm").submit();
} 
</script>
</head>
<body>
<form action="<%=path %>/member/queryMember.do" id="memberForm" method="post">
<input type="hidden" name="pageNo" id="pageNo" value="${pageNo}"/>
<input type="hidden" id="pageCount" value="${page.pageCount}"/>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="search">
  <tr>
    <td width="40" align="center"><img src="<%=request.getContextPath()%>/images/search.gif" width="32" height="32" /></td>
    <td width="46" class="cx">查询</td>
    <td width="85" align="center">应用名称：</td>
    <td width="106">
    	<select name="appCode" style="width: 120px;" class="addinpu">
    		<option value="">--请选择--</option>
    		<option value="0001">应用系统_1</option>
    		<option value="0002">应用系统_2</option>
    		<option value="0003">应用系统_3</option>
    		<option value="0004">应用系统_4</option>
    	</select>	
    </td>
    <td width="20">&nbsp;</td>
    <td width="85" align="center">会员名称：</td>
    <td width="106"><input name="memberName" id="memberName" type="text" class="searchinput"  /></td>
    <td>
      <label>
      &nbsp;&nbsp;<input type="submit" name="button" id="button" value="查询" class="searchbtn" />
      </label>
    </td>
    </tr>
</table>
</form>
<div style="height: 20px;"></div>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tablelist">
  <tr>
    <th width="25%" style="text-align: center">所属应用</th>
    <th width="25%" style="text-align: center">会员名称</th>
    <th width="25%" style="text-align: center">会员积分</td>
    <th width="25%" style="text-align: center">会员等级</th>
  </tr>
  <c:forEach items="${page.result}" var="member" varStatus="idx">
  <tr>
    <td class="tdright" style="text-align: center" <c:if test="${idx.index%2 ne 0}">bgcolor="#f9fcfd"</c:if>>
    	${member.appCode}
    </td>
    <td class="tdright" style="text-align: center" <c:if test="${idx.index%2 ne 0}">bgcolor="#f9fcfd"</c:if>>${member.memberName}</td>
    <td class="tdright" style="text-align: center" <c:if test="${idx.index%2 ne 0}">bgcolor="#f9fcfd"</c:if>>${member.score}</td>
    <td class="tdright" style="text-align: center" <c:if test="${idx.index%2 ne 0}">bgcolor="#f9fcfd"</c:if>>${member.memberLevel}</td>
  </tr>
  </c:forEach>
  <tr>
    <td colspan="8" class="page"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td><img src="<%=request.getContextPath()%>/images/jt1.gif" width="4" height="7" /> 共  ${pageCount} 条记录，每页  5 条</td>
        <td style="text-indent:opx; padding-right:8px;"><table width="320" border="0" align="right" cellpadding="0" cellspacing="0">
          <tr>
            <td><a href="javascript:goPage('1')">首页</a></td>
            <td><img src="<%=request.getContextPath()%>/images/pleft.gif" width="12" height="12" onclick="goPage('1')"/></td>
            <td>${page.pageNo}/${page.pageCount}页</td>
            <td><img src="<%=request.getContextPath()%>/images/pright.gif" width="12" height="12" /></td>
            <td><a href="javascript:goPage('${page.pageCount}')">尾页</a></td>
            <td>转到第</td>
            <td><label>
              <input type="text" id="goPageNo" class="pageinput" />
            </label></td>
            <td>页</td>
            <td><img src="<%=request.getContextPath()%>/images/go.gif" width="16" height="16" onclick="goPageNo()"/></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
