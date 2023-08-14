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
<script type="text/javascript">
	// 부모창 새로고침
	opener.document.location.reload();
	
	$(function() {
		// cancleMsgBtn
		$('#cancleMsgBtn').click(function() {
			document.detailForm.action ="${path}/cancleMsg.me?${_csrf.parameterName}=${_csrf.token}";
			document.detailForm.submit();
		});
	});
</script>
</head>

                <!-- ============================================================== -->
                <!-- message detail -->
                <!-- ============================================================== -->
                <div>
                	<form name="detailForm" method="post" enctype="multipart/form-data" action="${path}/replyMsg.me?${_csrf.parameterName}=${_csrf.token}">
                		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	                	<c:forEach var="dto" items="${list}">
	                	<input type="hidden" name="message_num" value="${dto.message_num}">
	                    <div class="card-body border-bottom">
	                        <h4 class="mb-0">${dto.title}</h4>
	                    </div>
	                    <div class="card-body border-bottom">
		                	<c:choose>
					          <c:when test="${dto.id eq sessionScope.memberID}">
						      	<c:forEach var="getter_dto" items="${getter_list}">
						        <h5 class="mb-0 font-16 font-weight-medium">${getter_dto.id} ${getter_dto.depart_name} ${getter_dto.name}</h5>
					          	</c:forEach>
					          </c:when>
				          
					          <c:otherwise>
					          	<h5 class="mb-0 font-16 font-weight-medium">${dto.id} ${dto.depart_name} ${dto.name}</h5>
					          </c:otherwise>
				            </c:choose>
			            
	                    	<h6 style="margin-top:10px;">${dto.send_date}</h6>
	                     </div>
	                     <div class="card-body border-bottom">
	                     	 <div class="d-flex no-block align-items-center mb-5">
	                            <div class="" style="min-height:60%;">
	                        		<div style="margin-bottom:3%;">${dto.contents}</div>
	                        	</div>
	                        </div>
	                    </div>
	                    <div class="card-body">
	                        <h4><i class="fa fa-paperclip mr-2 mb-2"></i>첨부파일</h4>
				             <c:if test="${not empty dto.files}">
				             	<div class="row">
				               		<a class="btn" href="${dto.files}" download>${dto.files}</a>
				               	</div>
				             </c:if>
				             
				             <c:if test="${empty dto.files}">
				             	<p>첨부된 파일이 없습니다.</p>
				             </c:if>
		                     <button type="button" class="btn btn-dark mt-3" onclick="self.close()">닫기</button>
	                    </div>
	                    </c:forEach>
                    </form>
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
    <!--Wave Effects -->
    <!-- themejs -->
    <!--Menu sidebar -->
    <script src="${path}/resources/dist/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="${path}/resources/dist/js/custom.min.js"></script>
    <!-- This Page JS -->
    <script src="${path}/resources/dist/js/pages/email/email.min.js"></script>
</body>

</html>