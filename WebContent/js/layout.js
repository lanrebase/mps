// JavaScript Document
$(function(){
	var oc_i=true;	   
	var left=$(".left");
	var right=$(".right");
	var i_right=185;
	var mainHeight=$(window).height()-103;
	var window_w=$(window).width();
	var rightWidth=window_w-i_right;
	left.css("height",mainHeight);
	right.css({"width":rightWidth,"height":mainHeight});
	$(window).resize(function(){
		mainHeight=$(window).height()-103;
	    window_w=$(window).width();
		rightWidth=window_w-i_right;
		left.css("height",mainHeight);
		right.css({"width":rightWidth,"height":mainHeight});
	})
	//
	var secondLink=$(".linkOl")//二级导航
	var linktitle=$(".linktitle")//一级导航
	linktitle.click(function(){
	var next=$(this).next();
		if(next.is(":hidden")){
		secondLink.not(next).slideUp();	
		next.slideDown();	
		}
		linktitle.removeClass("linkAfter");
		$(this).addClass("linkAfter");
	})
	//
	$("#qjoc_button").click(function(){
		if(oc_i){
			i_right=16;
			mainPageObj.left_w=0;
			$("#tab_frame iframe").width(window_w-mainPageObj.left_w-16);
			left.hide();
			right.width(window_w-i_right);
			$(this).addClass("qjoc_buttonAfter");
			oc_i=false;
		}else{
			$(this).removeClass("qjoc_buttonAfter");
			i_right=185;
			mainPageObj.left_w=169;
			$("#tab_frame iframe").width(window_w-mainPageObj.left_w-16)
			left.show();
			right.width(window_w-i_right);
			$(this).removeClass("qjoc_buttonAfter");
			oc_i=true;
		}
	})
	


})