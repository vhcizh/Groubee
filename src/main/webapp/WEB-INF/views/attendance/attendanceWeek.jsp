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
    <title>Groubee - 나의 근무 조회</title>	
	<link rel="canonical" href="https://www.wrappixel.com/templates/severny-admin-template/" />    
    <!-- Custom CSS -->
    <link href="${path}/resources/dist/css/style.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css"
        href="${path}/resources/assets/libs/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
    <link rel="stylesheet" type="text/css" href="${path}/resources/assets/extra-libs/date-paginator/date-paginator-custom.css">
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
                <form name="weekform" method="post">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">                
                <div class="right-part mail-list overflow-auto" style="height:100%;">
                    <div class="card">
                        <div class="card-body">
  							<h4 class="card-title"><strong>나의 근무 조회</strong></h4>  							                                                           
							<div id="paginator2"></div>                                
						</div>
					</div>				
                    <!-- Action part -->
                    <div class="card">
						<div class="card-body">
							<select class="selectweek form-control custom-select col-md-4" id="selectweek" name="selectweek" required>
								<option id="0" value="0">주간 선택</option>
								<option id="1" value="1주차">1주차</option>
								<option id="2" value="2주차">2주차</option>
								<option id="3" value="3주차">3주차</option>
								<option id="4" value="4주차">4주차</option>
							</select> 
							<small class="form-control-feedback"> Select Week </small><br><br>
							<h4 class="week card-title">${selectweek}</h4>
							<h4><a class="getweek" href="#pgr2"><small class="form-control-feedback">[주간 근무 조회]</small></a></h4>    						
							<div class="container" style="align: center">
								<div class="row">
									<div class="col bg-light border p-3">
										<div>주간별 누적 시간</div>										
										<div id="accumulweek">${weektotal}</div>
									</div>
									<div class="col order-12 bg-light border p-3">
										<div>주간별 연장 시간</div>										
										<div id="overweek">${overweek}</div>
									</div>
									<div class="col order-1 bg-light border p-3">
										<div>주간별 잔여 시간</div>
										<div id="remainweek">${remainweek}</div>
									</div>
								</div>
								<br>
								<div class="row">
									<div class="col bg-light border p-3">
										<div>이번달 누적 시간</div>
										<div id="workmonth">${workmonth}</div>
									</div>
									<div class="col order-12 bg-light border p-3">
										<div>이번달 연장 시간</div>
										<div id="overmonth">${overmonth}</div>
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
                                    <h4 class="card-title">주간별 근무 조회
                                    	<a class="getweek" href="#pgr2"><small class="form-control-feedback">[주간 근무 조회]</small></a>										
										<a class="get-code" data-toggle="collapse" href="#pgr2" aria-expanded="true">											
											<i class="fa fa-code" title="주간 근태 확인" data-toggle="tooltip"></i><br><br>
										</a>
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
											<c:forEach var="dto" items="${week}" varStatus="status">
												<c:if test="${dto.attend_id eq null}" >
												<tr>
													<td colspan="6">등록하신 근태 로그가 없습니다.</td>																		
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
															document.getElementById("worktime${dto.attend_id}").innerHTML = worktime;
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
						<h4 class="card-title">주간별 근태 현황</h4>						
						<h5 class="mt-4">
							52시간 누적 근무<span class="pull-right">${weekrate}%</span>
						</h5>
						<div class="progress">
							<div
								class="progress-bar bg-danger wow animated progress-animated"
								style="width: ${weekrate}%; height: 6px;" role="progressbar">
								<span class="sr-only">60% Complete</span>
							</div>
						</div>
						<h5 class="mt-4">
							업무 시간<span class="pull-right">${workrate}%</span>
						</h5>
						<div class="progress ">
							<div
								class="progress-bar bg-info wow animated progress-animated"
								style="width: ${workrate}%; height: 6px;" role="progressbar">
								<span class="sr-only">60% Complete</span>
							</div>
						</div>						
						<h5 class="mt-4">
							연장 시간<span class="pull-right">${overrate}%</span>
						</h5>
						<div class="progress">
							<div
								class="progress-bar bg-success wow animated progress-animated"
								style="width: ${overrate}%; height: 6px;" role="progressbar">
								<span class="sr-only">60% Complete</span>
							</div>
						</div>						
					</div>
				</div>				
            </div>
            </form>
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
    <!-- This Page JS -->    
    <script src="${path}/resources/assets/libs/moment/min/moment.min.js"></script>
    <script src="${path}/resources/assets/libs/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
    <script src="${path}/resources/assets/extra-libs/date-paginator/bootstrap-datepaginator.min.js"></script>
	<script type="text/javascript">		
		
		// 날짜 표
        var datepaginator = function () {
            return {
                init: function () {
                    $("#paginator1").datepaginator(),

                        $("#paginator2").datepaginator({
                            size: "large"
                        }),

                        $("#paginator3").datepaginator({
                            size: "small"
                        }),

                        $("#paginator4").datepaginator({
                            onSelectedDateChanged: function (a, t) {
                                alert("Selected date: " + moment(t).format("Do, MMM YYYY"))
                            }
                        })
                }
            }
        }();
        
        $(document).ready(function(){
            datepaginator.init();
            // 현재 날짜
            var currentDate = new Date(); 
    	    var calendar = currentDate.getFullYear() + "-" + (currentDate.getMonth()+1) + "-" + currentDate.getDate()
    	    var selectweek = '${selectweek}';
        	// *주차 계산
    		var today = currentDate.getDate();		
    	    var start;
    	    var end;
    	      	
    		if(1 <= today && today <= 7){			
    	    	start = 1;
    	    	end = 7;
    	    	if(selectweek == ""){ $(".week").html("1주차"); }
    		} else if(8 <= today && today <= 14){
    			start = 8;
    	    	end = 14;   
    	    	if(selectweek == ""){	$(".week").html("2주차"); }
    		}
    	    else if(15 <= today && today <= 21){
    	    	start = 15;
    	    	end = 21;   
    	    	if(selectweek == ""){ $(".week").html("3주차"); }
    	    } else{
    	    	start = 22;
    	    	end = 31;   
    	    	if(selectweek == ""){ $(".week").html("4주차"); }
    	    }
    		console.log(today + ", " + start + ", " + end);
    		
    		$(".selectweek").change(function(){
                var weekVal =  $(this).val();
                console.log(weekVal);
                
                if(weekVal == '1주차'){
                	location.href = '${path}/attendanceWeek.at?start='+ 1 + "&end=" + 7 + "&week=" + "1주차";        	    
                }
                else if(weekVal == '2주차'){
                	location.href = '${path}/attendanceWeek.at?start='+ 8 + "&end=" + 14 + "&week=" + "2주차";        	    	
                }
                else if(weekVal == '3주차'){
                	location.href = '${path}/attendanceWeek.at?start='+ 15 + "&end=" + 21 + "&week=" + "3주차";        	    	
                }
                else if(weekVal == '4주차'){
                	location.href = '${path}/attendanceWeek.at?start='+ 22 + "&end=" + 31 + "&week=" + "4주차";        	    	
                }
            })
    		
    		// 이번주 근무조회
    		$(".getweek").click(function(){
            	location.href = '${path}/attendanceWeek.at?start='+ start + "&end=" + end;
    		});                     
             
        });

	</script>  
</body>
</html>