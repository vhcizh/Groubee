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
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                <!-- Row -->
                <br><br>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header bg-info">
                                    <c:forEach var="dto" items="${list}" begin = "0" end = "0">	<!-- grb_draft 테이블 -->
                                        <h4 class="mb-0 text-white">처리정보 요약</h4>
                            </div>
                            <form class="form-horizontal">
                                <div class="form-body">
                                    <div class="card-body">
                                        <h4 class="card-title">문서정보</h4>
                                    </div>
                                    <hr class="mt-0 mb-5">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="control-label text-right col-md-3">카테고리:</label>
                                                    <div class="col-md-9">
                                                        <p class="form-control-static"> ${dto.category} </p>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--/span-->
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="control-label text-right col-md-3">제목:</label>
                                                    <div class="col-md-9">
                                                        <p class="form-control-static"> ${dto.title} </p>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--/span-->
                                        </div>
                                        
                                        <!--/row-->
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="control-label text-right col-md-3">내용: </label>
                                                    <div class="col-md-9">
                                                        <p class="form-control-static">${dto.content}</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                   </c:forEach>     
                                   <br><br>
                                        <!--/row-->
                                        <h4 class="card-title">결재정보</h4> 
                                    </div>
                                    <hr class="mt-0 mb-5">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <c:forEach var="dto2" items="${list2}" begin = "0" end = "0">
                                                    <label class="control-label text-right col-md-3">기안자:</label>  <!-- 사원 테이블 x approvalInfo -->
                                                    <div class="col-md-9">
                                                        <p class="form-control-static"> ${dto2.name} ${dto2.rank} </p>
                                                    </div>
                                                    
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="control-label text-right col-md-3">기안부서:</label>
                                                    <div class="col-md-9">
                                                        <p class="form-control-static"> ${dto2.depart_name} </p>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                            </div>
                                            <!--/span-->
                                           
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="control-label text-right col-md-3">결재자:</label>
                                                    <div class="col-md-9">
                                                        <p class="form-control-static"> 
	                                                        <c:forEach var="dto3" items="${list3}">
	                                                        <c:if test = "${dto3.co_approve == '결재'}">
	                                                        ${dto3.depart_name} ${dto3.name} ${dto3.rank} <br>
	                                                        </c:if>
	                                                        </c:forEach>
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--/span-->
                                        </div>
                                        <!--/row-->
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="control-label text-right col-md-3">협조자:</label>
                                                    <div class="col-md-9">
                                                        <p class="form-control-static">
                                                        <c:forEach var="dto3" items="${list3}">
                                                        <c:if test = "${dto3.co_approve == '협조'}">
                                                        ${dto3.depart_name} ${dto3.name} ${dto3.rank}<br>
                                                        </c:if>
                                                         </c:forEach>
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                         <!--/span-->                                          
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="control-label text-right col-md-3">처리날짜:</label>
                                                    <div class="col-md-9">
                                                        <p class="form-control-static"> 
	                                                        <c:forEach var="dto" items="${list}">
	                                                        ${dto.upday}<br>
	                                                        </c:forEach>
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                    </div>
                                    <hr>
                                    <div class="form-actions">
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="row">
                                                        <div class="col-md-offset-3 col-md-9">
                                                            <button type="submit" class="btn btn-danger" onclick = "self.close();">  창닫기</button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6"> </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!-- Row -->
                <!-- ============================================================== -->
                <!-- End PAge Content -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Right sidebar -->
                <!-- ============================================================== -->
                <!-- .right-sidebar -->
                <!-- ============================================================== -->
                <!-- End Right sidebar -->
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- footer -->
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
    <!--Wave Effects -->
    <!-- themejs -->
    <!--Menu sidebar -->
    <script src="${path}/resources/dist/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="${path}/resources/dist/js/custom.min.js"></script>
</body>

</html>