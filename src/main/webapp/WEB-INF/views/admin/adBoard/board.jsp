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
    <link href="${path}/resources/assets/libs/chartist/dist/chartist.min.css" rel="stylesheet">
    <link href="${path}/resources/assets/extra-libs/c3/c3.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="${path}/resources/dist/css/style.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${path}/resources/assets/extra-libs/prism/prism.css">
    <link href="${path}/resources/commonCSS/index.css" rel="stylesheet">
    <link href="${path}/resources/assets/libs/tablesaw/dist/tablesaw.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

<script type="text/javascript">
$(function(){
	
	// 글 숨기기
	$("#updateBtn").click(function(){
		document.boardForm.action="${path}/adBoard/updateShow.ad";
		document.boardForm.submit();
	});	
	
	// 글 완전 삭제
	$("#deleteBtn").click(function(){
		if(confirm("데이터가 완전히 삭제됩니다. 정말로 삭제하시겠습니까?")){
			document.boardForm.action="${path}/adBoard/delete.ad";
			document.boardForm.submit();
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
						<h4 class="page-title text-truncate text-dark font-weight-medium mb-1">
							Admin Serivce</h4>
						<div class="d-flex align-items-center">
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb m-0 p-0">
									<li class="breadcrumb-item active">
									<a href="${path}/adminMain.ad">Home</a></li>
									<li class="breadcrumb-item active"aria-current="page">
									<a href="${path}/adBoard.ad">Board</a></li>
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
                <div class="row button-group">
				    <div class="col-lg-2 col-md-4">
				        <button type="button" class="btn btn-rounded btn-block btn-outline-info" onclick = "location.href='${path}/adBoard.ad'">자유게시판</button>
				    </div>
				    <div class="col-lg-2 col-md-4">
				        <button type="button" class="btn btn-rounded btn-block btn-outline-info" onclick = "location.href='${path}/adBoard.ad?category=1'">공지사항</button>
				    </div>
				</div>
				<hr><br>
					<div class="card">
                            <div class="card-body">
                                <h4 class="card-title">게시판 관리</h4>
                                <br>
                                <c:if test ="${sessionScope.authority == 'ROLE_BOARD' || sessionScope.authority == 'ROLE_ADMIN'}">
	                                <c:if test="${show != 0}">
	                                	<button class="btn btn-secondary" id="updateBtn">삭제</button>
	                                </c:if>
	                                <button class="btn btn-secondary" id="deleteBtn">영구 삭제</button>
	                                <c:if test="${category == 0 && show == 1}">
									   <button class="btn btn-rounded btn-outline-info" onclick = "location.href='${path}/adBoard.ad?show=0'">삭제된 게시물</button>
								    </c:if>
	                                <c:if test="${category == 1}">
									   <button class="btn btn-rounded btn-outline-info" onclick = "location.href='${path}/adBoard/insert.ad?show=0'">공지사항 작성</button>
								    </c:if> 
								</c:if>                	                                 
                                <br><br>
                                <div class="table-responsive">
                                    <table class="tablesaw no-wrap table-bordered table-hover table" data-tablesaw>
                                        <thead>
                                            <tr>
                                                <th scope="col" class="border">
                                                	<label>
                                                		<input type="checkbox" data-tablesaw-checkall>
                                                		<span class="sr-only">Check All</span>
                                                	</label>
                                                </th>
                                                <th scope="col" class="border">
                                                	작성자                                          	                                          
                                                </th>
                                                <th scope="col" class="border" style="width:70%">제목</th>
                                                <th scope="col" class="border">작성일</th>                                              
                                            </tr>
                                        </thead>
                                        
                                        
                                        <tbody id="checkall-target">
                                        <form name="boardForm" method="post">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	                                        <c:forEach var="dto" items="${list}">
		                                            <tr>
		                                                <td>
		                                                	<label>
		                                                		<input type="checkbox" value="${dto.num}" name="num">
		                                                		<span class="sr-only"> Select Row</span>
		                                                	</label>
		                                                </td>
		                                                <td>${dto.id}</td>     
		                                                <c:if test="${dto.category == 2}">
					                                    	<td class="py-2 px-3 no-wrap text-truncate" style="width:50%;">
																<a class="link font-weight-medium" href="adBoard/detail.ad?num=${dto.num}">
																<span class="badge badge-danger mr-2">필독</span>
																<span class="blue-grey-text text-darken-4">${dto.title} [${dto.comment_cnt}]</span>
						                                        </a>
					                                    	</td>
					                                    </c:if>
					                                    <c:if test="${dto.category != 2}">
						                                    <td class="py-2 px-3 no-wrap text-truncate">
						                                    	<a class="link" href="adBoard/detail.ad?num=${dto.num}">${dto.title} [${dto.comment_cnt}]</a>
						                                    </td>
					                                    </c:if>      
					                                    <td class="time text-right">${dto.reg_date}</td>                                       
		                                            </tr>	
	                                        </c:forEach> 
                                        </form>                                                                           
                                        </tbody>
                                    </table>
                                </div>
                                
                                <!-- 페이징  -->                    
			                    <div class="p-3 mt-4">
			                        <nav aria-label="Page navigation example">
			                            <ul class="pagination justify-content-center">
			                            	<!-- 이전 버튼 -->
			                            	<c:if test="${paging.startPage > 10}">
			                            		<li class="page-item"><a class="page-link" href="${path}/adBoard.ad?category=${category}&show=${show}&pageNum=${paging.prev}">Previous</a></li>
											</c:if>
											<!-- 페이지 -->
											<c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
												<li class="page-item"><a class="page-link" href="${path}/adBoard.ad?category=${category}&show=${show}&pageNum=${num}">${num}</a></li>
											</c:forEach>
											<!-- 다음 버튼 -->
											<c:if test="${paging.endPage < paging.pageCount}">
												<li class="page-item"><a class="page-link" href="${path}/adBoard.ad?category=${category}&show=${show}&pageNum=${paging.next}">Next</a></li>
											</c:if>
			                            </ul>
			                        </nav>
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
    <script src="${path}/resources/assets/libs/tablesaw/dist/tablesaw.jquery.js"></script>
    <script src="${path}/resources/assets/libs/tablesaw/dist/tablesaw-init.js"></script>
</body>

</html>