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
	<!-- Custom CSS -->
	<link rel="stylesheet" type="text/css" href="${path}/resources/assets/libs/quill/dist/quill.snow.css">
	<!-- Custom CSS -->
	<link href="${path}/resources/dist/css/style.min.css" rel="stylesheet">
	
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<style>
	input[type="checkbox"] {
        -webkit-appearance: none;
        position: relative;
        width: 16px;
        height: 16px;
        cursor: pointer;
        outline: none !important;
        border: 1px solid #3e5569;
        border-radius: 2px;
        background: #fbfbfb;
    }
 
    input[type="checkbox"]::before {
        content: "\2713";
        position: absolute;
        top: 50%;
        left: 50%;
        overflow: hidden;
        transform: scale(0) translate(-50%, -50%);
        line-height: 1;
    }
 
    input[type="checkbox"]:checked {
        background-color: #3f50f6;
        border-color: rgba(255, 255, 255, 0.3);
        color: white;
    }
 
    input[type="checkbox"]:checked::before {
        border-radius: 2px;
        transform: scale(1) translate(-50%, -50%)
    }
    
    .text-right{
      width:18%;
   }
</style>
<script type="text/javascript">
	$(function() {
		// 메세지 상단메뉴 활성화
		$('#tempoMsg a').addClass('active');
		
		// 체크박스
		// 전체 체크박스
		let chkList = $('input[name=chkList]:checkbox');
		
		// 체크된 체크박스의 값
		let iVal = $('input:checkbox[name=chkList]:checked').val();
		
		// checkbox의 전체 개수
		let AllChkLeng = $('input:checkbox[name=chkList]').length;
		
		// 체크된 값의 개수
		let chkLeng = $('input:checkbox[name=chkList]:checked').length;
		
		// 전체선택 버튼
		$('#chkAll').click(function() {
			let AllCheck = $(this).prop("checked");
			
			if(AllCheck == true) {
				// checkbox의 전체 체크
				chkList.prop('checked', true);
			} else {
				// checkbox의 전체 체크 해제
				chkList.prop('checked', false);
			}
			
		});
		
		// 개별 체크박스에 따른 전체체크박스 변경
		$(".chkList").click(function() {
			var total = $(".chkList").length;
			var checked = $(".chkList:checked").length;
			
			if(total != checked) $("#chkAll").prop("checked", false);
			else $("#chkAll").prop("checked", true); 
		});
		
		// deleteBtn
		$('#deleteBtn').click(function() {
			document.msgListForm.action ="${path}/goTrash.me";
			document.msgListForm.submit();
		});
		
		// forTempoDetail
		$('#forTempoDetail').click(function() {
			//document.msgListForm.action ="${path}/goTrash.me";
			document.msgListForm.submit();
		});
		/* document.getElementById('forTempoDetail').submit(); */
		
		
	});
	
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
                            <h4 class="page-title text-truncate text-dark font-weight-medium mb-1">쪽지</h4>
                        </div>
                    </div>
                </div>
	            <!-- ============================================================== -->
	            <!-- End Bread crumb and right sidebar toggle -->
	            <!-- ============================================================== -->
	            <!-- ============================================================== -->
	            <!-- Container fluid  -->
	            <!-- ============================================================== -->
    			<div class="container-fluid note-has-grid">
                    <!-- 상단 메세지 메뉴바 -->
			        <%@ include file="/WEB-INF/views/messenger/msgBox/msgMenu.jsp" %>
			        <!-- 상단 메세지 메뉴바 -->
                    <!-- ============================================================== -->
	                <!-- Right Part -->
	                <!-- ============================================================== -->
	                <div class="right-part mail-list overflow-auto" style="width:100%; margin-left:0;">
	                    <div class="p-3 b-b">
	                        <div class="d-flex align-items-center">
	                            <!-- <div>
	                                <h4>Mailbox </h4>
	                                <span>Here is the list of mail</span>
	                            </div> -->
	                            <!-- <div class="ml-auto" style="width:30%;">
	                                <input placeholder="Search Mail" type="text" class="form-control">
	                            </div> -->
	                        </div>
	                    </div>
	                    <!-- Action part -->
	                    <!-- Button group part -->
	                    <form name="msgListForm" method="post" id="forTempoDetailForm">
		                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		                    
		                    <div class="bg-light p-3 d-flex align-items-center do-block">
		                        <div class="btn-group mt-1 mb-1">
		                            <div class="custom-control custom-checkbox">
		                                <input type="checkbox" id="chkAll" class="chk" name="chkAll">
		                                <label for="chkAll">&nbsp;전체선택</label>
		                            </div>
		                        </div>
		                        <div class="ml-auto">
		                            <div class="btn-group mr-2" role="group" aria-label="Button group with nested dropdown">
		                                <button type="button" id="deleteBtn" class="btn btn-outline-secondary font-18"
		                                onclick="location.href='${path}/deleteMsg.me'">삭제</button>
		                            </div>
		                        </div>
		                    </div>
		                    <!-- Action part -->
		                    <!-- Mail list-->
	                    	<div class="table-responsive">
		                        <table class="table email-table no-wrap table-hover v-middle">
		                            <tbody>
		                            <c:forEach var="dto" items="${list}">
		                                <!-- row -->
		                                <tr class="unread">
		                                    <!-- label -->
                                       		<td class="chb" style="padding-right:0; width:5%;">
	                                        	<div class="custom-control custom-checkbox" style="width:0.1px;">
	                                            	<input type="checkbox" name="chkList" class="chkList" value="${dto.message_num}">
	                                            	<label for="${dto.message_num}"></label>
	                                        	</div>
	                                    	</td>
	                                    	<td class="py-2 px-3 no-wrap text-truncate" style="width:5%;">
	                                        </td>  	
	                                        <!-- User -->
		                                    <td class="user-name px-1 py-2" style="width:10%;">
		                                    	<input type="hidden" name="hiddenName" value="${dto.name}">
		                    					<input type="hidden" name="hiddenDepart_name" value="${dto.depart_name}">
		                                        <h6 class="mb-0 text-truncate font-weight-medium">${dto.id} ${dto.depart_name} ${dto.name}</h6>
		                                    </td>
		                                    <!-- Message -->
		                                    <td class="py-2 px-3 no-wrap text-truncate">
												<a href="javascript:void(0)" id="forTempoDetail" onclick="window.open('${path}/messageDetail_tempo.me?message_num=${dto.message_num}',
												'Message Detail','left=500, top=100, width=600, height=600, location=no, status=no, scrollbars=yes');"
												style="color:#000;">
	                                           		<span class="blue-grey-text text-darken-4">${dto.title}</span>
	                                        	</a>
                                        	</td> 		
			                                    
		                                    <!-- Attachment -->
		                                    <td class="clip px-1 py-2">
		                                    	<c:if test="${not empty dto.files}">
		                                    	<i class="fa fa-paperclip"></i>
		                                    	</c:if>
		                                    </td>
		                                    <!-- Time -->
		                                    <td class="time text-right">${dto.send_date}</td>
		                                </tr>
		                            </c:forEach>
		                    		</tbody>
		                        </table>
	                    	</div>
	                    </form>
	              	</div>
	             </div>
	            </div>
	                    <!-- <div class="tab-content">
	                    	<div id="note-full-container" class="note-has-grid row" style="width:100%;">
	                    	</div>
						</div> -->
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
	                    <input type="checkbox" class="custom-control-input sidebartoggler" name="collapssidebar" id="collapssidebar">
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
	</div>
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
		<!--This page JavaScript -->
		<script src="${path}/resources/dist/js/pages/notes/notes.js"></script>
</body>

</html>