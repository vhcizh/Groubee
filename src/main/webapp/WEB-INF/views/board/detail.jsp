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
    <!-- Custom CSS -->
    <link href="${path}/resources/dist/css/style.min.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

<script type="text/javascript">

$(function(){
	
	// 댓글목록
	comment_list();
	
	// 댓글쓰기
	$("#insertBtn").click(function(){
		var commentbox = $("#commentbox").val();
		if(commentbox == "") {
			alert("내용을 입력하세요");
			$("#commentbox").focus();
			return false;
		}
		
		comment_add();
	});
	
	// 글삭제
	$("#boardDelete").click(function(){
		if(confirm("정말로 삭제하시겠습니까?")){
			location.href="${path}/boardDelete.bo?num=${dto.num}";
		}
	});
	
	// 글수정
	$("#boardEdit").click(function(){
		location.href="${path}/boardEdit.bo?num=${dto.num}";
	});
	
});

//댓글목록
function comment_list() {
	$.ajax({
		url: "${path}/comment.bo?${_csrf.parameterName}=${_csrf.token}",
		type:"post",
		data: "num=${dto.num}",
		success: function(result){
			$('#comment').html(result); // result : comment_list.jsp(컨트롤러에서 forward)
		},
		error: function(){
			alert('comment() 오류');
		}
	});
}

//댓글등록
function comment_add() {
	var param = {
		       "board_num": '${dto.num}',
		         "content" : $('#commentbox').val()
		      }

	$.ajax({
		url: "${path}/commentAdd.bo?${_csrf.parameterName}=${_csrf.token}",
		type: "post",
		data: param,
		success: function(){ // 댓글쓰기가 완료되면 서버에서 콜백함수 호출
			$('#commentbox').val(""); // 글내용 지움
			comment_list(); // 댓글목록 새로고침
		},
		error: function(){
			alert('commentAdd 오류');
		}
	});
}

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
                <div class="left-part" style="height:100%;">
                    <a class="ti-menu ti-close btn btn-success show-left-part d-block d-md-none"
                        href="javascript:void(0)"></a>
                    <div class="scrollable" style="height:100%;">
                        <div class="divider"></div>
                        <ul class="list-group">
                            <li>
                                <small class="p-3 grey-text text-lighten-1 db">Category</small>
                            </li>
                            <li class="list-group-item p-0 border-0">
                                <a href="board.bo?category=0" class="list-group-item-action p-3 d-block"><i
                                        class="mdi mdi-inbox font-18 v-middle mr-1"></i> 자유게시판</a>
                            </li>
                            <li class="list-group-item p-0 border-0">
                                <a href="board.bo?category=1" class="list-group-item-action p-3 d-block"> <i
                                        class="mdi mdi-star font-18 v-middle mr-1"></i> 공지사항 </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- Right Part -->
                <!-- ============================================================== -->
                <div class="right-part mail-list overflow-auto" style="height:100%;">
                    <!-- Action part -->
                    <!-- Button group part -->
                    <div class="bg-light p-3 d-flex align-items-center do-block">
                    
                    <c:if test="${dto.category==0}">
	                            <h4>자유게시판</h4>
                            </c:if>
                            <c:if test="${dto.category==1}">
	                            <h4>공지사항</h4>
                            </c:if>
                            
                         
                        <div class="ml-auto">
                            <div class="btn-group mr-2" role="group" aria-label="Button group with nested dropdown">
                                <div class="btn-group" role="group">
                                	<c:if test="${sessionScope.memberID == dto.id || sessionScope.authority == 'ROLE_BOARD' || sessionScope.authority == 'ROLE_ADMIN'}">
                                    <button id="email-dd1" type="button"
                                        class="btn btn-outline-secondary dropdown-toggle" data-toggle="dropdown"
                                        aria-haspopup="true" aria-expanded="false"><i
                                        class="mdi mdi-delete"></i> </button>
                                        
                                    
                                    <div class="dropdown-menu" aria-labelledby="email-dd1"> 
	                                    <a class="dropdown-item" id="boardEdit">수정</a> 
	                                    <a class="dropdown-item" id="boardDelete">삭제</a>
	                                </div>
	                                </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Action part -->
                    
<!-- 게시물 상세 페이지 -->
                    <div class="card-body border-bottom">
                        <h4 class="mb-0">${dto.title}</h4>
                        <h6 style="float:right">${dto.reg_date}</h6>
                    </div>
                    <div class="card-body border-bottom">
                        <div class="d-flex no-block align-items-center mb-5">
                            <div class="mr-2"><img src="${path}/resources/assets/images/users/1.jpg" alt="user"
                                    class="rounded-circle" width="45"></div>
                            <div class="">
                                <h5 class="mb-0 font-16 font-weight-medium">${dto.name}<small></small>
                                </h5><span>${dto.id}</span>
                            </div>
                        </div>
                        <p>${dto.content}</p>
                    </div>
                    
<!-- 댓글 -->                        
                        <div class="card-body border-bottom">
	                        <div class="border mt-3 p-3">
                            	<p class="pb-3" style="float:left">${sessionScope.memberName} / ${sessionScope.memberID}</p>
                            	<button id="insertBtn" class="btn btn-primary" style="float:right">등록</button>
	                            <textarea id="commentbox" class="form-control" placeholder="댓글을 입력하세요."></textarea>
	                        </div>
                        </div>
                        
                       <div id="comment">
                       <!-- 댓글목록 -->
                       </div>
                        
                    </div>
                </div>
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
    <script src="${path}/resources/dist/js/pages/email/email.min.js"></script>
    <script src="${path}/resources/assets/libs/summernote/dist/summernote-bs4.min.js"></script>
    <script src="${path}/resources/assets/libs/dropzone/dist/min/dropzone.min.js"></script>
    <script>
        $('#summernote').summernote({
            placeholder: '글 내용 작성',
            tabsize: 2,
            height: 250
        });
        Dropzone.autoDiscover = false;
        $(document).ready(function () {
            var myDrop = new Dropzone("#dzid", {
                url: '/file/post'
            });
        });
    </script>
</body>

</html>