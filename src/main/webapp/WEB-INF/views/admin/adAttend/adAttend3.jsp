<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp" %>   
 
<!DOCTYPE html>
<html dir="ltr" lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${path}/resources/assets/images/favicon.png">
    <title>Admin 근태관리</title>	
	<link rel="canonical" href="https://www.wrappixel.com/templates/severny-admin-template/" />
    <!-- Custom CSS -->
    <link href="${path}/resources/assets/libs/chartist/dist/chartist.min.css" rel="stylesheet">
    <link href="${path}/resources/assets/extra-libs/c3/c3.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="${path}/resources/dist/css/style.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${path}/resources/assets/extra-libs/prism/prism.css">
    <link href="${path}/resources/commonCSS/index.css" rel="stylesheet">
    <!-- This Page CSS -->
    <link rel="stylesheet" type="text/css" href="${path}/resources/assets/extra-libs/css-chart/css-chart.css">
    <link href="${path}/resources/assets/libs/morris.js/morris.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

<script type="text/javascript">
	
</script>

</head>

<body>
    <!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
    <div class="preloader">
        <div class="lds-ripple">
            <div class="lds-pos"></div>
            <div class="lds-pos"></div>
        </div>
    </div>
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
	<div id="main-wrapper">
		<div class="app-container"></div>
		<!-- ============================================================== -->
		<!-- Topbar header - style you can find in pages.scss -->
		<!-- ============================================================== -->

		<!-- ============================================================== -->
		<!-- Left Sidebar - style you can find in sidebar.scss  -->
		<!-- ============================================================== -->
		<!-- 좌측고정 메뉴바 -->
		<%@ include file="/WEB-INF/views/admin/adminMenu.jsp"%>
		<!-- 좌측고정 메뉴바 -->
		<!-- ============================================================== -->
		<!-- Page wrapper  -->
		<!-- ============================================================== -->
		<div class="page-wrapper">
			<!-- ============================================================== -->
			<!-- Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<div class="page-breadcrumb">
				<div class="row">
					<div class="col-7 align-self-center">
						<h4
							class="page-title text-truncate text-dark font-weight-medium mb-1">Admin
							Attendance</h4>
						<div class="d-flex align-items-center">
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb m-0 p-0">
									<li class="breadcrumb-item active">
									<a href="${path}/adminMain.ad">Home</a></li>
									<li class="breadcrumb-item active"aria-current="page">
									<a href="${path}/adAttend3.ad">Company Attendance</a></li>
								</ol>
							</nav>
						</div>
					</div>
				</div>
			</div>
			<!-- ============================================================== -->
			<!-- Container fluid  -->
			<!-- ============================================================== -->
			<div class="container-fluid">
				<!-- *************************************************************** -->
				<!-- Start First Cards -->
				<!-- *************************************************************** -->
				<!-- Column -->
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
						<div class="row button-group">
						    <div class="col-lg-2 col-md-4">
						        <button type="button" class="btn btn-rounded btn-block btn-outline-info" onclick = "location.href='${path}/adAttend.ad'">전사근태내역</button>
						    </div>
						    <div class="col-lg-2 col-md-4">
						        <button type="button" class="btn btn-rounded btn-block btn-outline-info" onclick = "location.href='${path}/adAttend2.ad'">전사연차내역</button>
						    </div>
						    <div class="col-lg-2 col-md-4">
						        <button type="button" class="btn btn-rounded btn-block btn-outline-info" onclick = "location.href='${path}/adAttend3.ad'">사내근무내규</button>
						    </div>
						</div>
						<hr><br>
							<div class="row">
							<form name="c_attendanceform" action="${path}/adAttend3_action.ad" method="post">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
								<div class="col-lg-12 col-md-12 col-sm-12">
									<h3 class="box-title mt-5">Company Attendance Info</h3>
									<h4 class="box-title mt-5">Work Days</h4>
									<div class="btn-group" data-toggle="buttons" >
											<label class="btn btn-info">
                                                <div class="custom-control custom-checkbox mr-sm-4">
                                                    <input type="checkbox" class="custom-control-input" id="1" readonly>
                                                    <label class="custom-control-label" for="1">일</label>
                                                </div>
                                            </label>
                                            <label class="btn btn-info">
                                                <div class="custom-control custom-checkbox mr-sm-4">
                                                    <input type="checkbox" class="custom-control-input" id="2" readonly>
                                                    <label class="custom-control-label" for="2">월</label>
                                                </div>
                                            </label>
                                            <label class="btn btn-info">
                                                <div class="custom-control custom-checkbox mr-sm-4">
                                                    <input type="checkbox" class="custom-control-input" id="3" readonly>
                                                    <label class="custom-control-label" for="3">화</label>
                                                </div>
                                            </label>
                                            <label class="btn btn-info">
                                                <div class="custom-control custom-checkbox mr-sm-4">
                                                    <input type="checkbox" class="custom-control-input" id="4" readonly>
                                                    <label class="custom-control-label" for="4">수</label>
                                                </div>
                                            </label>
                                            <label class="btn btn-info">
                                                <div class="custom-control custom-checkbox mr-sm-4">
                                                    <input type="checkbox" class="custom-control-input" id="5" readonly>
                                                    <label class="custom-control-label" for="5">목</label>
                                                </div>
                                            </label>
                                            <label class="btn btn-info">
                                                <div class="custom-control custom-checkbox mr-sm-4">
                                                    <input type="checkbox" class="custom-control-input" id="6" readonly>
                                                    <label class="custom-control-label" for="6">금</label>
                                                </div>
                                            </label>
                                            <label class="btn btn-info">
                                                <div class="custom-control custom-checkbox mr-sm-4">
                                                    <input type="checkbox" class="custom-control-input" id="7" readonly>
                                                    <label class="custom-control-label" for="7">토</label>
                                                </div>
                                            </label>                                            
                                        </div>
									<div class="table-responsive">													
										<table class="table">
											<tbody>
												<tr>
													<td>Time Type</td>
													<td>Time Settings</td>
												</tr>												
												<tr>
													<td>Work Time</td>
													<td>
														업무 시작 시간<input class="col-lg-4 form-control" type="time" value="${dto.attendin}" name="attendin" id="attendin">
														업무 종료 시간<input class="col-lg-4 form-control" type="time" value="${dto.attendout}" name="attendout" id="attendout">
													</td>
												</tr>
												<tr>
													<td>Over Time</td>
													<td>
														연장 근무 시작<input class="col-lg-4 form-control" type="time" value="${dto.over_in}" name="over_in" id="over_in">
														연장 근무 종료<input class="col-lg-4 form-control" type="time" value="${dto.over_out}" name="over_out"  id="over_out">
													</td>
												</tr>
												<tr>
													<td>Rest Time</td>
													<td>
														쉬는 시간 시작<input class="col-lg-4 form-control" type="time" value="${dto.rest_in}" name="rest_in" id="rest_in">
														쉬는 시간 종료<input class="col-lg-4 form-control" type="time" value="${dto.rest_out}" name="rest_out" id="rest_out">
													</td>
												</tr>											
																							
												<!-- Row -->
											</tbody>
										</table>
										
									<!-- <h4 class="box-title mt-5">Options</h4>									
                                    <div class="col-sm-4">
                                        <div class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" id="52hour">
                                            <label class="custom-control-label" for="52hour">52시간 초과근무 알림</label>
                                        </div>
                                        <div class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" id="work">
                                            <label class="custom-control-label" for="work">업무 시작 알림</label>
                                        </div>
                                        <div class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" id="workout">
                                            <label class="custom-control-label" for="workout">퇴근 시간 알림</label>
                                        </div>
                                    </div>      -->                                                             	
                                	
									</div>
									<br>
									<button type="submit" class="btn btn-info">Submit</button>
								</div>
								</form>
							</div>						
						</div>
					</div>
				</div>
			</div>			
			<!-- *************************************************************** -->
			<!-- End Top Leader Table -->
			<!-- *************************************************************** -->
		</div>
		<!-- ============================================================== -->
		<!-- End Container fluid  -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- footer -->
		<!-- ============================================================== -->
		<footer class="footer text-center text-muted"> Copyright 2019. All Rights Reserved by Severny Admin </footer>
		<!-- ============================================================== -->
		<!-- End footer -->
		<!-- ============================================================== -->
	</div>
	<!-- ============================================================== -->
	<!-- End Page wrapper  -->
	<!-- ============================================================== -->

	<!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- customizer Panel -->
    <!-- ============================================================== -->
    <aside class="customizer">
        <a href="javascript:void(0)" class="service-panel-toggle"><i class="fa fa-spin fa-cog"></i></a>
        <div class="customizer-body">
            <div class="p-3 border-bottom">
                <!-- Sidebar -->
                <h5 class="font-weight-medium mb-2 mt-2">Layout Settings</h5>
                <div class="custom-control custom-checkbox mt-2">
                    <input type="checkbox" class="custom-control-input sidebartoggler" name="collapssidebar"
                        id="collapssidebar">
                    <label class="custom-control-label" for="collapssidebar">Collapse Sidebar</label>
                </div>
                <div class="custom-control custom-checkbox mt-2">
                    <input type="checkbox" class="custom-control-input" name="sidebar-position" id="sidebar-position">
                    <label class="custom-control-label" for="sidebar-position">Fixed Sidebar</label>
                </div>
                <div class="custom-control custom-checkbox mt-2">
                    <input type="checkbox" class="custom-control-input" name="header-position" id="header-position">
                    <label class="custom-control-label" for="header-position">Fixed Header</label>
                </div>
                <div class="custom-control custom-checkbox mt-2">
                    <input type="checkbox" class="custom-control-input" name="boxed-layout" id="boxed-layout">
                    <label class="custom-control-label" for="boxed-layout">Boxed Layout</label>
                </div>
            </div>
            <div class="p-3 border-bottom">
                <!-- Header BG -->
                <h5 class="font-weight-medium mb-2 mt-2">Header Backgrounds</h5>
                <ul class="theme-color">
                    <li class="theme-item"><a href="javascript:void(0)" class="theme-link" data-navbarbg="skin1"></a>
                    </li>
                    <li class="theme-item"><a href="javascript:void(0)" class="theme-link" data-navbarbg="skin2"></a>
                    </li>
                    <li class="theme-item"><a href="javascript:void(0)" class="theme-link" data-navbarbg="skin3"></a>
                    </li>
                    <li class="theme-item"><a href="javascript:void(0)" class="theme-link" data-navbarbg="skin4"></a>
                    </li>
                    <li class="theme-item"><a href="javascript:void(0)" class="theme-link" data-navbarbg="skin5"></a>
                    </li>
                    <li class="theme-item"><a href="javascript:void(0)" class="theme-link" data-navbarbg="skin6"></a>
                    </li>
                </ul>
                <!-- Header BG -->
            </div>
            <div class="p-3 border-bottom">
                <!-- Logo BG -->
                <h5 class="font-weight-medium mb-2 mt-2">Sidebar Backgrounds</h5>
                <ul class="theme-color">
                    <li class="theme-item"><a href="javascript:void(0)" class="theme-link" data-sidebarbg="skin1"></a>
                    </li>
                    <li class="theme-item"><a href="javascript:void(0)" class="theme-link" data-sidebarbg="skin2"></a>
                    </li>
                    <li class="theme-item"><a href="javascript:void(0)" class="theme-link" data-sidebarbg="skin3"></a>
                    </li>
                    <li class="theme-item"><a href="javascript:void(0)" class="theme-link" data-sidebarbg="skin4"></a>
                    </li>
                    <li class="theme-item"><a href="javascript:void(0)" class="theme-link" data-sidebarbg="skin5"></a>
                    </li>
                    <li class="theme-item"><a href="javascript:void(0)" class="theme-link" data-sidebarbg="skin6"></a>
                    </li>
                </ul>
                <!-- Logo BG -->
            </div>
        </div>
    </aside>
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
    <script src="${path}/resources/assets/libs/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="${path}/resources/assets/libs/popper.js/dist/umd/popper.min.js"></script>
    <script src="${path}/resources/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- apps -->
    <script src="${path}/resources/dist/js/app.min.js"></script>
    <script src="${path}/resources/dist/js/app.init-menusidebar.js"></script>
    <script src="${path}/resources/dist/js/app-style-switcher.js"></script>
    <script src="${path}/resources/dist/js/feather.min.js"></script>
    <!-- slimscrollbar scrollbar JavaScript -->
    <script src="${path}/resources/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
    <script src="${path}/resources/assets/extra-libs/sparkline/sparkline.js"></script>
    <!--Wave Effects -->
    <!-- themejs -->
    <!--Menu sidebar -->
    <script src="${path}/resources/dist/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="${path}/resources/dist/js/custom.min.js"></script>
    <!--This page JavaScript -->
    <!--chartis chart-->
    <script src="${path}/resources/assets/libs/chartist/dist/chartist.min.js"></script>
    <script src="${path}/resources/assets/libs/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js"></script>
    <!--c3 charts -->
    <script src="${path}/resources/assets/extra-libs/c3/d3.min.js"></script>
    <script src="${path}/resources/assets/extra-libs/c3/c3.min.js"></script>
    
   	<script type="text/javascript">
   		
	   	$(document).ready(function(){
	   		$("#2").prop("checked", true);
	   		$("#3").prop("checked", true);
	   		$("#4").prop("checked", true);
	   		$("#5").prop("checked", true);
	   		$("#6").prop("checked", true);
	   	});	   		
   	</script>
</body>

</html>