<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>登录</title>
		<link rel="stylesheet"
			href="${pageContext.request.contextPath}/css/bootstrap.min.css"
			type="text/css" />
		<!-- 引入自定义css文件 style.css -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css" />
		<style type="text/css">
			#completeShow {
				border: 1px solid #999;
				height: 200px;
				position: absolute;
				width: 196px;
				z-index: 1000;
				background-color: #fff;
				border-radius: 5px;
				top: 42px;
			}
		</style>
		<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"
			type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"
			type="text/javascript"></script>
		<script type="text/javascript">
			// JavaScript使用AJAX
			//创建一个XMLHttpRequest对象 ,利用此对象与服务器进行通信 是AJAX技术的核心
			function getXMLHttpRequest(){
			   var xmlHttp;
			   try { 
			        // Firefox, Opera 8.0+, Safari
			        xmlHttp=new XMLHttpRequest();
			    }
			    catch (e) {
				    try {
			            // Internet Explorer
				        xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
				    }
				    catch (e) {
				        try{
			                // Internet Explorer
				            xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
				        }
				        catch (e) {
				        }
			        }
			    }
				return xmlHttp;
			 }
			 
			function checkUserName(obj) {
				// 获得AJAX引擎
				var xmlHttp = getXMLHttpRequest();
				// 设置回调函数
				xmlHttp.onreadystatechange = function() {
					// XMLHTTP请求的状态为：已完成，当前请求的http状态码：200成功
					if(xmlHttp.readyState == 4 && xmlHttp.status == 200) {
						// 获取信息，并且放在"userNameInfo"中
						document.getElementById("userNameInfo").innerHTML = xmlHttp.responseText;
					}
				};
				// 确定请求方式，路径，如果是Get请求，需要在路径后写参数
				// GET请求方式
				// xmlHttp.open("GET", "${pageContext.servletContext.contextPath}/CheckUserNameIsExistServlet?username=" + obj.value);
				// POST请求方式
				xmlHttp.open("POST", "${pageContext.servletContext.contextPath}/CheckUserNameIsExistServlet");
				
				// 设置请求编码(POST必须要表单提交，GET可以不设置)
				xmlHttp.setRequestHeader("content-type","application/x-www-form-urlencoded");
				// 发送请求
				// GET,数据在url里
				// xmlHttp.send(null);
				// POST，填写参数
				xmlHttp.send("username=" + obj.value );
			}
			
			function checkUserNameJQuery(obj) {
				// post请求
				// 参数1：url:发送请求地址
				// 参数2：[data]:待发送 Key/value 参数
				// 参数3：[callback([data])]发送成功时回调函数
				// 		[data]回调函数的参数：响应体对象
				// 参数4：type:返回内容格式，xml, html, script, json, text, _default。
				$.post("${pageContext.servletContext.contextPath}/CheckUserNameIsExistServlet",{username:obj.value},function(data) {
					$("#userNameInfo").html(data);
				});
			}
			
			// 将关键字高亮
			function replaceKeyWord(text, key) {
				// 关键字出现的索引
				var index = 0;
				// 存放关键字出现的索引
				var arr = new Array();
				var i = 0;
				// 获取关键字开始出现的索引
				while((index = text.indexOf(key, index)) >= 0) {
					arr[i++] = index;
					index++;
				}
				// 关键字的长度
				var keyLen = key.length;
				// 从后往前修改文本
				for (var j = arr.length - 1; j >= 0; j--) {
					text = text.substring(0, arr[j]) + "<span style='background-color: yellow;'>" 
					+ text.substr(arr[j], keyLen) + "</span>" + text.substring(arr[j] + keyLen, text.length);
				}
				// 测试
				// alert(text);
				return text;
			}
			
			// Ajax搜索
			$(function() {
				$("#searchText").keyup(function() {
					// 搜索框绑定一个键盘弹起事件
					// alert("msg");
					// 清空子元素
					$("#itemul").empty();
					// 不等于空才发送请求
					if($(this).val() != "") {
						$.post("${pageContext.servletContext.contextPath}/SearchTextServlet", {"text": this.value}, function(data) {
							// 测试数据是否已获取
							// alert(data);
							// 获取到数据
							if($(data).size() > 0) {
								// 显示下拉菜单
								$("#completeShow").slideDown(200);
								$.each(data, function() {
									$("#itemul").append("<li class='list-group-item'><a href='#'>"+ replaceKeyWord(this.word + this.pinyin, $("#searchText").val()) +"</a></li>");
								});
							} else {
								// 隐藏下拉菜单
								$("#completeShow").slideUp(200);
							}
						}, "json");
					} else {
						// 隐藏下拉菜单
						$("#completeShow").slideUp(200);
					}
				}).focus(function() {
					// 聚焦事件，显示下拉菜单
					// 下拉菜单有元素则显示
					if($("#itemul li").size() > 0) {
						// 显示下拉菜单
						$("#completeShow").slideDown(200);
					}
				}).click(function() {
					// 禁用隐藏下拉菜单事件
					return false;
				});
			
				// 点击其他区域隐藏下拉菜单
				$(document).click(function() {
					$("#completeShow").slideUp(200);
				});
				
			});
		</script>
	</head>
	<body>
		<div class="container-fluid">
			<nav class="navbar navbar-inverse">
				<div class="container-fluid">
					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
							aria-expanded="false">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
					</div>
	
					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" style="float: right;">
						<form class="navbar-form navbar-right" role="search">
							<div class="form-group">
								<input type="text" class="form-control" placeholder="Search" id="searchText">
							</div>
							<button type="submit" class="btn btn-default">Submit</button>
						</form>
						<!-- 显示查询信息的div -->
				        <div id="completeShow" style="display: none;">
				        	<ul id='itemul' class='list-group'>
				        		<!-- <li class='list-group-item'><a href='#'>查询结果1</a></li>
				        		<li class='list-group-item'><a href='#'>查询结果2</a></li>
				        		<li class='list-group-item'><a href='#'>查询结果3</a></li>
				        		<li class='list-group-item'><a href='#'>查询结果4</a></li>
				        		<li class='list-group-item'><a href='#'>查询结果5</a></li> -->
				        	</ul>
				        </div>
					</div>
					<!-- /.navbar-collapse -->
				</div>
				<!-- /.container-fluid -->
			</nav>
		</div>
	
	
	
	
	
		<div class="container"
			style="width:100%;background:url('${pageContext.request.contextPath}/img/regist_bg.jpg');">
			<div class="row">
	
				<div class="col-md-2"></div>
	
	
	
	
				<div class="col-md-8"
					style="background: #fff; padding: 40px 80px; margin: 30px; border: 7px solid #ccc;">
					<font>会员注册</font>USER REGISTER
					<form action="/day09_regist/registerServlet" method="post"
						class="form-horizontal" style="margin-top: 5px;">
						<div class="form-group">
							<label for="username" class="col-sm-2 control-label">用户名</label>
							<div class="col-sm-6">
								<!-- 绑定一个离焦事件，用于Ajax判定用户名是否合法 -->
								<input type="text" class="form-control" id="username"
									name="username" placeholder="请输入用户名" onblur="checkUserNameJQuery(this)">
							</div>
							<div class="col-sm-4" id="userNameInfo">
							
								<!-- <span class="label label-success">用户名可用</span> 
								<span class="label label-danger">用户名不可用</span> -->
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">密码</label>
							<div class="col-sm-6">
								<input type="password" class="form-control" id="inputPassword3"
									name="password" placeholder="请输入密码">
							</div>
						</div>
						<div class="form-group">
							<label for="confirmpwd" class="col-sm-2 control-label">确认密码</label>
							<div class="col-sm-6">
								<input type="password" class="form-control" id="confirmpwd"
									name="repassword" placeholder="请输入确认密码">
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">Email</label>
							<div class="col-sm-6">
								<input type="email" class="form-control" id="inputEmail3"
									name="email" placeholder="Email">
							</div>
						</div>
						<div class="form-group">
							<label for="usercaption" class="col-sm-2 control-label">姓名</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="usercaption"
									name="name" placeholder="请输入姓名">
							</div>
						</div>
						<div class="form-group opt">
							<label for="inlineRadio1" class="col-sm-2 control-label">性别</label>
							<div class="col-sm-6">
								<label class="radio-inline"> <input type="radio"
									id="inlineRadio1" name="gender" value="男"> 男
								</label> <label class="radio-inline"> <input type="radio"
									id="inlineRadio2" name="gender" value="女"> 女
								</label>
							</div>
						</div>
						<div class="form-group">
							<label for="date" class="col-sm-2 control-label">出生日期</label>
							<div class="col-sm-6">
								<input type="date" class="form-control" name="birthday">
							</div>
						</div>
	
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<input type="submit" width="100" value="注册" border="0"
									style="background: url('${pageContext.request.contextPath}/img/register.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0);
					    height:35px;width:100px;color:white;">
							</div>
						</div>
					</form>
				</div>
	
				<div class="col-md-2"></div>
			</div>
		</div>
	</body>
</html>




