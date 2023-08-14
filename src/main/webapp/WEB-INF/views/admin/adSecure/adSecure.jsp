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
    <link href="${path}/resources/dist/css/style.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${path}/resources/assets/extra-libs/prism/prism.css">
    <link href="${path}/resources/commonCSS/index.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

<script type="text/javascript">
function openWindowPop(url, name){
    var options = 'top=10, left=10, width=1000, height=800, status=no, menubar=no, toolbar=no, resizable=no';
    window.open(url, name, options);
}	

$(function() {
    $("#all_check").change(function() {
       var is_checked = $("#all_check").is(":checked");
       $(".p_selectChk").prop("checked", is_checked); // is_checked : true
    });
 });
 
$(function(){
	//수정
$("#admin_del").click(function(){
	if(confirm("관리자를 삭제하시겠습니까?")){
	document.adSecureGroubee.action = "${path}/admin_del.ad?${_csrf.parameterName}=${_csrf.token}";
	document.adSecureGroubee.submit();
	} 
});
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
    <div id="main-wrapper">
        <div class="app-container"></div>
        <!-- ============================================================== -->
        <!-- Topbar header - style you can find in pages.scss -->
        <!-- ============================================================== -->
        
        <!-- ============================================================== -->
        <!-- Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <!-- 좌측고정 메뉴바 -->
        <%@ include file="/WEB-INF/views/admin/adminMenu.jsp" %>
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
						<h2 class="page-title text-truncate text-dark font-weight-medium mb-1">
							Admin Security</h2>
							<br>
						<div class="d-flex align-items-center">
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb m-0 p-0">
									<li class="breadcrumb-item active">
									<a href="${path}/adminMain.ad"><h2>Home</h2></a></li>
									<%-- <li class="breadcrumb-item active"aria-current="page">
									<a href="${path}/adSecure.ad">Admin Authority</a></li> --%>
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
               <%--  <div class="row button-group">
				    <div class="col-lg-2 col-md-4">
				        <button type="button" class="btn btn-rounded btn-block btn-outline-info" onclick = "location.href='${path}/adSecure.ad'">관리자 권한</button>
				    </div>
				    <div class="col-lg-2 col-md-4">
				        <button type="button" class="btn btn-rounded btn-block btn-outline-info" onclick = "location.href='${path}/adSecure2.ad'">기능 접근 제한</button>
				    </div>
				</div> --%>
            
                
                <!-- <div class="left-part list-of-tasks">
	                <a class="ti-menu ti-close btn btn-success show-left-part d-block d-md-none" href="javascript:void(0)"></a>
	                <div class="scrollable" style="height:100%;">
	                	<h4>권한 목록</h4>
	                    <div class="p-3">
	                        <a class="waves-effect waves-light btn btn-info d-block" href="javascript: void(0)" id="add-task"> + 추가</a>
	                    </div>
	                    <div class="divider"></div>
	                    <ul class="list-group">
	                       
	                        <li class="list-group-item p-0 border-0">
	                            <a href="javascript:void(0)" class="todo-link active list-group-item-action p-3 d-flex align-items-center" id="amin"> 기본 관리자 </a>
	                        </li>
	                        <li class="list-group-item p-0 border-0">
	                            <a href="javascript:void(0)" class="todo-link list-group-item-action p-3 d-flex align-items-center" id="assiduity_admin"> 근태 관리자 </a>
	                        </li>
	                        <li class="list-group-item p-0 border-0">
	                            <a href="javascript:void(0)" class="todo-link list-group-item-action p-3 d-flex align-items-center" id="personnel_admin"> 인사 관리자 </a>
	                        </li>
	                        <li class="list-group-item p-0 border-0">
	                            <a href="javascript:void(0)" class="todo-link list-group-item-action p-3 d-flex align-items-center" id="document _admin"> 결재문서 관리자 </a>
	                        </li>
	                        <li class="list-group-item p-0 border-0">
	                            <a href="javascript:void(0)" class="todo-link list-group-item-action p-3 d-flex align-items-center" id=" board_admin"> 게시판 관리자 </a>
	                        </li>
	                        <li class="list-group-item p-0 border-0">
	                            <a href="javascript:void(0)" class="todo-link list-group-item-action p-3 d-flex align-items-center" id="messenger_admin"> 메신저 관리자 </a>
	                        </li>
	                        <li class="list-group-item p-0 border-0">
	                            <a href="javascript:void(0)" class="todo-link list-group-item-action p-3 d-flex align-items-center" id="service_admin"> 서비스 관리자 </a>
	                        </li>
	                        <li class="list-group-item p-0 border-0">
	                            <a href="javascript:void(0)" class="todo-link list-group-item-action p-3 d-flex align-items-center" id="security_admin"> 보완 관리자 </a>
	                        </li>
	                    </ul>
	                </div>
	            </div> -->
	           
	            <br><br>
	            <div class="right-part mail-list overflow-auto" style="margin-left:0;">
                    <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">기본 관리자 (모든권한)</h4>
                                <br>
                                <a class="btn btn-secondary" href="javascript:openWindowPop('${path}/adminAdd.ad', 'popup');" role="button">운영자 추가</a>
                                <button type ="button" class="btn btn-secondary" id="admin_del">운영자 삭제</button>
                                <%-- <a class="btn btn-secondary" href="${path}/adminDel.ad" role="button">운영자 삭제</a> --%>                      	                                 
                                <br><br>
                                <div class="table-responsive">
                                	<form name="adSecureGroubee" method="post">
                                	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                    <table class="tablesaw no-wrap table-bordered table-hover table" data-tablesaw>
                                        <thead>
                                            <tr>
                                                <th>
                                                	<label for="all_check">
                                                		<input type="checkbox" id="all_check">
                                                		<span class="sr-only"></span>
                                                	</label>
                                                </th>
                                                <th>사번</th>
                                                <th>
                                                	이름(이메일)                                               	                                          
                                                </th>
                                                <th>부서</th>
                                                <th>권한</th>
                                                <th>관리자 등록일</th>                                              
                                            </tr>
                                        </thead>
                                        <c:forEach var="dto" items="${list}">
                                        
                                            <tr>
                                                <td>
                                                	<label for="chk">
                                                		<input type="checkbox" class="p_selectChk" name="chk_secureDel" id="chk" value="${dto.id}">
                                                		<span class="sr-only"></span>
                                                	</label>
                                                </td>
                                                <td>${dto.id}</td>
                                                <td>${dto.name}
                                                	(${dto.email_in})
                                                </td>                                                
                                                <td>${dto.depart_name}</td>
                                                
                                                <c:if test="${dto.authority eq 'ROLE_ATTEND'}">
                                                <td>근태관리자</td>
                                                </c:if>
                                                
                                                <c:if test="${dto.authority eq 'ROLE_APPROVAL'}">
                                                <td>결재문서관리자</td>
                                                </c:if>
                                                
                                                <c:if test="${dto.authority eq 'ROLE_SECURE'}">
                                                <td>보안관리자</td>
                                                </c:if>
                                                
                                                <c:if test="${dto.authority eq 'ROLE_BOARD'}">
                                                <td>게시판관리자</td>
                                                </c:if>
                                                
                                                <c:if test="${dto.authority eq 'ROLE_HUMAN'}">
                                                <td>인사관리자</td>
                                                </c:if>
                                                
                                                <c:if test="${dto.authority eq 'ROLE_NOTEBOX'}">
                                                <td>쪽지함관리자</td>
                                                </c:if>
                                               
                                                <c:if test="${dto.authority eq 'ROLE_DEPARTMENT'}">
                                                <td>부서관리자</td>
                                                </c:if>
                                                
                                                <c:if test="${dto.authority eq 'ROLE_SERVICE'}">
                                                <td>서비스관리자</td>
                                                </c:if>
                                                <td>${dto.adminhire}</td>  
                                                                                              
                                            </tr>	
                                        
                                        </c:forEach>
                                    </table>
                                    </form>
                                </div>
                            </div>
                        </div>               
                    <br><br>
                    <!--    <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">권한설정</h4>
                                <br>
                                <div class="table-responsive">
                                    <table class="tablesaw no-wrap table-bordered table-hover table" data-tablesaw>
                                        <thead>
                                            <tr>
                                                <th colspan="4" scope="col" class="border">
                                                	<label>
                                                		<input type="checkbox" data-tablesaw-checkall>
                                                		<span class="sr-only">Check All</span>기본 관리
                                                		<br><br>
	                             						<h6>메뉴 관리, 메뉴별 운영자 설정 등 사이트의 기본적인 설정을 제어합니다.</h6>
                                                	</label>
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody id="checkall-target">
                                            <tr>
                                                <td style="width:20%">
                                                	<label>
                                                		<input type="checkbox">
                                                		<span class="sr-only"> Select Row</span>서비스 메뉴관리
                                                	</label>
                                                </td>
                                                <td style="width:20%">
                                                	<label>
                                                		<input type="checkbox">
                                                		<span class="sr-only"> Select Row</span>공용용량 현황
                                                	</label>
                                                </td>                                               
                                                <td style="width:20%">
                                                	<label>
                                                		<input type="checkbox">
                                                		<span class="sr-only"> Select Row</span>메뉴 운영 권한 관리
                                                	</label>
                                                </td>
                                                <td style="width:20%">
                                                	<label>
                                                		<input type="checkbox">
                                                		<span class="sr-only"> Select Row</span>프로필 관리
                                                	</label>
                                                </td>                                                
                                            </tr>	
                                            <tr>
                                                <td>
                                                	<label>
                                                		<input type="checkbox">
                                                		<span class="sr-only"> Select Row</span>공지 사항 관리
                                                	</label>
                                                </td>
                                                <td>
                                                	<label>
                                                		<input type="checkbox">
                                                		<span class="sr-only"> Select Row</span>로고 및 테마
                                                	</label>
                                                </td>                                                
                                                <td>
                                                	<label>
                                                		<input type="checkbox">
                                                		<span class="sr-only"> Select Row</span>데이터 백업 관리
                                                	</label>
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                
                                <div class="table-responsive">
                                    <table class="tablesaw no-wrap table-bordered table-hover table" data-tablesaw>
                                        <thead>
                                            <tr>
                                                <th colspan="4" scope="col" class="border">
                                                	<label>
                                                		<input type="checkbox" data-tablesaw-checkall>
                                                		<span class="sr-only">Check All</span>보안 관리
                                                		<br><br>
	                             						<h6>로그인, 비밀번호 정택 설정, 접근 제한 등 보안에 관련된 부분을 제어합니다.</h6>
                                                	</label>
                                                </th>
                                            </tr>
                                        </thead>
                                    </table>
                                </div>
                                
                                  <div class="table-responsive">
                                    <table class="tablesaw no-wrap table-bordered table-hover table" data-tablesaw>
                                        <thead>
                                            <tr>
                                                <th colspan="4" scope="col" class="border">
                                                	<label>
                                                		<input type="checkbox" data-tablesaw-checkall>
                                                		<span class="sr-only">Check All</span>조직 관리
                                                		<br><br>
	                             						<h6>멤버, 부서, 직위 등 조직을 구성/관리 합니다.</h6>
                                                	</label>
                                                </th>
                                            </tr>
                                        </thead>
                                    </table>
                                </div>
                                
                                <div class="table-responsive">
                                    <table class="tablesaw no-wrap table-bordered table-hover table" data-tablesaw>
                                        <thead>
                                            <tr>
                                                <th colspan="4" scope="col" class="border">
                                                	<label>
                                                		<input type="checkbox" data-tablesaw-checkall>
                                                		<span class="sr-only">Check All</span>메뉴 관리
                                                		<br><br>
	                             						<h6>사이트에서 사용하는 각각의 메뉴를 설정/관리 합니다.</h6>
                                                	</label>
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody id="checkall-target">
                                            <tr>
                                                <td style="width:20%">
                                                	<label>
                                                		<input type="checkbox">
                                                		<span class="sr-only"> Select Row</span>홈
                                                	</label>
                                                </td>
                                                <td style="width:20%">
                                                	<label>
                                                		<input type="checkbox">
                                                		<span class="sr-only"> Select Row</span>전자결재
                                                	</label>
                                                </td>                                               
                                                <td style="width:20%">
                                                	<label>
                                                		<input type="checkbox">
                                                		<span class="sr-only"> Select Row</span>게시판
                                                	</label>
                                                </td>
                                                <td style="width:20%">
                                                	<label>
                                                		<input type="checkbox">
                                                		<span class="sr-only"> Select Row</span>문서관리
                                                	</label>
                                                </td>                                                
                                            </tr>	
                                            <tr>
                                                <td>
                                                	<label>
                                                		<input type="checkbox">
                                                		<span class="sr-only"> Select Row</span>메일
                                                	</label>
                                                </td>
                                                <td>
                                                	<label>
                                                		<input type="checkbox">
                                                		<span class="sr-only"> Select Row</span>보고
                                                	</label>
                                                </td>                                                
                                                <td>
                                                	<label>
                                                		<input type="checkbox">
                                                		<span class="sr-only"> Select Row</span>Work
                                                	</label>
                                                </td>
                                                <td>
                                                	<label>
                                                		<input type="checkbox">
                                                		<span class="sr-only"> Select Row</span>캘린더
                                                	</label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                	<label>
                                                		<input type="checkbox">
                                                		<span class="sr-only"> Select Row</span>예약
                                                	</label>
                                                </td>
                                                <td>
                                                	<label>
                                                		<input type="checkbox">
                                                		<span class="sr-only"> Select Row</span>근태관리
                                                	</label>
                                                </td>
                                                <td>
                                                	<label>
                                                		<input type="checkbox">
                                                		<span class="sr-only"> Select Row</span>설문
                                                	</label>
                                                </td>
                                                <td>
                                                	<label>
                                                		<input type="checkbox">
                                                		<span class="sr-only"> Select Row</span>주소록
                                                	</label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                	<label>
                                                		<input type="checkbox">
                                                		<span class="sr-only"> Select Row</span>커뮤니티
                                                	</label>
                                                </td>
                                                <td>
                                                	<label>
                                                		<input type="checkbox">
                                                		<span class="sr-only"> Select Row</span>메신저/모바일
                                                	</label>
                                                </td>
                                                <td>
                                                	<label>
                                                		<input type="checkbox">
                                                		<span class="sr-only"> Select Row</span>자료실
                                                	</label>
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>   -->
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
            <footer class="footer text-center text-muted">
                Copyright 2019. All Rights Reserved by Severny Admin
            </footer>
            <!-- ============================================================== -->
            <!-- End footer -->
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
    <!--Wave Effects -->
    <!-- themejs -->
    <!--Menu sidebar -->
    <script src="${path}/resources/dist/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="${path}/resources/dist/js/custom.min.js"></script>
</body>

</html>