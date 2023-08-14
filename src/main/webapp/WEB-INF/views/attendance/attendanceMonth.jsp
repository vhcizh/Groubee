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
    <title>Groubee - 월 근태 현황</title>	
	<link rel="canonical" href="https://www.wrappixel.com/templates/severny-admin-template/" />    
    <!-- Custom CSS -->
    <link href="${path}/resources/dist/css/style.min.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->


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
    <div id="main-wrapper" style="height:100%;">
        <div class="app-container"></div>
        <!-- 좌측고정 메뉴바 -->
        <%@ include file="/WEB-INF/views/common/leftMenu.jsp" %>
        <!-- 좌측고정 메뉴바 -->
        <!-- ============================================================== -->
        <!-- Page wrapper  -->
        <!-- ============================================================== -->
        <div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Start Page Content -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Email App Part -->
            <!-- ============================================================== -->
            <div class="email-app position-relative" style="height:100%;">
                <!-- ============================================================== -->
                <!-- Left Part -->
                <!-- ============================================================== -->
                <%@ include file="/WEB-INF/views/attendance/subMenu.jsp" %>
                <!-- ============================================================== -->
                <!-- Right Part -->
                <!-- ============================================================== -->
                <div class="right-part mail-list overflow-auto" style="height:100%;">
                    <!-- Button group part -->
					<div class="bg-light p-3 d-flex align-items-center do-block">
						<div style="align: center">
							<h4>월 근태 현황</h4>
							<h1 class="title"></h1>
						</div>						
					</div>
                    <!-- Action part -->
                    <div class="card">
						<div class="card-body">							
							<div class="container" style="align: center">															
								<div class="row">
									<div class="col bg-light border p-3">
										<div>이번달 누적 시간</div>
										<div>${workmonth}</div>
									</div>
									<div class="col order-12 bg-light border p-3">
										<div>이번달 연장 시간</div>
										<div>${overmonth}</div>
									</div>									
								</div>
							</div>							
						</div>
					</div>


					<!-- Language - Comma decimal place  -->
					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-body">
									<select class="selectmonth form-control custom-select col-md-4" id="selectmonth" name="selectmonth" required>
										<option id="0" value="0">월간 선택</option>
										<option id="1" value="1">1월</option>
										<option id="2" value="2">2월</option>
										<option id="3" value="3">3월</option>
										<option id="4" value="4">4월</option>
										<option id="5" value="5">5월</option>
										<option id="6" value="6">6월</option>
										<option id="7" value="7">7월</option>
										<option id="8" value="8">8월</option>
										<option id="9" value="9">9월</option>
										<option id="10" value="10">10월</option>
										<option id="11" value="11">11월</option>
										<option id="12" value="12">12월</option>										
									</select>
									<small class="form-control-feedback"> Select Month </small><br><br>																		
                                    <h4 class="month card-title">${selectmonth}월</h4>
                                    <h4> 
                                      	<a class="get-code" data-toggle="collapse" href="#pgr2" aria-expanded="true">[click]
                                       	<i class="fa fa-code" title="월 근태 확인" data-toggle="tooltip"></i></a>
                                    </h4>                                       
                                    <div class="collapse mt-3 well" id="pgr2" aria-expanded="true">
                                        <div class="table-responsive">
										<table id="lang_comma_deci" class="table table-striped table-bordered display no-wrap" style="width: 100%">
										<thead>
											<tr>
												<th colspan="2">일자</th>
												<th>업무시작</th>
												<th>업무종료</th>
												<th>근무 시간</th>
												<th>연장 시간</th>
												<th>근무 형태</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="dto" items="${month}" varStatus="status">
												<c:if test="${dto.attend_id eq null}" >
												<tr>
													<td colspan="6">등록된 근태 내역이 없습니다.</td>																		
												</tr>	
												</c:if>
												<c:if test="${dto.attend_id ne null}" >
												<tr id="attendweek">
													<td>${dto.day}</td>
													<td>${dto.dy}</td>
													<td id="attendin${dto.attend_id}">
														<script type="text/javascript">
															var attendin = getTimeStamp('${dto.attendin}');
															if (attendin == 'Invalid date'){
																attendin = "";
															}else{
																document.getElementById("attendin${dto.attend_id}").innerHTML = attendin;
															}
														</script>											
													</td>
													<td id="attendout${dto.attend_id}">
														<script type="text/javascript">
															var attendout = getTimeStamp('${dto.attendout}');
															if (attendout == 'Invalid date'){
																attendout = "";
															}else{
																document.getElementById("attendout${dto.attend_id}").innerHTML = attendout;
															}
														</script>											
													</td>												
													<td id="worktime${dto.attend_id}">
														<script type="text/javascript">
															var seconds = '${dto.worktime}';
															var hour = parseInt(seconds / 3600);
															var min = parseInt((seconds % 3600)/60);
															var sec = seconds % 60;
															if (hour.toString().length==1) hour = "0" + hour;
															if (min.toString().length==1) min = "0" + min;
															if (sec.toString().length==1) sec = "0" + sec;
															var worktime = hour + ":" + min + ":" + sec;
															if(worktime == "00:00:00"){ worktime = ""; }
															console.log(worktime);															
															document.getElementById("worktime" + ${dto.attend_id}).innerHTML = worktime;
														</script>														
													</td>
													<td id="overtime${dto.attend_id}">
														<script type="text/javascript">
															var seconds = '${dto.overtime}';
															var hour = parseInt(seconds / 3600);
															var min = parseInt((seconds % 3600)/60);
															var sec = seconds % 60;
															if (hour.toString().length==1) hour = "0" + hour;
															if (min.toString().length==1) min = "0" + min;
															if (sec.toString().length==1) sec = "0" + sec;															
															var overtime = hour + ":" + min + ":" + sec;
															if( overtime == "00:00:00"){ overtime = ""; }
															console.log(worktime);															
															document.getElementById("overtime" + '${dto.attend_id}').innerHTML = overtime;
														</script>
													</td>
													<td id="state">${dto.state}</td>
												</tr>												
												</c:if>
											</c:forEach>																						
										</tbody>
										</table>
									</div>
                                    </div>
                                    <div class="list-group"> 
                                      	<a href="javascript:void(0)" class="list-group-item active">Cras justo odio</a>
                                    </div>
								</div>
							</div>
						</div>
					</div>					
					
					
					<!-- skill bars -->
					<div class="card">
                    	<div class="card-body">
					
						<h4 class="card-title">이번달 근태 현황</h4>	
						<h5 class="mt-4">
							업무 <span class="pull-right">${attendinrate}%</span>
						</h5>
						<div class="progress ">
							<div
								class="progress-bar bg-info wow animated progress-animated"
								style="width: ${attendinrate}%; height: 6px;" role="progressbar">
								<span class="sr-only">60% Complete</span>
							</div>
						</div>
						<h5 class="mt-4">
							지각 <span class="pull-right">${laterate}%</span>
						</h5>
						<div class="progress ">
							<div
								class="progress-bar bg-warning wow animated progress-animated"
								style="width: ${laterate}%; height: 6px;" role="progressbar">
								<span class="sr-only">60% Complete</span>
							</div>
						</div>															
						<h5 class="mt-4">
							연장 <span class="pull-right">${overrate}%</span>
						</h5>
						<div class="progress">
							<div
								class="progress-bar bg-success wow animated progress-animated"
								style="width: ${overrate}%; height: 6px;" role="progressbar">
								<span class="sr-only">60% Complete</span>
							</div>
						</div>
						<h5 class="mt-4">
							기본 근무 <span class="pull-right">${workrate}%</span>
						</h5>
						<div class="progress ">
							<div
								class="progress-bar bg-facebook wow animated progress-animated"
								style="width:${workrate}%; height: 6px;" role="progressbar">
								<span class="sr-only">60% Complete</span>
							</div>
						</div>
						<h5 class="mt-4">
							누적 근무 <span class="pull-right">${monthrate}%</span>
						</h5>
						<div class="progress ">
							<div
								class="progress-bar bg-danger wow animated progress-animated"
								style="width:${monthrate}%; height: 6px;" role="progressbar">
								<span class="sr-only">60% Complete</span>
							</div>
						</div>						
					</div>
				</div>
				
            </div>
           	</div>
            
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
            <footer class="footer text-center">
                   All Rights Reserved by Severny admin. Designed and Developed by <a href="https://wrappixel.com">WrapPixel</a>.
            </footer>
            <!-- ============================================================== -->
            <!-- End footer -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- End PAge Content -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
    </div>
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
    <!--Menu sidebar -->
    <script src="${path}/resources/dist/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="${path}/resources/dist/js/custom.min.js"></script>
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
		
		$(".selectmonth").change(function(){
            var monthVal =  $(this).val();             
            console.log(monthVal);            
            location.href = "${path}/attendanceMonth.at?month=" + monthVal;            
        })
	});
</script>  
</body>
</html>