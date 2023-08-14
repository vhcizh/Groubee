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
    <title>Admin Main</title>	
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
							Details</h4>
						<div class="d-flex align-items-center">
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb m-0 p-0">
									<li class="breadcrumb-item active">
									<a href="${path}/adminMain.ad">Home</a></li>									
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
							<div class="row">
								<div class="col-lg-12 col-md-12 col-sm-12">
									<h3 class="box-title mt-5">${month}</h3>
									<h3 class="box-title mt-5">Company Info</h3>
									<div class="table-responsive">
										<table class="table">
											<tbody>
												<tr>
													<td>Company No</td>
													<td>${dto.company_id}</td>
												</tr>
												<tr>
													<td>Brand</td>
													<td>${dto.c_name}</td>
												</tr>												
												<tr>
													<td>Address</td>
													<td>${dto.c_address}</td>
												</tr>
												<tr>
													<td>사업자번호</td>
													<td>${dto.c_number}</td>
												</tr>
																								
												<tr>
													<td>ID</td>
													<td>${sessionScope.memberID}</td>
												</tr>
												<tr>
													<td>Name</td>
													<td>${sessionScope.memberName}</td>
												</tr>
												

												<!-- Row -->
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<div class="row">
								<!-- Column -->
								<div class="col-sm-12 col-md-6">
									<div class="Approval card bg-success">
										<div class="card-body text-white">
											<div class="d-flex flex-row">
												<h2 class="align-self-center mb-0">
													<i class="ti-wallet"></i>
												</h2>
												<div class="p-2 align-self-center">
													<h4 class="mb-0">Total Approval</h4>
													<span>Approval</span>
												</div>
												<div class="ml-auto align-self-center">
													<h2 class="font-weight-medium mb-0">${approvalCnt}</h2>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- Column -->
								<!-- Column -->
								<div class="col-sm-12 col-md-6">
									<div class="Members card bg-info">
										<div class="card-body text-white">
											<div class="d-flex flex-row">
												<h2 class="align-self-center mb-0">
													<i class="ti-user"></i>
												</h2>
												<div class="p-2 align-self-center">
													<h4 class="mb-0">Members</h4>
													<span>Alive employee</span>
												</div>
												<div class="ml-auto align-self-center">
													<h2 class="font-weight-medium mb-0">${memberCnt}</h2>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- Column -->
								<!-- Column -->
								<div class="col-sm-12 col-md-6">
									<div class="Attandence card bg-cyan">
										<div class="card-body text-white">
											<div class="d-flex flex-row">
												<h2 class="align-self-center mb-0">
													<i class="ti-calendar"></i>
												</h2>
												<div class="p-2 align-self-center">
													<h4 class="mb-0">Total Attandence</h4>
													<span>with annual</span>
												</div>
												<div class="ml-auto align-self-center">
													<h2 class="font-weight-medium mb-0">${day}</h2>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- Column -->
								<!-- Column -->
								<div class="col-sm-12 col-md-6">
									<div class="Tasks card bg-orange">
										<div class="card-body text-white">
											<div class="d-flex flex-row">
												<h2 class="align-self-center mb-0">
													<i class="ti-settings"></i>
												</h2>
												<div class="p-2 align-self-center">
													<h4 class="mb-0">Total Tasks</h4>
													<span>secure</span>
												</div>
												<div class="ml-auto align-self-center">
													<h2 class="font-weight-medium mb-0">management</h2>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="card">
					<div class="card-body">
						<!-- 부서 근태 통계 -->

						<div class="card">
							<div class="card-body">
								<h4 class="card-title">전사 근태 통계</h4>
								<div>
									<canvas id="pie-chart"></canvas>
								</div>
							</div>
						</div>
					</div>


					<div class="card">
						<div class="card-body analytics-info">
							<h4 class="card-title">전사 근태 통계</h4>
							<div id="basic-doughnut" style="height: 400px;"></div>
						</div>
					</div>

					<br>
					<!-- skill bars -->

					<div class="card-body">
						<h4 class="card-title">전사 근무 통계</h4>
						<h5 class="mt-4">
							월간 누적 근무<span class="pull-right">${monthrate}%</span>
						</h5>
						<div class="progress">
							<div
								class="progress-bar bg-danger wow animated progress-animated"
								style="width: ${monthrate}%; height: 6px;" role="progressbar">
								<span class="sr-only">60% Complete</span>
							</div>
						</div>
						<h5 class="mt-4">
							월간 업무 시간<span class="pull-right">${workrate}%</span>
						</h5>
						<div class="progress ">
							<div class="progress-bar bg-info wow animated progress-animated"
								style="width: ${workrate}%; height: 6px;" role="progressbar">
								<span class="sr-only">60% Complete</span>
							</div>
						</div>
						<h5 class="mt-4">
							월간 연장 시간<span class="pull-right">${overrate}%</span>
						</h5>
						<div class="progress">
							<div class="progress-bar bg-success wow animated progress-animated"
								style="width: ${overrate}%; height: 6px;" role="progressbar">
								<span class="sr-only">60% Complete</span>
							</div>
						</div>

					</div>


					<div class="card">
						<div class="card-body analytics-info">
							<h4 class="card-title">부서별 연차 통계</h4>
							<div id="basic-doughnut2" style="height: 400px;"></div>
						</div>
					</div>
				</div>


				<!-- Column -->
				<!-- <div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<h3 class="box-title mt-5">부서별 업무시간 통계</h3>
							<div class="row">
								column
								<div class="col-lg-12">
									<div class="card">
										<div class="card-body">
											<h4 class="card-title">WorkTime about Months</h4>
											<ul class="list-inline text-right">
												<li class="list-inline-item">
													<h5>
														<i class="fa fa-circle mr-1 text-inverse"></i>사업부
													</h5>
												</li>
												<li class="list-inline-item">
													<h5>
														<i class="fa fa-circle mr-1 text-info"></i>인사부
													</h5>
												</li>
												<li class="list-inline-item">
													<h5>
														<i class="fa fa-circle mr-1 text-success"></i>영업부
													</h5>
												</li>
												<li class="list-inline-item">
													<h5>
														<i class="fa fa-circle mr-1 text-danger"></i>개발부
													</h5>
												</li>
												<li class="list-inline-item">
													<h5>
														<i class="fa fa-circle mr-1 text-cyan"></i>경영지원부
													</h5>
												</li>
												<li class="list-inline-item">
													<h5>
														<i class="fa fa-circle mr-1 text-orange"></i>총무부
													</h5>
												</li>
											</ul>
											<div id="morris-area-chart"></div>
										</div>
									</div>
								</div>
								column
							</div>
							row 
						</div>
					</div>
				</div> -->
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
    <!--chartjs -->
    <script src="${path}/resources/assets/libs/chart.js/dist/Chart.min.js"></script>
    <script src="${path}/resources/assets/libs/gaugeJS/dist/gauge.min.js"></script>
    <script src="${path}/resources/dist/js/pages/dashboards/dashboard1.js"></script>
    <!--Morris JavaScript -->
    <script src="${path}/resources/assets/libs/raphael/raphael.min.js"></script>
    <script src="${path}/resources/assets/libs/morris.js/morris.min.js"></script>
    <script src="${path}/resources/dist/js/pages/morris/morris-data.js"></script>
    <!-- Chart JS -->
    <script src="${path}/resources/dist/js/pages/chartjs/chartjs.init.js"></script>
    <script src="${path}/resources/assets/libs/chart.js/dist/Chart.min.js"></script>    
    <script src="${path}/resources/assets/libs/echarts/dist/echarts-en.min.js"></script>
    <script src="${path}/resources/dist/js/pages/echarts/pie-doughnut/pie-doghnut.js"></script>
    
   	<script type="text/javascript">
   	$(function () {
   	    "use strict";
   	Morris.Area({
   	        element: 'morris-area-chart',
   	        data: [{
   	            period: '2022-01',
				사업부: 50,
   	           	인사부: 80,
				영업부: 60,
				개발부: 30,
				경영지원부: 40,
				총무부: 30  	            
   	        }, {
   	            period: '2022-02',
   	        	사업부: 50,
	           	인사부: 80,
				영업부: 60,
				개발부: 30,
				경영지원부: 40,
				총무부: 30  	
   	        }, {
   	            period: '2022-03',
   	         	사업부: 60,
	           	인사부: 70,
				영업부: 50,
				개발부: 40,
				경영지원부: 60,
				총무부: 40  	
   	        }, {
   	            period: '2022-04',
   	         	사업부: 40,
	           	인사부: 40,
				영업부: 80,
				개발부: 40,
				경영지원부: 50,
				총무부: 20  	
   	        }, {
   	            period: '2022-05',
   	         	사업부: 30,
	           	인사부: 50,
				영업부: 60,
				개발부: 60,
				경영지원부: 20,
				총무부: 20  	
   	        }, {
   	            period: '2022-06',
   	         	사업부: 50,
	           	인사부: 80,
				영업부: 60,
				개발부: 30,
				경영지원부: 40,
				총무부: 30  	
   	        },
   	         {
   	            period: '2022-07',
   	         	사업부: 60,
	           	인사부: 40,
				영업부: 70,
				개발부: 50,
				경영지원부: 60,
				총무부: 50  	
   	        }],
   	        xkey: 'period',
   	        ykeys: ['사업부', '인사부', '영업부', '개발부', '경영지원부', '총무부'],
   	        labels: ['사업부', '인사부', '영업부', '개발부', '경영지원부', '총무부'],
   	        pointSize: 3,
   	        fillOpacity: 0,
   	        pointStrokeColors:['#02cccd', '#3f50f6', '#2f3d4a', '#FF3CA6', '#5099FF', '#FB8C00'],
   	        behaveLikeLine: true,
   	        gridLineColor: '#e0e0e0',
   	        lineWidth: 3,
   	        hideHover: 'auto',
   	        lineColors: ['#02cccd', '#3f50f6', '#2f3d4a', '#FF3CA6', '#5099FF', '#FB8C00'],
   	        resize: true
   	        
   	    });
    });
    </script>
    
    <script type="text/javascript">				
		
		
        $(function() {                	
        	// 현재 날짜
    		var selectmonth = '${selectmonth}';
    		var currentDate = new Date();
    		var calendar = currentDate.getFullYear() + "-" + (currentDate.getMonth() + 1) + "-" + currentDate.getDate();
    		var month = (currentDate.getMonth() + 1) + "월";
    		if (selectmonth.toString().length==1) selectmonth = "0" + selectmonth;
    		var title = currentDate.getFullYear() + "-" + selectmonth;
    		
    		
    		if(selectmonth == ""){	
    			$(".month").html(month); 
    			title = currentDate.getFullYear() + "-" + (currentDate.getMonth() + 1);
    		}		
    		$(".title").html(title);    		    		
    		
    		// Total Approval 클릭 시 
    		$(".Approval").click(function(){
    			 var monthVal =  $(this).val();    	    	         
    	         console.log(monthVal);
    	         location.href = "${path}/approvalad.apad?stateid=com";            
            }); 
    		
    		// Members 클릭 시 
    		$(".Members").click(function(){
    			 var monthVal =  $(this).val();    	    	         
    	         console.log(monthVal);
    	         location.href = "${path}/adHr.ad";            
            }); 
    		
    		// Total Attandence 클릭 시 
    		$(".Attandence").click(function(){
    			 var monthVal =  $(this).val();    	    	         
    	         console.log(monthVal);
    	         location.href = "${path}/adAttend.ad";            
            }); 
    		
    		// Total Tasks 클릭 시 
    		$(".Tasks").click(function(){
    			 var monthVal =  $(this).val();    	    	         
    	         console.log(monthVal);
    	         location.href = "${path}/adSecure.ad";            
            }); 
    		
        });

	</script>
    <script type="text/javascript">
	 	
		$(function () {    
			new Chart(document.getElementById("pie-chart"), {
				type: 'pie',
				data: {
				  labels: ["출근", "퇴근", "연장", "지각", "연차", "반차", "정보없음"],
				  datasets: [{
					label: "attendance",
					backgroundColor: ["#02cccd", "#ff3ca6","#6610f2","#ffab2e", '#3f50f6', '#dbabce', "005ccce"],
					data: ['${attendin_cnt}'
						,'${attendout_cnt}'
						,'${over_cnt}'
						,'${late_cnt}'
						,'${full_cnt}'
						,'${half_cnt}'
						, '${none}']
				  }]
				},
				options: {
				  title: {
					display: true,
					text: 'attendance ${day}'
				  }
				}
			});
			
			// based on prepared DOM, initialize echarts instance
	        var basicdoughnutChart = echarts.init(document.getElementById('basic-doughnut'));
	        var option = {
	            // Add title
	                title: {
	                    text: 'attandence',
	                    subtext: '${day}',
	                    x: 'center'
	                },

	                // Add legend
	                legend: {
	                    orient: 'vertical',
	                    x: 'left',
	                    data: ['출근','퇴근', '연장', '지각', '정보없음']
	                },

	                // Add custom colors
	                color: ['#ffab2e', '#3f50f6', '#dbabce', '#6610f2', '#005ccce'],

	                // Display toolbox
	                toolbox: {
	                    show: true,
	                    orient: 'vertical',
	                    feature: {
	                        mark: {
	                            show: true,
	                            title: {
	                                mark: 'Markline switch',
	                                markUndo: 'Undo markline',
	                                markClear: 'Clear markline'
	                            }
	                        },
	                        dataView: {
	                            show: true,
	                            readOnly: false,
	                            title: 'View data',
	                            lang: ['View chart data', 'Close', 'Update']
	                        },
	                        magicType: {
	                            show: true,
	                            title: {
	                                pie: 'Switch to pies',
	                                funnel: 'Switch to funnel',
	                            },
	                            type: ['pie', 'funnel'],
	                            option: {
	                                funnel: {
	                                    x: '25%',
	                                    y: '20%',
	                                    width: '50%',
	                                    height: '70%',
	                                    funnelAlign: 'left',
	                                    max: 1548
	                                }
	                            }
	                        },
	                        restore: {
	                            show: true,
	                            title: 'Restore'
	                        },
	                        saveAsImage: {
	                            show: true,
	                            title: 'Same as image',
	                            lang: ['Save']
	                        }
	                    }
	                },

	                // Enable drag recalculate
	                calculable: true,

	                // Add series
	                series: [
	                    {
	                        name: 'Browsers',
	                        type: 'pie',
	                        radius: ['50%', '70%'],
	                        center: ['50%', '57.5%'],
	                        itemStyle: {
	                            normal: {
	                                label: {
	                                    show: true
	                                },
	                                labelLine: {
	                                    show: true
	                                }
	                            },
	                            emphasis: {
	                                label: {
	                                    show: true,
	                                    formatter: '{b}' + '\n\n' + '{c} ({d}%)',
	                                    position: 'center',
	                                    textStyle: {
	                                        fontSize: '17',
	                                        fontWeight: '500'
	                                    }
	                                }
	                            }
	                        },

	                        data: [
	                            {value: '${attendin_cnt}', name: '출근'},
	                            {value: '${attendout_cnt}', name: '퇴근'},
	                            {value: '${over_cnt}', name: '연장'},
	                            {value: '${late_cnt}', name: '지각'},
	                            {value: '${none}', name: '정보없음'}
	                            
	                        ]
	                    }
	                ]
	        };
	    
	     // 부서별 연차+반차 cnt 통계
           	var basicdoughnutChart2 = echarts.init(document.getElementById('basic-doughnut2'));
           	var option2 = {
               // Add title
                   title: {
                       text: 'depart annual',
                       subtext: '${day}',
                       x: 'center'
                   },

                   // Add legend
                   legend: {
                       orient: 'vertical',
                       x: 'left',
                       data: ['사업부','영업부','개발부','인사부','경영지원부','총무부']
                   },

                   // Add custom colors
                   color: ['#ffab2e', '#3f50f6', '#dbabce', '#6610f2', "#02cccd", "#ff3ca6"],

                   // Display toolbox
                   toolbox: {
                       show: true,
                       orient: 'vertical',
                       feature: {
                           mark: {
                               show: true,
                               title: {
                                   mark: 'Markline switch',
                                   markUndo: 'Undo markline',
                                   markClear: 'Clear markline'
                               }
                           },
                           dataView: {
                               show: true,
                               readOnly: false,
                               title: 'View data',
                               lang: ['View chart data', 'Close', 'Update']
                           },
                           magicType: {
                               show: true,
                               title: {
                                   pie: 'Switch to pies',
                                   funnel: 'Switch to funnel',
                               },
                               type: ['pie', 'funnel'],
                               option: {
                                   funnel: {
                                       x: '25%',
                                       y: '20%',
                                       width: '50%',
                                       height: '70%',
                                       funnelAlign: 'left',
                                       max: 1548
                                   }
                               }
                           },
                           restore: {
                               show: true,
                               title: 'Restore'
                           },
                           saveAsImage: {
                               show: true,
                               title: 'Same as image',
                               lang: ['Save']
                           }
                       }
                   },

                   // Enable drag recalculate
                   calculable: true,

                   // Add series
                   series: [
                       {
                           name: 'Browsers',
                           type: 'pie',
                           radius: ['50%', '70%'],
                           center: ['50%', '57.5%'],
                           itemStyle: {
                               normal: {
                                   label: {
                                       show: true
                                   },
                                   labelLine: {
                                       show: true
                                   }
                               },
                               emphasis: {
                                   label: {
                                       show: true,
                                       formatter: '{b}' + '\n\n' + '{c} ({d}%)',
                                       position: 'center',
                                       textStyle: {
                                           fontSize: '17',
                                           fontWeight: '500'
                                       }
                                   }
                               }
                           },

                           data: [                              
                               {value: '${bus_cnt}', name: '사업부'},
                               {value: '${sale_cnt}', name: '영업부'},
                               {value: '${it_cnt}', name: '개발부'},
                               {value: '${human_cnt}', name: '인사부'},
                               {value: '${sup_cnt}', name: '경영지원부'},
                               {value: '${acc_cnt}', name: '총무부'}                              
                           ]
                       }
                   ]
           };
       
           basicdoughnutChart2.setOption(option2);
	        
	        basicdoughnutChart.setOption(option);
			
			// Resize chart on menu width change and window resize
            $(window).on('resize', resize);
            $(".sidebartoggler").on('click', resize);

            // Resize function
            function resize() {
                setTimeout(function() {

                    // Resize chart
                    basicpieChart.resize();
                    basicdoughnutChart.resize();
                    customizedChart.resize();
                    nestedChart.resize();
                    poleChart.resize();
                }, 200);
            }
			
		});
		
	</script>
</body>

</html>