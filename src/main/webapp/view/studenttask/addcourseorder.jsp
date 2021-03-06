<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String subpage = "grouplist";
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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/cloud-admin.css" >
	<link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/css/themes/night.min.css" id="skin-switcher" >
	<link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/css/responsive.css" >
	<!-- FONTS -->
	<link href="${pageContext.request.contextPath}/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<!-- ANIMATE -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/animatecss/animate.min.css" />	
</head>
<style>
.scbjj {
	border: 1px solid #BBBBBB;
	padding-left: 15px;
	padding-right: 15px;
	height: 25px;
	font-size: 14px;
}

.ztcolz {
	margin-bottom: 10px;
	height: 30px;
}

.ztcolz dd {
	float: left;
	margin-right: 30px;
}

.ztcolz	.kwbjj {
	width: 70px;
	margin-right: 5px;
	height: 26px;
	border: 1px solid #e1e2e7;
}

.ztcolz	.kwbjj1 {
	width: 70px;
	margin-right: 5px;
	height: 26px;
	border: 1px solid #e1e2e7;
	margin-left: 5px;
}

.col-sm-9 .bjt1 {
	background: #fff;
}

.col-sm-9 .bjt2 {
	background: #ff0000;
}

.col-sm-9 .bjt3 {
	background: #00ff00;
}

.ztcolx {
	height: 30px;
	clear: both;
}

.ztcolx p {
	height: 30px;
	border: 1px solid #e1e2e7;
	float: left;
	line-height: 28px;
	padding-left: 20px;
	padding-right: 20px;
	margin: 0px 18px 0px 0px;
	font-size: 14px;
}

.hbjtz {
	text-align: center;
	height: 35px;
	line-height: 35px;
	clear: both;
}

.table-d table {
	width: 100%;
	border-right: 1px solid #787878;
	border-bottom: 1px solid #787878;
}

.table-d table td {
	border-left: 1px solid #787878;
	border-top: 1px solid #787878;
	height: 30px;
	text-align: center;
}
</style>
<body>
<!--#include virtual="/BIsystem/include/header.html"-->
	
	<!-- PAGE -->
	<section id="page" data-page="studenttask" sub-page="yuyuelist">
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
                                        <li><a href="/view/studenttask/ordercourselist.jsp">学生预约课列表</a></li>
                                        <li>学生预约课</li>
                                    </ul>
                                    <div class="pull-right mt10 ml10 hui999">当前时间：<span class="hui666"><%=date %></span></div>
                                    <div class="pull-right mt10 hui999">登录人：<span class="blue"><%=real_name %></span></div>
                                </div>
                            </div>
                        </div>
						<div class="content-in pos-r">
                        <div class="s-pannel margin-top-50">
                        	
                           <div role="form" class="form-horizontal font-14">
                              
                              <div class="form-group">
                                <label class="col-sm-3 control-label">实验室名称：</label>
                                <div class="col-sm-9">
                                    <input type="text" id="room_name" class="form-control w210 pull-left" disabled>
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="col-sm-3 control-label">预约日期：</label>
                                <div class="col-sm-9">
                                    <input type="text" id="room_day" class="form-control w210 pull-left" disabled>
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="col-sm-3 control-label">预约课时：</label>
                                <div class="col-sm-9">
                                    <input type="text" id="day_time" class="form-control w210 pull-left" disabled>
                                </div>
                              </div>
                              <div class="form-group">
									<label class="col-sm-3 control-label">课位布局：</label>
									<div class="col-sm-9">
										<div class="ztcolx">
											<p class="bjt1">可选</p>
											<p class="bjt2">已预约</p>
											<p class="bjt3">已选</p>
										</div>

										<div class="hbjtz">黑板讲台中央</div>

										<div class="table-d">
											<table border="0" cellspacing="1" cellpadding="0" id="grd">
												<tbody id="rendertab">
													<!-- 
													<tr>
														<td class="bjt1">1</td>
														<td class="bjt2">2</td>
														<td class="bjt3">3</td>
														<td>4</td>
														<td>5</td>
														<td>6</td>
													</tr>
													<tr>
														<td>7</td>
														<td>8</td>
														<td>9</td>
														<td>10</td>
														<td>11</td>
														<td>12</td>
													</tr>
													<tr>
														<td>13</td>
														<td>14</td>
														<td>15</td>
														<td>16</td>
														<td>17</td>
														<td>18</td>
													</tr>
													<tr>
														<td>19</td>
														<td>20</td>
														<td>21</td>
														<td>22</td>
														<td>23</td>
														<td>24</td>
													</tr>
													<tr>
														<td class="bjt2">25</td>
														<td class="bjt1">26</td>
														<td class="bjt3">27</td>
														<td>28</td>
														<td>29</td>
														<td>30</td>
													</tr>
													 -->
												</tbody>
											</table>
										</div>
									</div>
								</div>
                              <div class="form-group">
                                <label class="col-sm-3 control-label"></label>
                                <div class="col-sm-9">
                                <!-- 
                                    <button class="btn btn-primary mr10 btn-save" type="submit" id="ok">预约</button>
                                 -->
                                    <button class="btn btn-primary mr10 btn-save" type="submit" id="cancel">返回</button>													
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
	<!-- JAVASCRIPTS -->
	<!-- Placed at the end of the document so the pages load faster -->
	<!-- JQUERY -->
	<script src="${pageContext.request.contextPath}/js/jquery/jquery-2.0.3.min.js"></script>
	<!-- BOOTSTRAP -->
	<script src="${pageContext.request.contextPath}/bootstrap-dist/js/bootstrap.min.js"></script>	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jQuery-slimScroll-1.3.0/jquery.slimscroll.min.js"></script>
	<!-- CUSTOM SCRIPT -->
	<script src="${pageContext.request.contextPath}/js/script.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/layer/layer.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/xco.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/public.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-xco-src.js"></script>
	<script>
		var user_id = "<%=user_id %>";
		//alert("=========="+user_id);
		jQuery(document).ready(function() {	
			App.init(); //Initialise plugins and elements
		});
		
		queryUser();
		
		function queryUser(){
			var xco=new XCO();
			xco.setIntegerValue("course_id", getURLparam("course_id"));
  			var options ={
					url:"/task/selectTaskById.jhtml",
					data:xco,
					success: manage
			};
			$.doXcoRequest(options);					
		}
		
		function manage(xco){
			$("#room_name").val(xco.getStringValue("room_name"));
			$("#room_day").val(sub(xco.getStringValue("begin_time")));
			$("#day_time").val(rendTime(xco.getStringValue("begin_time"),xco.getStringValue("end_time")));
			
			var _room = xco.getXCOValue("room");
			var rows = 0;
			var cols = 0;
			if(_room){
				$("#kws").val(_room.getStringValue("place_count"));
				$("#pai").val(_room.getIntegerValue("room_rows"));
				$("#lie").val(_room.getIntegerValue("room_cols"));
				rows = _room.getIntegerValue("room_rows");
				cols = _room.getIntegerValue("room_cols");
			}
			
			var str="";
			var count=0;
			for(var __i=0;__i<rows;__i++){
				str+="<tr>";
				for(var __j=0;__j<cols;__j++){
					count++;
					str+="<td id='td"+(__i+1)+""+(__j+1)+"' data-y="+(__i+1)+" data-x="+(__j+1)+"></td>";
				}
				str+="</tr>"
			}
			$("#rendertab").html(str);
			
			var _dataList = xco.getXCOListValue("roomlist");
			
			$("#grd").find("tr").find("td").each(function () {
				　　var x = $(this).attr("data-x");
				   var y = $(this).attr("data-y");
				   for(var _m=0;_m<_dataList.length;_m++){
					   var _y = _dataList[_m].getStringValue("room_row");
					   var _x = _dataList[_m].getStringValue("room_col");
					   var station_id = _dataList[_m].getLongValue("station_id");
					   var studentid = _dataList[_m].getLongValue("student_id");
					   var operator_id = _dataList[_m].getLongValue("operator_id");
					   if(x == _x && y == _y && studentid != 0){
						   if(operator_id == user_id){
							   $(this).addClass("bjt3");
							   $(this).html("<a style='curosr: pointer;' href='javascript:selectUser("+_x+","+_y+","+station_id+")'>"+_dataList[_m].getStringValue("student_name")+"</a>");
						   }else{
							   $(this).addClass("bjt2");
							   $(this).html(_dataList[_m].getStringValue("student_name"));
						   }
					   }else if(x == _x && y == _y){
						   $(this).html("<a style='curosr: pointer;' href='javascript:selectUser("+_x+","+_y+","+station_id+")'>可选</a>");
					   }
				   }
			});
			
			
		}
		
		function sub(begin_time){
			var s_time = "";
			if(begin_time){
				s_time = begin_time.substring(0,10);
			}
			return s_time;
		}
		
		function rendTime(begin_time,end_time){
			var s_time = "";
			var e_time = "";
			if(begin_time){
				s_time = begin_time.substring(11,16);
			}
			if(end_time){
				e_time = end_time.substring(11,16);
			}
			return s_time+" - "+e_time;
		} 
		
		//function selectUser(i,j,station_id){
		//	layer.open({
		//		type: 2,
		//		title: "选择学生",
		//		maxmin: true,
		//		shadeClose: true, //点击遮罩关闭层
		//		area : ["800px" , "600px"],
		//		content: ["/view/student/studentlistinfo3.jsp?x="+i+"&y="+j+"&course_id="+getURLparam("course_id")+"&time_id="+getURLparam("time_id")+"&station_id="+station_id,"no"]
		//	});
		//}
		
		function selectUser(i,j,station_id){
			var data = new XCO();
			data.setStringValue("student_ids","<%=user_id%>");
			data.setStringValue("student_name","<%=real_name%>");
			data.setLongValue("course_id",getURLparam("course_id"));
			data.setLongValue("time_id",getURLparam("time_id"));
			data.setLongValue("station_id",station_id);
			var options ={
					url:"/task/insertOrderCourse.jhtml",
					data:data,
					success: function(xco){
						if(xco.getCode() == 0){
							alert(xco.getMessage());
						}else{
							window.location.reload();
						}
					}
			};
			$.doXcoRequest(options);
		}
		
		
		$(function(){
			$("#ok").click(function(){
				var data = new XCO();
				
				var student_ids = $("#student_ids").val();
				if(student_ids){
					data.setStringValue("student_ids",student_ids);
				}else{
					alert("请选择学生！");
					return;
				}
				
				data.setStringValue("remark","");
				data.setLongValue("course_id",getURLparam("course_id"));
				data.setLongValue("time_id",getURLparam("time_id"));
				var options ={
						url:"/task/insertOrderCourse.jhtml",
						data:data,
						success: function(xco){
							if(xco.getCode() == 0){
								alert(xco.getMessage());
							}else{
								alert(xco.getMessage());
								window.location.href="/view/studenttask/ordercourselist.jsp";
							}
						}
				};
				$.doXcoRequest(options);
				
			});
			
			$("#cancel").click(function(){
				window.location.href="/view/studenttask/ordercourselist.jsp";
			})
			
		})
		
		
		initClass("class_name",'');
	</script>
	<!-- /JAVASCRIPTS -->	
</body>
</html>
