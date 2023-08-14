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
    <!-- This Page CSS -->
    <link href="${path}/resources/assets/libs/summernote/dist/summernote-bs4.css" rel="stylesheet">
    <link href="${path}/resources/assets/libs/dropzone/dist/min/dropzone.min.css" rel="stylesheet">
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
       <%@ include file="/WEB-INF/views/admin/adminMenu.jsp" %>
        <!-- 좌측고정 메뉴바 -->
        <!-- ============================================================== -->
        <!-- Page wrapper  -->
        <!-- ============================================================== -->
        <div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="page-breadcrumb">
				<div class="row">
					<div class="col-7 align-self-center">
						<h4
							class="page-title text-truncate text-dark font-weight-medium mb-1">Admin
							Approval</h4>
						<div class="d-flex align-items-center">
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb m-0 p-0">
									<li class="breadcrumb-item active">
									<a href="${path}/adminMain.ad">Home</a></li>
									<li class="breadcrumb-item active"aria-current="page">
									<a href="${path}/approvalad.apad?stateid=com">Company Approval</a></li>
								</ol>
							</nav>
						</div>
					</div>
				</div>
			</div>
			<div class="container-fluid">
            <!-- ============================================================== -->
            <!-- Start Page Content -->
            <!-- ============================================================== -->
                <div class="row button-group">
<%-- 				    <div class="col-lg-2 col-md-4">
				        <button type="button" class="btn btn-rounded btn-block btn-outline-info" onclick="location.href='${path}/approvalAllad.apad?stateid=com'">완료문서함</button>
				    </div> --%>
				    <div class="col-lg-2 col-md-4">
				        <button type="button" class="btn btn-rounded btn-block btn-outline-info" onclick="location.href='${path}/approvalad.apad?stateid=com'">완료문서함</button>
				    </div>
				    <div class="col-lg-2 col-md-4">
				        <button type="button" class="btn btn-rounded btn-block btn-outline-info" onclick="location.href='${path}/approvalAllad.apad?stateid=on'">진행문서함</button>
				    </div>
				</div>
                    <!-- Button group part -->
                    <div class="bg-light p-3 d-flex align-items-center do-block">
                        <div>
                       		<c:forEach var="dto" items="${list}" begin="0" end="0"> 
                          	   통합문서관리함 > ${dto.state} 문서함
                    	    </c:forEach>
                         </div>
                    </div>
                    <!-- Action part -->
                    <!-- list-->
                    <div class="table-responsive">
                        <table class="table email-table no-wrap table-hover v-middle">
                                <!-- row -->
                                <tr class="unread">
                                    <!-- label -->
                                    <td class="user-image p-2">
                                    	<h6 class="mb-0 text-truncate font-weight-medium">상태
                                    </td>
                                    <td class="user-name px-1 py-2">
                                        <h6 class="mb-0 text-truncate font-weight-medium">문서번호</h6>
                                    </td>
                                    <td class="user-name px-1 py-2">
                                        <h6 class="mb-0 text-truncate font-weight-medium">카테고리</h6>
                                    </td>
                                    <td class="user-name px-1 py-2">
                                        <h6 class="mb-0 text-truncate font-weight-medium">문서양식</h6>
                                    </td>                                    
                                    <td class="py-2 px-3 no-wrap text-truncate"> 
                                        <h6 class="mb-0 text-truncate font-weight-medium">문서제목</h6>
                                    </td>
                                    <td class="time text-right"> 
                                    <h6 class="mb-0 text-truncate font-weight-medium">기안일 </h6></td>
                                </tr>
                                <!-- row -->
                                <c:forEach var = "dto" items="${list}">    
                                <tr class="unread">
                                    <!-- label -->
                                    <td class="user-image p-2">
                                    <span class="badge badge-danger blue-grey-text text-darken-4 mr-2">${dto.state}</span> </td>
                                    <td class="user-name px-1 py-2">
                                        <h6 class="mb-0 text-truncate font-weight-medium">bee-22-${dto.doc_id}</h6>
                                    </td>
                                    <td class="user-name px-1 py-2">
                                        <h6 class="mb-0 text-truncate font-weight-medium">${dto.category}</h6>
                                    </td>
                                    <td class="user-name px-1 py-2">
                                        <h6 class="mb-0 text-truncate font-weight-medium">${dto.form_name}</h6>
                                    </td>
                                    <td class="py-2 px-3 no-wrap text-truncate"> 
                                         <a onclick="window.open('${path}/comcheckoutDetail.fo?doc_id=${dto.doc_id}','기안문서','width=850,height=1100,scrollbars=yes');" href="${path}/approvalAllad.apad?stateid=${dto.stateid}"> 
                                         <span class="blue-grey-text text-darken-4">${dto.title}</span></a>
                                    </td>
                                    <td class="time text-right">${dto.upday}</td>
                                </tr>
                                </c:forEach>
                                <!-- row -->
                        </table>
                    </div>
                    <!-- 페이징  -->                    
                    <div class="p-3 mt-4">
                        <nav aria-label="Page navigation example">
                            <ul class="pagination justify-content-center">
                            	<!-- 이전 버튼 -->
                            	<c:forEach var = "dto" items="${list}" begin = "0" end = "0">
	                            	<c:if test="${paging.startPage > 10}">
	                            		<li class="page-item"><a class="page-link" href="${path}/approvalad.apad?stateid=${dto.stateid}&pageNum=${paging.prev}">Previous</a></li>
									</c:if>
									<!-- 페이지 -->
									<c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
										<li class="page-item"><a class="page-link" href="${path}/approvalad.apad?stateid=${dto.stateid}&pageNum=${num}">${num}</a></li>
									</c:forEach>
									<!-- 다음 버튼 -->
									<c:if test="${paging.endPage < paging.pageCount}">
										<li class="page-item"><a class="page-link" href="${path}/approvalad.apad?stateid=${dto.stateid}&pageNum=${paging.next}">Next</a></li>
									</c:if>
								</c:forEach>
                            </ul>
                        </nav>
                    </div>
                </div>
                </div>
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
    <script src="${path}/resources/dist/js/pages/email/email.min.js"></script>
    <script src="${path}/resources/assets/libs/summernote/dist/summernote-bs4.min.js"></script>
    <script src="${path}/resources/assets/libs/dropzone/dist/min/dropzone.min.js"></script>
</body>

</html>