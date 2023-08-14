<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp" %> 

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${path}/resources/assets/images/favicon.png">
    <title>Severny admin Template - The Ultimate Multipurpose admin template</title>	
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

<body onload="printClock()">

	<div class="left-part bg-white pb-5" style="height:100%;">
		<!-- Mobile toggle button -->
		<a
			class="ti-menu ti-close btn btn-success show-left-part d-block d-md-none"
			href="javascript:void(0)"></a>
		<!-- Mobile toggle button -->
		<div class="scrollable position-relative" style="height: 100%;">
			<div class="p-3">
				<div class="card-body position-relative">
					<h4 class="card-title mb-4">근태관리</h4>
					<div id="carouselExampleFade"
						class="carousel slide status-carousel" data-ride="carousel">
						<div class="carousel-inner">
							<div class="carousel-item active">
								<!-- <h4 class="card-title mt-4">Nkike Shoes</h4> -->
								<p class="text-muted attendenceDay" id="today"></p>
								<p class="text-muted attendenceTime" id="clock"></p>
								<p class="text-muted">
									출근시간<span class="attendenceChk"> : 
									<c:if test="${list[0].attendin == null}" >
										<div id="attendin">미등록</div>
									</c:if>
									<c:if test="${list[0].attendin != null}" >
										<div id="attendin">${list[0].attendin}</div>
									</c:if>									
									</span>
								</p>
								<p class="text-muted">
									퇴근시간<span class="attendenceChk"> : 
									<c:if test="${list[1].attendout == null}" >
										<div id="attendout">미등록</div>
									</c:if>
									<c:if test="${list[1].attendout != null}" >
										<div id="attendout">${list[1].attendout}</div>
									</c:if>
									</span>
								</p>
							</div>
						</div>
						<!-- carousel-item active -->
						<hr class="attendenceHr">
					</div>
				</div>
			</div>
			<div class="p-6">
				<nav class="sidebar-nav">
					<ul id="sidebarnav">
						<li class="sidebar-item" style="color: #343a40;"><a
							class="sidebar-link has-arrow" href="javascript:void(0)"
							aria-expanded="false" style="color: #343a40;"> <span
								class="hide-menu" style="color: #343a40;">근태관리 </span></a>
							<ul aria-expanded="false"
								class="collapse first-level base-level-line"
								style="color: #343a40;">
								<li class="sidebar-item" style="color: #343a40;"><a
									href="attendance.at" class="sidebar-link"> <span
										class="hide-menu" style="color: #343a40;"> 내 근태 현황 </span></a></li>
								<li class="sidebar-item" style="color: #343a40;"><a
									href="attendanceWeek.at" class="sidebar-link"> <span
										class="hide-menu" style="color: #343a40;"> 내 근무 조회 </span></a></li>
								<li class="sidebar-item" style="color: #343a40;"><a
									href="attendanceMonth.at" class="sidebar-link"> <span
										class="hide-menu" style="color: #343a40;"> 월 근태 현황 </span></a></li>
								<li class="sidebar-item" style="color: #343a40;"><a
									href="attendanceRestInfo.at" class="sidebar-link"> <span
										class="hide-menu" style="color: #343a40;"> 내 연차 내역 </span></a></li>										
								<li class="sidebar-item" style="color: #343a40;"><a
									href="request_over.at" class="sidebar-link"> <span
										class="hide-menu" style="color: #343a40;"> 연장 근무 신청 </span></a></li>
								<li class="sidebar-item" style="color: #343a40;"><a
									href="request_rest.at" class="sidebar-link"> <span
										class="hide-menu" style="color: #343a40;"> 연차 반차 신청 </span></a></li>
							</ul></li>

						<li class="sidebar-item" style="color: #343a40;"><a
							class="sidebar-link has-arrow" href="javascript:void(0)"
							aria-expanded="false" style="color: #343a40;"> <span
								class="hide-menu" style="color: #343a40;">부서 근태관리 </span></a>
							<ul aria-expanded="false"
								class="collapse first-level base-level-line"
								style="color: #343a40;">
								<li class="sidebar-item" style="color: #343a40;"><a
									href="departWeek.at" class="sidebar-link"> <span
										class="hide-menu" style="color: #343a40;"> 부서 근태 내역 </span></a></li>
								<li class="sidebar-item" style="color: #343a40;"><a
									href="departMonth.at" class="sidebar-link"> <span
										class="hide-menu" style="color: #343a40;"> 부서 근태 통계 </span></a></li>
								<li class="sidebar-item" style="color: #343a40;"><a
									href="departRestWeek.at" class="sidebar-link"> <span class="hide-menu"
										style="color: #343a40;"> 부서 연차 내역 </span></a></li>
								<li class="sidebar-item" style="color: #343a40;"><a
									href="departRestMonth.at" class="sidebar-link"> <span class="hide-menu"
										style="color: #343a40;"> 부서 연차 통계 </span></a></li>
							</ul></li>

						<li class="sidebar-item" style="color: #343a40;"><a
							class="sidebar-link has-arrow" href="javascript:void(0)"
							aria-expanded="false" style="color: #343a40;"> <span
								class="hide-menu" style="color: #343a40;">전사 근태관리 </span></a>
							<ul aria-expanded="false"
								class="collapse first-level base-level-line"
								style="color: #343a40;">
								<li class="sidebar-item" style="color: #343a40;"><a
									href="grbWeek.at" class="sidebar-link"> <span class="hide-menu"
										style="color: #343a40;"> 전사 근태 내역 </span></a></li>
								<li class="sidebar-item" style="color: #343a40;"><a
									href="grbMonth.at" class="sidebar-link"> <span class="hide-menu"
										style="color: #343a40;"> 전사 근태 통계 </span></a></li>
								<li class="sidebar-item" style="color: #343a40;"><a
									href="grbRestWeek.at" class="sidebar-link"> <span class="hide-menu"
										style="color: #343a40;"> 전사 연차 내역 </span></a></li>
								<li class="sidebar-item" style="color: #343a40;"><a
									href="grbRestMonth.at" class="sidebar-link"> <span class="hide-menu"
										style="color: #343a40;"> 전사 연차 통계 </span></a></li>
							</ul></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
	<script src="${path}/resources/assets/libs/moment/min/moment.min.js"></script>
<!-- 날짜/시간 계산 -->
<script type="text/javascript">
	//입력 timestamp > date 24시간 변환
	function getTimeStamp(timeStamp) {    	       
	    var date = new Date(timeStamp); // 타임 스탬프 >> Date 로 변환
	    // moment 라이브러리 사용해 24시간 형태 날짜 및 시간 확인
	    var nowDate = moment(date).format("YYYY-MM-DD HH:mm:ss");
	    
	    console.log(nowDate);
	    return nowDate;
	  }
    // 시간 출력
    function printClock() {        
       // 출력할 장소 선택        
        var clock = document.getElementById("clock");
        var today = document.getElementById("today");
        var currentDate = new Date(); 
        var calendar = currentDate.getFullYear() + "-" + (currentDate.getMonth()+1) + "-" + currentDate.getDate() // 현재 날짜
        
		// 시,분,초
        var currentHours = addZeros(currentDate.getHours(),2); 
        var currentMinute = addZeros(currentDate.getMinutes(),2);
        var currentSeconds =  addZeros(currentDate.getSeconds(),2);       
    	// 날짜 시계 출력
        clock.innerHTML = currentHours+":"+currentMinute+":"+currentSeconds; // 시:분:초
        today.innerHTML = calendar; // 오늘 날짜       
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
    	if(in_clock[1] == "date"){
    		attendin.innerHTML = "미등록";    		
    	} else{ 
    		attendin.innerHTML = in_clock[1];   		
    	}
    
    	// 퇴근 시간
    	var attendout = document.getElementById("attendout");
    	if(out_clock[1] == "date"){
    		attendout.innerHTML = "미등록";    		
    	} else{ 
    		attendout.innerHTML = out_clock[1];    		
    	}
    
</script>

</body>
</html>