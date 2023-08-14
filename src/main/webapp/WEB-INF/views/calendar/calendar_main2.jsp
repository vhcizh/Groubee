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
    <title>Severny admin Template - The Ultimate Multipurpose admin template</title>	
	<link rel="canonical" href="https://www.wrappixel.com/templates/severny-admin-template/" />
    <!-- Custom CSS -->
<%--     <link href="${path}/resources/assets/libs/fullcalendar/dist/fullcalendar.min.css" rel="stylesheet" />
    <link href="${path}/resources/assets/extra-libs/calendar/calendar.css" rel="stylesheet" /> --%>
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
        <div class="page-wrapper" style="height:100%;">
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-7 align-self-center">
                        <h4 class="page-title text-truncate text-dark font-weight-medium mb-1">Calendar</h4>
                        <div class="d-flex align-items-center">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb m-0 p-0">
                                    <li class="breadcrumb-item text-muted active" aria-current="page">Apps</li>
                                    <li class="breadcrumb-item text-muted" aria-current="page">Calendar</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                    <div class="col-5 align-self-center">
                        <div class="customize-input float-right">
                            <select class="custom-select form-control">
                                <option selected>June 19</option>
                                <option value="1">July 19</option>
                                <option value="2">Aug 19</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid" style="height:90%;">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="">
                                <div class="row">
                                    <div class="col-lg-3 border-right pr-0">
                                        <div class="card-body border-bottom">
                                            <h4 class="card-title mt-2">일정 선택</h4>
                                        </div>
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div id="calendar-events" class="">
                                                        <div class="calendar-events mb-3" data-class="bg-info">
                                                        	<i class="fa fa-circle text-info mr-2"></i>개인일정
                                                        	<input type="checkbox" id="individual-calendar" class="calendar-events-input">
                                                        </div>
                                                        <div class="calendar-events mb-3" data-class="bg-success">
                                                        	<i class="fa fa-circle text-success mr-2"></i>팀별일정
                                                            <input type="checkbox" id="team-calendar" class="calendar-events-input">
                                                        </div>
                                                    </div>
                                                    <!-- checkbox -->
                                                    <div class="custom-control custom-checkbox">
                                                        <input type="checkbox" class="custom-control-input"
                                                            id="drop-remove">
                                                        <label class="custom-control-label" for="drop-remove">Remove
                                                            after drop</label>
                                                    </div>
                                                    <a href="javascript:void(0)" data-toggle="modal"
                                                        data-target="#add-new-event"
                                                        class="btn mt-3 btn-info btn-block waves-effect waves-light">
                                                        <i class="ti-plus"></i> 일정 추가
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-9">
                                        <div class="card-body b-l calender-sidebar">
                                            <%@ include file="/WEB-INF/views/calendar/calendar.jsp" %>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- BEGIN MODAL -->
                <div class="modal none-border" id="my-event">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title"><strong>하루 일정</strong></h4>
                                <button type="button" class="close" data-dismiss="modal"
                                    aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary waves-effect"
                                    data-dismiss="modal">닫기</button>
                                <button type="button" class="btn btn-success save-event waves-effect waves-light" value="하루 일정 추가" onclick = "window.open('${path}/oneDayEvent.ca','one Day Event','left=500, top=500, width=500,height=300,location=no,status=no,scrollbars=yes');">하루 일정 추가</button>
                                <button type="button" class="btn btn-danger delete-event waves-effect waves-light"
                                    data-dismiss="modal">삭제</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Modal Add Category -->
                <div class="modal fade none-border" id="add-new-event">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title"><strong>일정</strong> 추가하기</h4>
                                <button type="button" class="close" data-dismiss="modal"
                                    aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">
                                <form>
                                    <div class="row">
                                        <div class="col-md-6">
                                        	<table style="width:450px;">
	                                        	<tr>
	                                            	<th style="width:70px;">일정 제목</th>
	                                            	<td style="width:230px"><input class="oneDay-title" placeholder="일정 제목 입력" type="text" name="category-name" style="width:220px"></td>
	                                            	<td> 비공개 <input type="checkbox" class="disclose-on-off" name="disclose-on-off"><td>
	                                            </tr>
	                                            <tr>
	                                            	<th colspan="3">날짜&시간</th>
	                                            </tr>
	                                            <tr>
	                                            	<td colspan="3" style="text-align:right;">
	                                            		<input class="oneDay-start-date" type="date" name="oneDay-start-date">
	                                            		<select name="oneDay-start-time" id="oneDay-start-time">
	                                            			<option value="">시작 시각</option>
	                                            			<option value="00:00">00:00</option>
	                                            			<option value="00:30">00:30</option>
	                                            			<option value="01:00">01:00</option>
	                                            			<option value="01:30">01:30</option>
	                                            			<option value="02:00">02:00</option>
	                                            			<option value="02:30">02:30</option>
	                                            			<option value="03:00">03:00</option>
	                                            			<option value="03:30">03:30</option>
	                                            			<option value="04:00">04:00</option>
	                                            			<option value="04:30">04:30</option>
	                                            			<option value="05:00">05:00</option>
	                                            			<option value="05:30">05:30</option>
	                                            			<option value="06:00">06:00</option>
	                                            			<option value="06:30">06:30</option>
	                                            			<option value="07:00">07:00</option>
	                                            			<option value="07:30">07:30</option>
	                                            			<option value="08:00">08:00</option>
	                                            			<option value="08:30">08:30</option>
	                                            			<option value="09:00">09:00</option>
	                                            			<option value="09:30">09:30</option>
	                                            			<option value="10:00">10:00</option>
	                                            			<option value="10:30">10:30</option>
	                                            			<option value="11:00">11:00</option>
	                                            			<option value="11:30">11:30</option>
	                                            			<option value="12:00">12:00</option>
	                                            			<option value="12:30">12:30</option>
	                                            			<option value="13:00">13:00</option>
	                                            			<option value="13:30">13:30</option>
	                                            			<option value="14:00">14:00</option>
	                                            			<option value="14:30">14:30</option>
	                                            			<option value="15:00">15:00</option>
	                                            			<option value="15:30">15:30</option>
	                                            			<option value="16:00">16:00</option>
	                                            			<option value="16:30">16:30</option>
	                                            			<option value="17:00">17:00</option>
	                                            			<option value="17:30">17:30</option>
	                                            			<option value="18:00">18:00</option>
	                                            			<option value="18:30">18:30</option>
	                                            			<option value="19:00">19:00</option>
	                                            			<option value="19:30">19:30</option>
	                                            			<option value="20:00">20:00</option>
	                                            			<option value="20:30">20:30</option>
	                                            			<option value="21:00">21:00</option>
	                                            			<option value="21:30">21:30</option>
	                                            			<option value="22:00">22:00</option>
	                                            			<option value="22:30">22:30</option>
	                                            			<option value="23:00">23:00</option>
	                                            			<option value="23:30">23:30</option>
	                                            		</select>
	                                            	~
	                                            	<input class="oneDay-end-date" type="date" name="oneDay-end-date">
	                                            		<select name="oneDay-end-time" id="oneDay-end-time">
	                                            			<option value="">끝 시각</option>
	                                            			<option value="00:00">00:00</option>
	                                            			<option value="00:30">00:30</option>
	                                            			<option value="01:00">01:00</option>
	                                            			<option value="01:30">01:30</option>
	                                            			<option value="02:00">02:00</option>
	                                            			<option value="02:30">02:30</option>
	                                            			<option value="03:00">03:00</option>
	                                            			<option value="03:30">03:30</option>
	                                            			<option value="04:00">04:00</option>
	                                            			<option value="04:30">04:30</option>
	                                            			<option value="05:00">05:00</option>
	                                            			<option value="05:30">05:30</option>
	                                            			<option value="06:00">06:00</option>
	                                            			<option value="06:30">06:30</option>
	                                            			<option value="07:00">07:00</option>
	                                            			<option value="07:30">07:30</option>
	                                            			<option value="08:00">08:00</option>
	                                            			<option value="08:30">08:30</option>
	                                            			<option value="09:00">09:00</option>
	                                            			<option value="09:30">09:30</option>
	                                            			<option value="10:00">10:00</option>
	                                            			<option value="10:30">10:30</option>
	                                            			<option value="11:00">11:00</option>
	                                            			<option value="11:30">11:30</option>
	                                            			<option value="12:00">12:00</option>
	                                            			<option value="12:30">12:30</option>
	                                            			<option value="13:00">13:00</option>
	                                            			<option value="13:30">13:30</option>
	                                            			<option value="14:00">14:00</option>
	                                            			<option value="14:30">14:30</option>
	                                            			<option value="15:00">15:00</option>
	                                            			<option value="15:30">15:30</option>
	                                            			<option value="16:00">16:00</option>
	                                            			<option value="16:30">16:30</option>
	                                            			<option value="17:00">17:00</option>
	                                            			<option value="17:30">17:30</option>
	                                            			<option value="18:00">18:00</option>
	                                            			<option value="18:30">18:30</option>
	                                            			<option value="19:00">19:00</option>
	                                            			<option value="19:30">19:30</option>
	                                            			<option value="20:00">20:00</option>
	                                            			<option value="20:30">20:30</option>
	                                            			<option value="21:00">21:00</option>
	                                            			<option value="21:30">21:30</option>
	                                            			<option value="22:00">22:00</option>
	                                            			<option value="22:30">22:30</option>
	                                            			<option value="23:00">23:00</option>
	                                            			<option value="23:30">23:30</option>
	                                            			<option value="23:30">24:00</option>
	                                            		</select>
	                                            	</td>
	                                            </tr>
	                                            <tr>
	                                            	<th style="width:100px;">개인 일정 <input type="radio" class="radio-individual" name="radio-selection" checked></th>
	                                            	<th>팀 일정 <input type="radio" class="radio-team" name="radio-selection"></th>
	                                            </tr>
	                                            <tr>
	                                            	<th style="width:100px;">참석자</th>
	                                            	<td colspan="2"><input type="search" class="inner-attendee-search" name="attendee-search" style="width:250px;">
	                                            	<input type="button" class="inner-attendee-search-button" name="inner-attendee-search-button" value="검색" style="margin:5px;"></td>
	                                            </tr>
	                                            <tr>
	                                            	<th>외부 참석자</th>
	                                            	<td colspan="2"><input type="text" class="outer-attendee" name="outer-attendee" style="width:250px;">
	                                            	<input type="button" class="outer-attendee-input-button" name="outer-attendee-input-button" value="추가" style="margin:5px;"></td>
	                                            </tr>
	                                            <tr>
	                                            	<th>장소</th><th colspan="2"><input type="text" class="oneDay-location" name="oneDay-location" style="width:250px;">
	                                            	<input type="button" class="location-add-button" name="location-add-button" value="추가" style="margin:5px;"></th>
	                                            </tr>
	                                            <tr>
	                                            	<th colspan="3">내용<input type="text" class="oneDay-location" name="oneDay-location" style="width:400px; height:200px;"></th>
	                                            </tr>
                                        	</table>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-danger waves-effect waves-light save-category"
                                    data-dismiss="modal">저장</button>
                                <button type="button" class="btn btn-secondary waves-effect"
                                    data-dismiss="modal">취소</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END MODAL -->
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
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
    <script src="${path}/resources/assets/extra-libs/taskboard/js/jquery.ui.touch-punch-improved.js"></script>
    <script src="${path}/resources/assets/extra-libs/taskboard/js/jquery-ui.min.js"></script>
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
<%--     <!--This page JavaScript -->
    <script src="${path}/resources/assets/libs/moment/min/moment.min.js"></script>
    <script src="${path}/resources/assets/libs/fullcalendar/dist/fullcalendar.min.js"></script>
    <script src="${path}/resources/dist/js/pages/calendar/cal-init.js"></script> --%>
    <script>
    </script>
</body>

</html>