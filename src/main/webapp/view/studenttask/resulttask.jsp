<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String subpage = "studenttasklist";
%>
<%@ include file="../common/header.jsp" %>
<%@ include file="../common/left.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
	<title><%=title%></title>
	<meta name="description" content="">
	<meta name="author" content="">
	<!--[if lt IE 9]>
    <script src="js/html5.js"></script>
    <script src="js/css3-mediaqueries.js"></script>
    <![endif]-->
	<link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/css/cloud-admin.css" >
	<link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/css/themes/night.min.css" id="skin-switcher" >
	<link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/css/responsive.css" >
	<link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/kindeditor-4.1.7/themes/default/default.css" />
	<!-- FONTS -->
	<link href="${pageContext.request.contextPath}/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<!-- ANIMATE -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/animatecss/animate.min.css" />	
</head>
<body>
<!--#include virtual="/BIsystem/include/header.html"-->
	
	<!-- PAGE -->
	<section id="page" data-page="studenttask" sub-page="studenttasklist">
		<!--#include virtual="/BIsystem/include/side.html"-->
		<div id="main-content">
			<div class="container">
				<div class="row">
					<div id="content" class="col-lg-12">
						<!-- PAGE HEADER-->
						<div class="row">
                            <div class="col-sm-12">
                                <div class="page-header">
                                    <!-- BREADCRUMBS -->
                                    <ul class="breadcrumb pull-left">
                                        <li>
                                            <i class="fa fa-home"></i>
                                            <a href="/view/message/msglist.jsp">Home</a>
                                        </li>
                                        <li><a href="/view/studenttask/tasklist.jsp">学生实验课列表</a></li>
                                        <li>上课中</li>
                                    </ul>
                                    <div class="pull-right mt10 ml10 hui999">当前时间：<span class="hui666"><%=date %></span></div>
                                    <div class="pull-right mt10 hui999">登录人：<span class="blue"><%=real_name %></span></div>
                                </div>
                            </div>
                        </div>
						<div class="content-in pos-r">
                        <div class="s-pannel mt20">
                           <div role="form" class="form-horizontal font-14">
                              <div class="form-group">
                                <label class="col-sm-3 control-label">任务名称：</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control w210" disabled id="course_name">
                                </div>
                              </div>
                               <div class="form-group">
				                  <label class="col-sm-3 control-label">实验名称：</label>
				                  <div class="col-sm-9">
				                    <input type="text"  disabled class="form-control w210 mr10 pull-left" id="experiment_name">
				                  </div>
				              </div>
                              <div class="form-group">
				                  <label class="col-sm-3 control-label">班级：</label>
				                  <div class="col-sm-9">
				                    <input type="text"  disabled class="form-control w210 mr10 pull-left" id="class_name">
				                  </div>
				              </div>
                              <div class="form-group">
                                <label class="col-sm-3 control-label">实验报告：</label>
                                <div class="col-sm-9">
                                    <textarea class="form-control"  rows="7" name="experiment_report" id="experiment_report"></textarea>
                                </div>
                              </div>
                               
                              <div class="form-group">
                                <label class="col-sm-3 control-label"></label>
                                <div class="col-sm-9">
                                	<button class="btn btn-primary mr10 btn-save" type="submit" id="ok">提交</button>	
                                	<button class="btn btn-primary mr10 btn-save" type="submit" id="next">报告结果</button>
                                	<button class="btn btn-primary mr10 btn-save" type="submit" id="back">返回</button>
                                </div>
                              </div>
                             </div>
        					</div>
                       
						</div>
						<!-- /PAGE HEADER -->
					</div><!-- /CONTENT-->
				</div>
			</div>
		</div>
	</section>
	<!--/PAGE -->
	<!-- JAVASCRIPTS -->
	<!-- Placed at the end of the document so the pages load faster -->
	<!-- JQUERY -->
	<script src="${pageContext.request.contextPath}/js/jquery/jquery-2.0.3.min.js"></script>
	<!-- BOOTSTRAP -->
	<script src="${pageContext.request.contextPath}/bootstrap-dist/js/bootstrap.min.js"></script>	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jQuery-slimScroll-1.3.0/jquery.slimscroll.min.js"></script>
	<!-- CUSTOM SCRIPT -->
	<script src="${pageContext.request.contextPath}/js/script.js"></script>

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/public.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/xco.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-xco-src.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/kindeditor-4.1.7/kindeditor-min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/kindeditor-4.1.7/lang/zh_CN.js"></script>
	<script>
		jQuery(document).ready(function() {	
			$("#next").hide();
			App.init(); //Initialise plugins and elements
		});
		
		
		queryUser();
		
		function queryUser(){
			var xco=new XCO();
			xco.setLongValue("student_id", getURLparam("student_id"));
			xco.setLongValue("time_id", getURLparam("time_id"));
			xco.setLongValue("course_id", getURLparam("course_id"));
  			var options ={
					url:"/task/selectCourseById2.jhtml",
					data:xco,
					success: manage
			};
			$.doXcoRequest(options);					
		}
		var c_student_id = 0;
		function manage(xco){
			c_student_id = xco.getObjectValue("course_student_id");
			$("#course_name").val(xco.getStringValue("course_name"));
			$("#student_name").val(xco.getStringValue("student_name"));
			$("#class_name").val(xco.getStringValue("class_name"));
			$("#experiment_name").val(xco.getStringValue("experiment_name"));
			$("#example_name").val(xco.getStringValue("example_name"));
			if(xco.getStringValue("experiment_report")!=""){
				$("#experiment_report").attr("disabled",true);
				$("#experiment_report").html(xco.getStringValue("experiment_report"));
				$("#ok").hide();
			}
			if(xco.getStringValue("experiment_score")){
				$("#next").show();
			}
			//$("#begin_time").val(xco.getStringValue("experiment_score"));
			//$("#end_time").val(xco.getStringValue("end_time"));
			
		}
		
		
		$(function(){
			$("#next").click(function(){
				window.location.href="reportresult.jsp?course_id="+getURLparam("course_id")+"&student_id="+getURLparam("student_id")+"&order_id="+getURLparam("order_id")+"&time_id="+getURLparam("time_id")+"&course_student_id="+c_student_id;
			});
			
			$("#back").click(function(){
				window.location.href="/view/studenttask/viewtask.jsp?course_id="+getURLparam("course_id")+"&student_id="+getURLparam("student_id")+"&order_id="+getURLparam("order_id")+"&time_id="+getURLparam("time_id");
			});
			
			$("#ok").click(function(){
				var xco = new XCO();
				xco.setStringValue("course_id", getURLparam("course_id"));
				xco.setStringValue("course_student_id", c_student_id);
				var experiment_report = $("#experiment_report").val();
				if(experiment_report){
					xco.setStringValue("experiment_report",experiment_report);
				}else{
					alert("请填写实验报告");
					return;
				}
	            var options = {
	            	url: "/task/updateStudentReport.jhtml",
	                data: xco,
	                success: function (xco) {
	                	if(xco.getCode() == 1){
	                		alert(xco.getMessage());
							window.location.reload();
	                	}else if(xco.getCode() == 5){
	                		alert(xco.getMessage());
	                		window.location.reload();
	                	}else{
	                		alert(xco.getMessage());
	                	}
	                }
	            };
				if(confirm("提交后无法再次修改。确定要提交报告吗？")){
		            $.doXcoRequest(options);
				}
			});
		})
		
		//initType("type_name",'');
	</script>
	<!-- /JAVASCRIPTS -->	
</body>
</html>
