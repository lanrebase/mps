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
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/layout.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/layer.js"></script>

<script type="text/javascript">

    $(document).ready(function() {
    // 加载下拉列表的值
    $.ajax({
        type:"get", 
        url:"/mps/app/getAppListString.do",   
        dataType:'text',
        success: function(responseText){
             $("#applist").append(responseText);
             $("#addapplist").append(responseText);
             
        },
        error: function(responseText){
            alert("加载下拉列表失败");
        }
    });
    
    
    
    //根据appcode和evnetId查询事件列表
    $.ajax({
        type:"get", 
        url:"/mps/event/getEventList.do", 
        data:"eventId=''&appCode=''&pageNo=1",
        dataType:'text',
        success: function(responseText){
        	 $("#tableBody").empty();
             $("#tableBody").append(responseText);
        },
        error: function(responseText){
            alert("加载下拉列表失败");
        }
    });
    
   });

    
    function getEventByappId(){
    	
    }

    // 新增事件 
    function   addEvent(){
    	layerAction('eventadd');
    }
     

    // 删除
    function deleteEventById(eventId){
    	var eventId = chk_event;
    	$.ajax({
            type:"get", 
            url:"/mps/event/deleteEventById.do", 
            data:"eventId="+eventId,
            dataType:'text',
            success: function(responseText){
            	alert(responseText);
                 //删除成功，刷新页面
            	var appCode = $("#applist").val();
             	var eventId = $("#eventList").val();
             	$.ajax({
                     type:"get", 
                     url:"/mps/event/getEventList.do", 
                     data:"eventId="+eventId+"&appCode="+appCode+"&pageNo=1",
                     dataType:'text',
                     success: function(responseText){
                     	 alert("查询成功");
                     	 $("#tableBody").empty();
                         $("#tableBody").append(responseText);
                     },
                     error: function(responseText){
                         alert("查询事件列表失败");
                     }
                 });
            },
            error: function(responseText){
                alert("加载下拉列表失败");
            }
        });	
    }
    
    function updateEventById(eventId){
   		$.ajax({
              type:"get", 
              url:"/mps/event/getEventByEventId.do", 
              data:"eventId="+chk_event,
              dataType:'text',
              success: function(responseText){
               	 var eventArray = responseText.split(",");
               	 $("#addapplist").val(eventArray[0]);
               	 $("#event_name").val(eventArray[2]);
               	 $("#event_desc").val(eventArray[3]);
               	 $("#op_type").val(eventArray[4]);
               	 $("#score").val(eventArray[5]);
               	 layerAction('eventadd');
              },
              error: function(responseText){
                  alert("查询事件列表失败");
              }
        });
    }

    function  checkAllEvent(){
    	if($(".checkAll").attr("checked")){    //判断chk_all是否被选中
    		$("input[name='checkEvent']").attr("checked",false); //反选
    	}else{
    		$("input[name='checkEvent']").attr("checked",true);//全选
    	}
    }
    
    
    // 查询事件列表
    function  queryevent(){
    	var appCode = $("#applist").val();
    	var eventName = $("#eventList").val();
    	$.ajax({
            type:"get", 
            url:"/mps/event/getEventList.do", 
            data:"eventName="+eventName+"&appCode="+appCode+"&pageNo=1",
            dataType:'text',
            success: function(responseText){
            	 $("#tableBody").empty();
                 $("#tableBody").append(responseText);
            },
            error: function(responseText){
                alert("查询事件列表失败");
            }
        });
    }
    
    // 事件提交
    function  eventSubmit(){
    	var  app_code =  $("#addapplist").val();
    	var  event_name = $("#event_name").val();
    	var  event_desc = $("#event_desc").val();
    	var  op_type = $("#op_type").val();
    	var  score = $("#score").val();
    	$.ajax({
            type:"psot", 
            url:"/mps/event/saveEvent.do", 
            data:"app_code="+app_code+"&event_name="+event_name+"&event_desc="+event_desc+"&op_type="+op_type+"&score="+score,
            dataType:'text',
            success: function(responseText){
            	 alert("添加成功");	 
            },
            error: function(responseText){
                alert("查询事件列表失败");
            }
        });
    }
    
    
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
<body  >
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="search">
  <tr>
    <td width="40" align="center"><img src="<%=request.getContextPath()%>/images/search.gif" width="32" height="32" /></td>
    <td width="46" class="cx">查询</td>
    <td width="85" align="center">应用名称：</td>
    <td width="150">
       <select id="applist" style="height: 26px;width: 150px;" onchange="getEventByappId()"></select>
    </td>
    <td width="20">&nbsp;</td>
    <td width="85" align="center">事件名称：</td>
    <td width="150">
       <input id="eventList" style="height: 24px;width: 150px;" ></input>
    </td>
    <td>
      <label>
        &nbsp;&nbsp;&nbsp;&nbsp;<input type="button"  value="查询" class="searchbtn"  onclick="queryevent()"/>
        &nbsp;&nbsp;&nbsp;&nbsp;<input type="button"  value="添加" class="searchbtn"  onclick="addEvent()"/>
      </label>
    </td>
    </tr>
</table>
<div style="height: 20px;"  ></div>
<div id="tableBody">
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tablelist">
  <tr>
    <th width="10%">应用名称</th>
    <th width="12%">事件ID</th>
    <th width="20%">事件名称</th>
    <th width="35%">事件描述</th>
    <th width="10%">操作类型</th>
    <th width="10%">积分</th>
  </tr>
</table>
</div>
<div class="mdl commonLayer" id="eventadd" style="display: none;">  
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
	                  <select id="addapplist" style="height: 28px;width: 170px;" ></select>
	                  <code>*</code>
	                 </label>
                </td>
                <td class="edittdleft">事件名称：</td>
                <td>
	                 <label>
	                  <input type="text" name="event_name" id="event_name" class="addinpu">
	                  <code>*</code>
	                 </label>
                </td>
              </tr>
              <tr>
                <td valign="top" class="edittdleft">操作类型：</td>
                <td><label>
                   <select  name="op_type" id="op_type" class="addinpu">
                       <option value="1">加分项</option>
                       <option value="0">减分项</option>
                   </select>
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
                  <textarea name="event_desc" id="event_desc" cols="45" rows="40" class="addtext"></textarea>
                </label></td>
              </tr>
              
              <tr>
                <td class="edittdleft">&nbsp;</td>
                <td style="padding-top:8px;"><input name="input"  type="button" value="提交" class="tbtn" onclick="eventSubmit()"/>
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
