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
<title>无标题文档</title>
<link href="<%=path %>/css/table.css" rel="stylesheet" type="text/css" />
<link href="<%=path %>/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path %>/js/jquery-3.1.0.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/layout.js"></script>
<script type="text/javascript" src="<%=path %>/js/layer.js"></script>
<script type="text/javascript">
function addGrade(){
	$("#gradeId").val("");
	$("#gradeName").val("");
    $("#gradeLevel").val("");
    $("#minScore").val("");
    $("#maxScore").val("");
    layerAction('add');
}

function doValid(name, level){
	$.ajax({
	  url: "<%=path %>/grade/valid.do",
	  data: {
	  	gradeName: name,
	  	gradeLevel: level
	  },
	  dataType:"json",
	  type:"post",
	  success: function(result) {
	    if(result.code != '200'){
	    	alert(result.msg);
	    	return false;
	    } else {
	    	$("#gradeForm").submit();
	    }
	  }
	});	
}

function doSubmit(){
	var gradeId = $("#gradeId").val();
	var gradeName = $("#gradeName").val();
    var gradeLevel = $("#gradeLevel").val();
    var minScore = $("#minScore").val();
    var maxScore = $("#maxScore").val();
    if(gradeName == ''){
    	alert("等级名称不能为空！");
    	return;
    }
    if(gradeLevel == ''){
    	alert("等级级别不能为空！");
    	return;
    }
    if(minScore == ''){
    	alert("积分下线不能为空！");
    	return;
    }
    if(maxScore == ''){
    	alert("积分上限不能为空！");
    	return;
    }
    if(parseInt(minScore) > parseInt(maxScore)){
    	alert("积分下限不能大于积分上限！");
    	return;
    }
    if(gradeId == ''){
    	doValid(gradeName, gradeLevel);
    } else {
    	$("#gradeForm").submit();
    }
    
}

function editGrade(id){
	$.ajax({
	  url: "<%=path %>/grade/editGrade.do",
	  data: {
		gradeId: id
	  },
	  dataType:"json",
	  type:"post",
	  success: function(result) {
		  $("#gradeId").val(result.gradeId);
	      $("#gradeName").val(result.gradeName);
	      $("#gradeLevel option").each(function(){
	    	  if($(this).val() == result.gradeLevel){
	    		  $(this).attr("selected", "selected");
	    		  return false;
	    	  }
	      })
	      $("#minScore").val(result.minScore);
	      $("#maxScore").val(result.maxScore);
	      layerAction('add');
	  }
	});
}

function deleteGrade(gradeId){
	if(window.confirm("確定刪除？")){
		window.location.href = "<%=path %>/grade/deleteGrade.do?gradeId=" + gradeId;
	}
}
</script>
</head>
<body>
<div style="height: 10px;"></div>
<div style="margin-left: 10px;">
	<input type="button" value="添加等级" class="searchbtn" onclick="addGrade()"/>
</div>
<div style="height: 10px;"></div>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tablelist">
  <tr>
    <th width="30%" style="text-align: center">等级名称</th>
    <th width="20%" style="text-align: center">等级级别</th>
    <th width="20%" style="text-align: center">积分下限（大于等于）</th>
    <th width="20%" style="text-align: center">积分上限（小于）</th>
    <th width="10%" style="text-align: center">操作</th>
  </tr>
  <c:forEach items="${gradeList}" var="tGrade" varStatus="idx">
  	<tr>
	  	<td style="text-align: center" <c:if test="${idx.index%2 ne 0}">bgcolor="#f9fcfd"</c:if>>${tGrade.gradeName}
	    <td style="text-align: center" <c:if test="${idx.index%2 ne 0}">bgcolor="#f9fcfd"</c:if>>${tGrade.gradeLevel}</td>
	    <td style="text-align: center" <c:if test="${idx.index%2 ne 0}">bgcolor="#f9fcfd"</c:if>>${tGrade.minScore}</td>
	    <td style="text-align: center" <c:if test="${idx.index%2 ne 0}">bgcolor="#f9fcfd"</c:if>>${tGrade.maxScore}</td>
		<td style="text-align: center" <c:if test="${idx.index%2 ne 0}">bgcolor="#f9fcfd"</c:if>>
		<a href="javascript:editGrade('${tGrade.gradeId}');">编辑</a> | <a href="javascript:deleteGrade('${tGrade.gradeId}');">删除</a>
		</td>
	</tr> 
  </c:forEach>	
</table>
<div style="height: 1px;background-color: #99cccc"></div>
<!-- 添加页 -->
<form action="<%=path %>/grade/saveGrade.do" id="gradeForm" method="post">
<input type="hidden" name="gradeId" id="gradeId" />
<input type="hidden" name="token" value="${token}" />
<div id="add" class="commonLayer" style="width:500px; height:300px; table-layout:fixed;position: absolute;z-index: 500; display:none;">
  <table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="mtop"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="mtl">&nbsp;</td>
        <td valign="bottom" class="mtc"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="35" style="padding-left:10px; color:#eef1f2;">添加等级</td>
            <td>&nbsp;</td>
            <td style="text-align:right;"><img src="<%=path %>/images/gb1.gif" width="20" height="20" onclick="closeAction()"></td>
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
        <td  class="mcc">
        <table width="100%" height="100%"border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td style="background:#f8f9fa;" valign="top">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="editstyle">
              <tr>
                <td style="width: 20%">等级名称：</td>
                <td>
                	<label>
                  		<input type="text" name="gradeName" id="gradeName" class="addinpu" style="width: 150px;">
                  		<code>*最多25个字符</code>
                  	</label>
               </td>
              </tr>
              <tr>
                <td>等级级别：</td>
                <td>
                	<select name="gradeLevel" id="gradeLevel" style="width: 150px;" class="addinpu">
                		<option value="1">1</option>
                		<option value="2">2</option>	
                		<option value="3">3</option>	
                		<option value="4">4</option>	
                		<option value="5">5</option>
                		<option value="6">6</option>
                		<option value="7">7</option>
                		<option value="8">8</option>
                		<option value="9">9</option>
                		<option value="10">10</option>
                	</select>
                	<code>*积分越高，等级越高</code>
               </td>
              </tr>
              <tr>
                <td>积分下限：</td>
                <td>
                	<input name="minScore" id="minScore" type="text" class="addinpu" style="width: 150px;">
                	<code>*大于等于</code>
                </td>
              </tr>
              <tr>
                <td>积分上限：</td>
                <td>
                	<input name="maxScore" id="maxScore" type="text" class="addinpu" style="width: 150px;">
                	<code>*小于</code>
                </td>
              </tr>
              <tr>
                <td class="edittdleft">&nbsp;</td>
                <td style="padding-top:8px;">
                	<input name="input" type="button" value="保存" onclick="doSubmit()"  class="tbtn" />
                  	&nbsp;&nbsp;&nbsp;
                  	<input name="input" type="button" value="取消"  onclick="closeAction()"class="tbtn"/></td>
              </tr>
            </table>
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
</form>
</body>
</html>
