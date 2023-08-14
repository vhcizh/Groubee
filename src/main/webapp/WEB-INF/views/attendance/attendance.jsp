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
	<link rel="canonical" href="https://www.wrappixel.com/templates/severny-admin-template/" />
    <!-- This Page CSS -->
    <link href="${path}/resources/assets/libs/bootstrap-table/dist/bootstrap-table.min.css" rel="stylesheet" type="text/css" />
    <!-- Custom CSS -->
    <link href="${path}/resources/dist/css/style.min.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	<![endif]-->

</head>

<body onload="printClock()">
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
				<form name="attendform" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				<input type="hidden" name="start" id="start" value="">
				<input type="hidden" name="end" id="end" value="">
				<div class="right-part mail-list overflow-auto" style="height:100%;">
					<!-- Action part -->
					<!-- Button group part -->
					<div class="bg-light p-3 d-flex align-items-center do-block">
						<div style="align: center">
							<h4>나의 근태 현황</h4>
							<div style="border:1px solid #dedede; width:400px; height:100px; line-height:100px; color:#666;font-size:60px; text-align:center; border:0;" id="clock2">
							</div>
						</div>
						<div class="ml-auto">						
							<div class="btn-group mr-2" role="group"
								aria-label="Button group with nested dropdown">
								<div class="btn-group" role="group">
									<button id="email-dd1" type="button"
										class="btn btn-outline-secondary dropdown-toggle"
										data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false">
										<i class="mdi mdi-folder font-18"></i>
									</button>
									<div class="dropdown-menu" aria-labelledby="email-dd1">
										<a class="dropdown-item" href="request_over.at">연장 근무 신청</a> 
										<a class="dropdown-item" href="request_rest.at">연차 사용 신청</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="card">
						<div class="button-group">
							<button type="button" class="attendin btn waves-effect waves-light btn-outline-info" id="attendin">업무시작</button>
							<button type="button" class="attendout btn waves-effect waves-light btn-outline-info" id="attendout">업무종료</button>
							<button type="button" class="workweek btn waves-effect waves-light btn-outline-info" id="workweek">주간누적시간</button>																				
						</div>
						<div class="card-body">
							<h4 class="card-title" id="today2"></h4>							
							<div class="container" style="align: center">
								<div class="row">
									<div class="col bg-light border p-3">
										<div>오늘 출근 시간</div>
										<c:if test="${list[0].attendin eq null}" >
											<div id="attendin2">미등록</div>
										</c:if>
										<c:if test="${list[0].attendin ne null}" >
											<div id="attendin2"></div>
										</c:if>
									</div>
									<div class="col order-1 bg-light border p-3">
										<div>오늘 퇴근 시간</div>
										<c:if test="${list[1].attendout eq null}" >
											<div id="attendout2">미등록</div>
										</c:if>
										<c:if test="${list[1].attendout ne null}" >
											<div id="attendout2"></div>
										</c:if>
									</div>
									<div class="col order-12 bg-light border p-3">									
										<div>오늘 잔여 시간</div>
										<div id="remain"></div>
									</div>
								</div>
							</div>
							<br>
							<div class="container" style="align: center">
								<div class="row">
									<div class="col bg-light border p-3">
										<div>오늘 연장 시간</div>
										<c:if test="${list[0].overtime == null}" >
											<div id="overtime">00:00:00</div>
										</c:if>
										<c:if test="${list[0].overtime != null}" >
											<div id="overtime"></div>
										</c:if>
									</div>									
									<div class="col order-1 bg-light border p-3">
										<div>오늘 누적 시간</div>
										<div id="accumulatetime">00:00:00</div>									
									</div>									
									<div class="col order-12 bg-light border p-3">
										<div><span id="week">1주차</span> 누적 시간</div>
										<div class="accumulweek" id="accumulweek"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 일일 근태 로그 확인 -->
					<div class="card">
						<div class="card-body">
							<table class="table table-striped no-wrap" style="width:100%">
								<thead>
									<tr>										
										<th class="id" data-sortable="true">사번</th>
										<th class="today" data-sortable="true">등록일</th>
										<th class="attendin" data-sortable="true">업무시작</th>
										<th class="attendout" data-sortable="true">업무종료</th>
										<th class="state" data-sortable="true">근무상태</th>																	
										<!-- 재직 휴직 퇴사 -->
									</tr>
								</thead>
								<tbody>
								
								<c:forEach var="dto" items="${list}" varStatus="status">
									<c:if test="${dto.attend_id eq null}" >
									<tr>
										<td colspan="6">등록하신 근태 로그가 없습니다.</td>																		
									</tr>	
									</c:if>
									<c:if test="${dto.attend_id ne null}" >
									<tr>																			
										<td>${dto.id}</td>
										<td>${dto.today}</td>
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
										<td>${dto.state}</td>										
									</tr>
									</c:if>
								</c:forEach>									
								</tbody>
							</table>
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
    <script src="https://unpkg.com/tableexport.jquery.plugin/tableExport.min.js"></script>
    <script src="${path}/resources/assets/libs/bootstrap-table/dist/bootstrap-table.min.js"></script>
    <script src="${path}/resources/assets/libs/bootstrap-table/dist/bootstrap-table-locale-all.min.js"></script>
    <script src="${path}/resources/assets/libs/bootstrap-table/dist/extensions/export/bootstrap-table-export.min.js"></script>
    <script src="${path}/resources/dist/js/pages/tables/bootstrap-table.init.js"></script>       
    <script src="${path}/resources/assets/libs/moment/min/moment.min.js"></script>
    <script src="${path}/resources/assets/libs/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
    <script src="${path}/resources/assets/extra-libs/date-paginator/bootstrap-datepaginator.min.js"></script>
   
<!-- 날짜/시간 계산 -->
<script type="text/javascript">
    // 입력 timestamp > date 24시간 변환
    function getTimeStamp(timeStamp) {    	       
        var date = new Date(timeStamp); // 타임 스탬프 >> Date 로 변환
        // moment 라이브러리 사용해 24시간 형태 날짜 및 시간 확인
        var nowDate = moment(date).format("YYYY-MM-DD HH:mm:ss");
        
        console.log(nowDate);
        return nowDate;
      }
 	// 현재 시간 구하기
    function nowTimeStamp() {    	
        var timeStamp = Date.now(); // 밀리세컨드 반환 Date.now()        
        var date = new Date(timeStamp); // 타임 스탬프 >> Date 로 변환
        // moment 라이브러리 사용해 24시간 형태 날짜 및 시간 확인
        var nowDate = moment(date).format("YYYY-MM-DD HH:mm:ss");
        
        return nowDate;
      }
    
    // 시간 출력
    function printClock() {        
        var clock2 = document.getElementById("clock2");  // 출력할 장소 선택
        var today2 = document.getElementById("today2");
        var clock = document.getElementById("clock");
        var today = document.getElementById("today");
        var currentDate = new Date(); 
        var calendar = currentDate.getFullYear() + "-" + (currentDate.getMonth()+1) + "-" + currentDate.getDate() // 현재 날짜       
        var currentHours = addZeros(currentDate.getHours(),2); 
        var currentMinute = addZeros(currentDate.getMinutes(),2);
        var currentSeconds =  addZeros(currentDate.getSeconds(),2);
        
        // 일일 잔여 시간
        var company_out = new Date(calendar + " 18:00:00.000"); // 회사 퇴근 시간 기준        
	 	var r_check = company_out - currentDate; // 일일 잔여 시간 계산
	 	var r_h = Math.floor((r_check % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
	 	var r_m = Math.floor((r_check % (1000 * 60 * 60)) / (1000 * 60));
	 	var r_s = Math.floor((r_check % (1000 * 60)) / 1000);		 	
    	var remain = document.getElementById("remain");
    	// 자릿수 맞춰주기
    	if (r_h.toString().length==1) r_h = "0" + r_h;
		if (r_m.toString().length==1) r_m = "0" + r_m;
		if (r_s.toString().length==1) r_s = "0" + r_s;		
    	if(r_s < 0){
    		remain.innerHTML = "00:00:00";
    	} else{
    		remain.innerHTML = r_h +":"+ r_m +":"+ r_s;
    	}
    	// 날짜 시계 출력
        clock.innerHTML = currentHours+":"+currentMinute+":"+currentSeconds; // 시:분:초
        today.innerHTML = calendar; // 오늘 날짜
        clock2.innerHTML = currentHours+":"+currentMinute+":"+currentSeconds; // 시:분:초
        today2.innerHTML = calendar; // 오늘 날짜
        setTimeout("printClock()",1000); // 1초마다 printClock() 함수 호출        
       	
    }

    function addZeros(num, digit) { // 자릿수 맞춰주기
      	var zero = '';
      	num = num.toString();
      	if (num.length < digit) {
        	for (i = 0; i < digit - num.length; i++) {
          	zero += '0';
        	}
      	}
      	return zero + num;
    }
    	var currentDate = new Date(); 
	    var calendar = currentDate.getFullYear() + "-" + (currentDate.getMonth()+1) + "-" + currentDate.getDate() // 현재 날짜
	    var attend_in; // 출근 시간 Date
	    var attend_out; // 퇴근 시간 Date
	    var in_clock; // 출근 시간만 추출
	    var out_clock; // 퇴근 시간만 추출
	    
	    // 출퇴근 로그 순번에 따른 list 값 가져오기
	    if(${list[2].attendin ne null}){
	    	attend_in = new Date('${list[2].attendin}'); 
	    	attend_out = new Date('${list[1].attendout}'); 
	    	
	    	in_clock = getTimeStamp(attend_in).split(" ");
	    	out_clock = getTimeStamp(attend_out).split(" ");
	    }
	    else if(${list[0].attendin eq null}){
	    	attend_in = new Date('${list[1].attendin}'); 
	    	attend_out = new Date('${list[0].attendout}');
	    	
	    	in_clock = getTimeStamp(attend_in).split(" ");
	    	out_clock = getTimeStamp(attend_out).split(" ");
	    } else{
	    	attend_in = new Date('${list[0].attendin}'); // 출근 시간
	    	attend_out = new Date('${list[1].attendout}'); // 퇴근 시간
	    	
	    	in_clock = getTimeStamp(attend_in).split(" ");
	    	out_clock = getTimeStamp(attend_out).split(" ");
	    }   
	    console.log(in_clock);
	    console.log(out_clock);
	    
    	// 출근 시간
    	var attendin = document.getElementById("attendin");
    	var attendin2 = document.getElementById("attendin2");
    	if(in_clock[1] == "date"){
    		attendin.innerHTML = "미등록";
    		attendin2.innerHTML = "미등록";
    	} else{ 
    		attendin.innerHTML = in_clock[1];
    		attendin2.innerHTML = in_clock[1];
    	}
    	
    	// 퇴근 시간
    	var attendout = document.getElementById("attendout");
    	attendout.innerHTML = out_clock[1];
    	var attendout2 = document.getElementById("attendout2");
    	attendout2.innerHTML = out_clock[1];  
    	
    	if(out_clock[1] == "date"){
    		attendout.innerHTML = "미등록";
    		attendout2.innerHTML = "미등록";
    	} else{ 
    		attendout.innerHTML = out_clock[1];
    		attendout2.innerHTML = out_clock[1];
    	}
    	// *주차 계산
		var today = currentDate.getDate();		
	    var start;
	    var end;
	      	
		if(1 <= today && today <= 7){			
	    	start = 1;
	    	end = 7;      		
	    	$("#week").html("1주차");
		} else if(8 <= today && today <= 14){
			start = 8;
	    	end = 14;   
	       	$("#week").html("2주차");
		}
	    else if(15 <= today && today <= 21){
	    	start = 15;
	    	end = 21;   
	    	$("#week").html("3주차");
	    } else{
	    	start = 22;
	    	end = 31;   
	    	$("#week").html("4주차");
	    }
		console.log(today + ", " + start + ", " + end);	
	
		// 초 단위 시간 > 시간 변환 (HH24:MI:SS)
		function timeConvert(time) {
			
		 	var h = Math.floor((time % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
		 	var m = Math.floor((time % (1000 * 60 * 60)) / (1000 * 60));
		 	var s = Math.floor((time % (1000 * 60)) / 1000);
		 	// 0 표기 만들어주기
	 		if (h.toString().length==1) h = "0" + h;
			if (m.toString().length==1) m = "0" + m;
			if (s.toString().length==1) s = "0" + s;
			var convert = h +":"+ m +":"+ s;
		 	
		 	console.log(convert);
		 	
	      	return convert;
	    }	
		
		
   	$(function(){
   		// 일일 누적 시간 
   		var workcheck = attend_out - attend_in; // 일일 누적 근무 시간 계산
	 	var worktime = workcheck / 1000; // 근무 시간	 	
	 	
	 	
	 	if(${list[0].overtime ne null}){ // 오늘 연장 기록이 있으면
	 		var over = Number('${list[0].overtime}') * 1000; // 연장 시간	 									 		
	 		
			// 오늘 연장 근무 시간 변환
			document.getElementById("overtime").innerHTML = timeConvert(over);
			document.getElementById("accumulatetime").innerHTML = timeConvert(workcheck + over);
	 	} else{	 	
		 	// 누적 시간 계산 (퇴근 - 출근)
	    	var accumulate = document.getElementById("accumulatetime"); // 오늘 누적 시간    	
		 	
	
		 	if(${list[0].attendout eq null}){ // 출퇴근 기록이 둘 다 없으면 계산불가
		 		accumulate.innerHTML = "00:00:00";
		 	} 
		 	else{ // 출퇴근 기록이 있으면 누적 시간 계산
	    		accumulate.innerHTML = timeConvert(workcheck);   		
		 	}	 		 	 	
	 	}
   		// 업무 시작
   		$(".attendin").click(function(){
   			if(${!empty list}){
   				alert("이미 업무를 시작한 이력이 있습니다. \n업무 시작은 일일 1회 가능합니다.")
   				return false;
   			}   				
   			 else{
   				if(confirm("업무를 시작하시겠습니까? \n업무 시작은 일일 1회 가능합니다.")){
					document.attendform.action = "${path}/attendin.at";
					document.attendform.submit();
   				}
   			}
   		});
   		
   		// 업무 종료
   		$(".attendout").click(function(){
   			
   			if(${list[0].attendout ne null}){
   				alert("업무 종료 이력이 있습니다 \n업무 종료는 일일 1회 가능합니다.")
   				location.href = '${path}/attendout.at?worktime='+ worktime;   				
   			}
   			else if(${!empty list}){
   				if(confirm("업무를 종료하시겠습니까? \n업무 시작은 일일 1회 가능합니다.")){	   				
	   				location.href = '${path}/attendout.at';   					
	   			}
   			}   			
   			else{
   				alert("업무 시작 이력이 없습니다. \n업무 종료는 일일 1회 가능합니다.")
   				return false;
   			}
   		});   
   		// 주간 누적 근무  확인
   		$(".workweek").click(function(){
   			$.ajax({            	
                url: '${path}/worktime.at',
                type: 'GET',
                data: 'start='+ start + "&end=" + end, 
                // callback 함수
                success: function(result) {                	
                	$("#accumulweek").html(result);
                },
                error: function() {
                   alert("error");
                }
             });	
   		});  		
   		
    });  	
  
</script>
</body>
</html>