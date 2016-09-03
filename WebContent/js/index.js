/**
 * mainPage实例
 */

var mainPageObj;


/**
 * 桌面静态变量 高与宽
 */


MainPage.windowHeight = $(window).height();
MainPage.windowWidth = $(window).width();

/**
 * 页面对象
 * 
 * @return
 */
function MainPage() {
	this.tabWidth;// tab的宽度
	this.leftTabSize;// 获得当前焦点的tab相对于其父容器X轴的距离
	this.iframeHeight = $(window).height() - 129;// iframe的高度
	this.tabIframe = $("#tab_frame");
	this.nav_oc=$("#nav_oc");
	this.goLeft = $("#goLeft");// 工具条
	this.goRight = $("#goRight");
	this.tab = $("#tab");// tab容器(不会改变)
	this.tabBox = $("#tab_box");// tav容器（不会改变）
	this.navPageButtonBox = $("#nav_page");// 上翻下翻 按钮容器
	this.exitButton = $("#exitSystem");// 退出系统按钮
	this.left_w=169;
	this.sbBj = $("#sb_bj");
	this.sbBjAfter = $("#sb_bj_after");
	this.startMenu = $("#start_menu");
	this.titleHover=$("#deskTop_add");//添加快捷方式按钮
	this.titleOne=$("#titleOne")//提示层
	this.op_nav = true;// 当前导航状态，默认为开启
	this.floorButton=$(".floorButton");//弹出层按钮
	this.iframeFloor=$("#iframeFloor");//弹出的 iframe
	//初始化整个系统界面
	this.init();
	
}

/**
 * 为系统中所有原件添加监听
 * 
 * @return
 */
MainPage.prototype.addListener = function() {
	var mainPage = this;
	// 绑定退出系统事件
	this.exitButton.bind("click", function(event) {
		mainPage.showFloor("floor_close");
	})
	// 绑定右侧按钮设置系统事件
	this.titleHover.mouseover(function(event){
	    mainPage.titleOne.show();
	})
	this.titleHover.mouseout(function(event){
	    mainPage.titleOne.hide();
	})
    $("body").mousemove(function(event){
		var x=event.pageX-14;
		var y=event.pageY-50;
		mainPage.titleOne.css({"top":y,"left":x})
	})
	//弹出 iframe
	this.floorButton.click(function(){
		MainPage.floorIframeXY();	
		//$("#iframeFloor").show();
	})
	// 改变窗口大小事件
	$(window).resize(function() {
		MainPage.windowWidth = $(window).width();
		MainPage.windowHeight = $(window).height();
		mainPage.iframeHeight = MainPage.windowHeight - 129;
		mainPage.tabIframe.css("width", MainPage.windowWidth - 255);
		mainPage.tab.find("iframe").css( {
			"width" : (MainPage.windowWidth-mainPage.left_w-16),
			"height" : mainPage.iframeHeight
		});
		// 二级导航 滚动
			$("#land #gxz").css("margin-top", (MainPage.windowHeight - 380) / 2);
			if (mainPage.tabWidth > MainPage.windowWidth - 255) {
				var position = $(".tab_after").position();
				position = position.left - tab_left;
				tab_left = -(position) + (w - 243);
				mainPage.tab.css("margin-left", mainPage.leftTabSize);
			} else {
				mainPage.tab.css("margin-left", "0");
			}
		});
	
	



	// tab的鼠标经过事件
	$(".close_before").live("mouseover", function() {
		$(this).removeClass().addClass("close_after");
		$(this).mouseout(function() {
			$(this).removeClass().addClass("close_before");
		})
	});

	// 添加 tab
	$(".tabLink").click(
					function() {
						var newUrl = $(this).attr("url");
						var newId = "link" + $(this).attr("id");
						var newTitle = $(this).attr("tabName");
						if ($("#" + newId).size() > 0) {
							mainPage.tab.find("iframe").hide();
							mainPage.tab.find("li").removeClass().addClass("tab_before");
							$("#" + newId).parent().removeClass().addClass("tab_after");
							$("#" + newId).next().show();
							//$(".tab_after").find("span").removeClass().addClass("close_after");
							//$(".tab_before").find("span").removeClass().addClass("close_before");

							mainPage.tabWidth = mainPage.tab.find("li").size() * 102;
							mainPage.tab.css("width", mainPage.tabWidth);

							if (mainPage.tabWidth > MainPage.windowWidth - 255) {
								var position = $("#" + newId).position();
								position = position.left - mainPage.leftTabSize;
								mainPage.leftTabSize = -(position)
										+ (MainPage.windowWidth - 355);
								mainPage.tab.animate( {
									marginLeft : mainPage.leftTabSize
								}, 500);
							} else {
								mainPage.tab.animate( {
									marginLeft : 0
								}, 500);
							}
							return;
						}
						// if size()>0 结束
						mainPage.tab.find("iframe").hide();
						mainPage.tab.find("li").removeClass().addClass(
								"tab_before");
						mainPage.tab.find("li:last").after(
										"<li class='tab_after'><a class='tabButn' id="
												+ newId 
												+ " href='#'>"
												+ newTitle
												+ "</a><iframe src="
												+ newUrl
												+ " frameborder='0'></iframe><a class='tabClose' href='#'></a></li>");
						mainPage.tab.find("iframe").css( {
							"width" :(MainPage.windowWidth-mainPage.left_w-16),
							"height" : mainPage.iframeHeight
						});
						// tab 滚动（添加）
						mainPage.tabWidth = mainPage.tab.find("li").size() * 102;
						var tabBoxWidth=MainPage.windowWidth - 255;
						mainPage.leftTabSize = -(mainPage.tabWidth - tabBoxWidth);
						mainPage.tab.css("width", mainPage.tabWidth);
						if (mainPage.tabWidth > tabBoxWidth) {
							mainPage.tab.animate( {
								marginLeft : mainPage.leftTabSize
							}, 500);
							mainPage.goRight.removeClass().addClass("goAfter");
						}
					});

	// 删除 TAB
	$(".tab_before .tabClose")
			.live("click",function(event) {
						var tabBoxWidth=MainPage.windowWidth - 255;	
						$(this).parent().remove();
						// tab 滚动(删除)
						mainPage.tabWidth = $("#tab li").size() * 102;
						mainPage.leftTabSize = -(mainPage.tabWidth - tabBoxWidth);
						mainPage.tab.css("width", mainPage.tabWidth);
						if (mainPage.tabWidth > tabBoxWidth){
							mainPage.tab.animate( {
								marginLeft : mainPage.leftTabSize
							}, 500);
						}else{
							mainPage.goLeft.removeClass();
							mainPage.goRight.removeClass();
							mainPage.tab.animate( {
								marginLeft : 0
							}, 500);
						}
					event.stopPropagation();	
					});

	$(".tab_after .tabClose").live(
					"click",
					function(event) {
						$(this).parent().prev().find("iframe").show();
						$(this).parent().prev().removeClass().addClass("tab_after");
						//$(".tab_after").find("span").removeClass().addClass("close_after");
						$(this).parent().remove();
						// tab 滚动(删除)
						mainPage.tabWidth = mainPage.tab.find("li").size() * 102;
						var tabBoxWidth=MainPage.windowWidth - 255;

						mainPage.leftTabSize = -(mainPage.tabWidth - tabBoxWidth);
						mainPage.tab.css("width", mainPage.tabWidth);
						if (mainPage.tabWidth > tabBoxWidth) {
							mainPage.tab.animate( {
								marginLeft : mainPage.leftTabSize
							}, 500);
						} else {
							mainPage.goLeft.removeClass();
							mainPage.goRight.removeClass();
							mainPage.tab.animate( {
								marginLeft : 0
							}, 500);
						}
					event.stopPropagation();	
					});

	// 切换 TAB
	mainPage.tab.find(".tabButn").live("click", function() {
		mainPage.tab.find("a").not($(this)).next().hide();
		mainPage.tab.find("a").not($(this)).parent().removeClass().addClass("tab_before");
		$(this).parent().removeClass().addClass("tab_after");
		$(this).next().show();
		//$(".tab_after").find("span").removeClass().addClass("close_after");
		//$(".tab_before").find("span").removeClass().addClass("close_before");
	});

	// tab 滚动（左右键）
	mainPage.goRight.click(function() {
				$(this).removeClass();
				mainPage.goLeft.removeClass()
				if (mainPage.leftTabSize <= 0) {
						$(this).removeClass().addClass("goAfter");
						mainPage.leftTabSize = mainPage.leftTabSize + 102;
						mainPage.tab.animate( {
							marginLeft : mainPage.leftTabSize
						}, 500);
				}
				if (mainPage.leftTabSize >= -(mainPage.tabWidth - MainPage.windowWidth + 255)) {
						mainPage.goLeft.removeClass().addClass("goAfter");
				}
				});

	mainPage.goLeft.click(function() {
				$(this).removeClass();
				mainPage.goRight.removeClass()
				if (mainPage.leftTabSize >= -(mainPage.tabWidth - MainPage.windowWidth + 153)) {
					$(this).removeClass().addClass("goAfter");
					mainPage.leftTabSize = mainPage.leftTabSize - 102;
					mainPage.tab.animate( {
						marginLeft : mainPage.leftTabSize
					}, 500);
				}
				if (mainPage.leftTabSize <= 0) {
					mainPage.goRight.removeClass().addClass("goAfter");
				}
			});

	// 删除不要的
	$("#allClose").click(function() {
		mainPage.tab.find(".tabButn:first").click();
		var frameLi=$("#tab_frame li");
		for(var i=0;i<frameLi.size();i++){
			if(i>0){frameLi.eq(i).remove()}
		}
		mainPage.tab.css("margin-left", "0");
	});
	// 关闭/打开 nav
	this.nav_oc.click(function() {
		if (mainPage.op_nav) {
			mainPage.hiddenNav();
			$("#nav_oc").addClass("open");
		} else {
			mainPage.showNav();
			$("#nav_oc").removeClass();
		}
	});
}
//布局 
	MainPage.prototype.init = function() {
	this.tabIframe.css("width", MainPage.windowWidth - 255);
	this.tab.find("iframe").css({
		"width" : MainPage.windowWidth-this.left_w-16,
		"height" : this.iframeHeight
	});
	this.addListener();
	}



$(function() {
	//创建一个系统桌面实例
	mainPageObj = new MainPage();
	// 去虚线
	$("a").focus(function() {
		$(this).blur();
	});
})