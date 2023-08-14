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
    <title>Groubee - 전사 근태 내역</title>	
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
				<form name="grbweekform" method="post">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">                
                  				
				<div class="right-part mail-list overflow-auto" style="height:100%;">
				<!-- Action part -->					
					<div class="card">
                        <div class="card-body">
  							<h4 class="card-title">
  								<strong>전사 근태 현황</strong>
  								<br>${day}
  							</h4>  							                                                            
							<div id="paginator2"></div>                                
						</div>
					</div>                                  
           
					<div class="card">						
                        <div class="card-body">
                        	<div class="col-md-2">
								<select class="selectdepart form-control custom-select" data-placeholder="부서 선택" tabindex="1">
									<option id="0" value="0">부서 선택</option>
									<option id="1" value="사업부">사업부</option>									
									<option id="2" value="인사부">인사부</option>
									<option id="3" value="영업부">영업부</option>
									<option id="4" value="개발부">개발부</option>
									<option id="5" value="경영지원부">경영지원부</option>
									<option id="6" value="총무부">총무부</option>
								</select>								 
							</div>
							<hr>
                            <h4 class="card-title">${depart_name} 근태 내역 조회
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
                            </h4>
                            <h4 class="month card-title">${selectmonth}월</h4>
							<div class="row">
							<div class="col-12">
							<div class="card">
								<div class="card-body">																		
                                    <h4 class="card-title">                                   		                                											
										<a class="get-code" data-toggle="collapse" href="#pgr2" aria-expanded="true">											
											<i class="fa fa-code" title="전사 월간 근태 확인" data-toggle="tooltip"></i><br><br>
										</a>
									</h4>                                       
                                        <div class="collapse mt-3 well" id="pgr2" aria-expanded="true">
                                            <div class="table-responsive">
											<table id="lang_comma_deci" class="table table-striped table-bordered display no-wrap" style="width: 100%">
											<thead>
												<tr class="footable-filtering">
													<th colspan="2">일자</th>
													<th data-toggle="true">이름</th>
													<th>부서</th>													
													<th>업무시작</th>
													<th>업무종료</th>
													<th>근무 시간</th>
													<th>연장 시간</th>
													<th>근무 형태</th>
												</tr>
											</thead>
											<tbody>
											<c:forEach var="dto" items="${grb}" varStatus="status">
												<c:if test="${dto.attend_id eq null}" >
												<tr>
													<td colspan="10">등록하신 근태 로그가 없습니다.</td>																		
												</tr>	
												</c:if>
												<c:if test="${dto.attend_id ne null}" >												
												<tr id="attendmonth">
													<td>${dto.day}</td>
													<td>${dto.dy}</td>												
													<td>${dto.name}</td>
													<td>${dto.depart_name}</td>																																														
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
         	
        });
        
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
    		
    		$(".selectdepart").change(function(){   			
   			 	var depart_name = $(this).val();    	        
   	         	console.log(depart_name);
   	         	location.href = "${path}/grbWeek.at?depart_name=" + depart_name;            
           });    	
           
    		$(".selectmonth").change(function(){
    		 	var monthVal =  $(this).val();    				        
    	     	console.log(monthVal);
    	     	location.href = "${path}/grbWeek.at?month=" + monthVal;            
            });    		                 
             
        });

	</script>  
</body>
</html>