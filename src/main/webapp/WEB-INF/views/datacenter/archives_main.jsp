<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
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
<link rel="icon" type="image/png" sizes="16x16"
	href="${path}/resources/assets/images/favicon.png">
<title>Severny admin Template - The Ultimate Multipurpose admin
	template</title>
<link rel="canonical"
	href="https://www.wrappixel.com/templates/severny-admin-template/" />
<!-- Custom CSS -->
<link rel="stylesheet" type="text/css"
	href="${path}/resources/assets/libs/quill/dist/quill.snow.css">
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
						<h4
							class="page-title text-truncate text-dark font-weight-medium mb-1">대용량
							자료실</h4>
						<div class="d-flex align-items-center">
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb m-0 p-0">
									<li class="breadcrumb-item text-muted active"
										aria-current="page">파일</li>
									<li class="breadcrumb-item text-muted" aria-current="page">문서</li>
								</ol>
							</nav>
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
			<div class="container-fluid note-has-grid">
				<ul
					class="nav nav-pills p-3 bg-white mb-3 rounded-pill align-items-center">
					<li class="nav-item"><a href="javascript:void(0)"
						class="nav-link rounded-pill note-link d-flex align-items-center active px-2 px-md-3 mr-0 mr-md-2"
						id="all-category"> <i class="icon-layers mr-1"></i><span
							class="d-none d-md-block">모든 파일</span></a></li>
					<li class="nav-item"><a href="javascript:void(0)"
						class="nav-link rounded-pill note-link d-flex align-items-center px-2 px-md-3 mr-0 mr-md-2"
						id="archives-social"> <i class="icon-share-alt mr-1"></i><span
							class="d-none d-md-block">개인 자료실</span></a></li>
					<li class="nav-item"><a href="javascript:void(0)"
						class="nav-link rounded-pill note-link d-flex align-items-center px-2 px-md-3 mr-0 mr-md-2"
						id="archives-important"> <i class="icon-tag mr-1"></i><span
							class="d-none d-md-block">중요 파일함</span></a></li>
					<li class="nav-item"><a href="javascript:void(0)"
						class="nav-link rounded-pill note-link d-flex align-items-center px-2 px-md-3 mr-0 mr-md-2"
						id="archives-discipline"> <i class="icon-briefcase mr-1"></i><span
							class="d-none d-md-block">사내 규율</span></a></li>
					<li class="nav-item"><a href="javascript:void(0)"
						class="nav-link rounded-pill note-link d-flex align-items-center px-2 px-md-3 mr-0 mr-md-2"
						id="archives-documents"> <i class="icon-briefcase mr-1"></i><span
							class="d-none d-md-block">행정 문서</span></a></li>
					<li class="nav-item ml-auto"><a href="javascript:void(0)"
						class="nav-link btn-primary rounded-pill d-flex align-items-center px-3"
						id="add-notes"><span class="d-none d-md-block font-14">파일
								올리기</span></a></li>
				</ul>
				<div class="tab-content">
					<div id="note-full-container" class="note-has-grid row">
						<div class="col-md-4 single-note-item archives-social">
							<div class="card card-body">
								<span class="side-stick"></span>
								<h5 class="note-title text-truncate w-75 mb-0"
									data-noteHeading="개인 파일1">
									개인 파일1 <i class="fa fa-paperclip"></i>
								</h5>
								<p class="note-date font-12 text-muted">2022-10-05(수정 날짜)</p>
								<div class="note-content">
									<p class="note-inner-content text-muted"
										data-noteContent="개인 파일1에 대한 설명">개인 파일1에 대한 설명</p>
								</div>
								<div class="d-flex align-items-center">
									<span class="mr-1"><i class="far fa-star favourite-note"></i></span>
									<span class="mr-1"><i
										class="far fa-trash-alt remove-note"></i></span>
								</div>
							</div>
						</div>
						<div class="col-md-4 single-note-item archives-social">
							<div class="card card-body ">
								<span class="side-stick"></span>
								<h5 class="note-title text-truncate w-75 mb-0"
									data-noteHeading="개인 파일2">
									개인 파일2 <i class="fa fa-paperclip"></i>
								</h5>
								<p class="note-date font-12 text-muted">2022-10-05(수정 날짜)</p>
								<div class="note-content">
									<p class="note-inner-content text-muted"
										data-noteContent="개인 파일2에 대한 설명">개인 파일2에 대한 설명</p>
								</div>
								<div class="d-flex align-items-center">
									<span class="mr-1"><i class="far fa-star favourite-note"></i></span>
									<span class="mr-1"><i
										class="far fa-trash-alt remove-note"></i></span>
								</div>
							</div>
						</div>
						<div
							class="col-md-4 single-note-item all-category archives-important">
							<div class="card card-body ">
								<span class="side-stick"></span>
								<h5 class="note-title text-truncate w-75 mb-0"
									data-noteHeading="중요 파일1">
									중요 파일1 <i class="fa fa-paperclip"></i>
								</h5>
								<p class="note-date font-12 text-muted">2022-10-05(수정 날짜)</p>
								<div class="note-content">
									<p class="note-inner-content text-muted"
										data-noteContent="중요 파일1에 대한 설명">중요 파일1에 대한 설명</p>
								</div>
								<div class="d-flex align-items-center">
									<span class="mr-1"><i class="far fa-star favourite-note"></i></span>
									<span class="mr-1"><i
										class="far fa-trash-alt remove-note"></i></span>
								</div>
							</div>
						</div>
						<div
							class="col-md-4 single-note-item all-category archives-important">
							<div class="card card-body ">
								<span class="side-stick"></span>
								<h5 class="note-title text-truncate w-75 mb-0"
									data-noteHeading="중요 파일2">
									중요 파일2 <i class="fa fa-paperclip"></i>
								</h5>
								<p class="note-date font-12 text-muted">2022-10-05(수정 날짜)</p>
								<div class="note-content">
									<p class="note-inner-content text-muted"
										data-noteContent="중요 파일2에 대한 설명">중요 파일2에 대한 설명</p>
								</div>
								<div class="d-flex align-items-center">
									<span class="mr-1"><i class="far fa-star favourite-note"></i></span>
									<span class="mr-1"><i
										class="far fa-trash-alt remove-note"></i></span>
								</div>
							</div>
						</div>
						<div
							class="col-md-4 single-note-item all-category archives-discipline">
							<div class="card card-body ">
								<span class="side-stick"></span>
								<h5 class="note-title text-truncate w-75 mb-0"
									data-noteHeading="사내 규율1">
									사내 규율1 <i class="fa fa-paperclip"></i>
								</h5>
								<p class="note-date font-12 text-muted">2022-10-04(수정 날짜)</p>
								<div class="note-content">
									<p class="note-inner-content text-muted"
										data-noteContent="사내 규율1에 대한 설명">사내 규율1에 대한 설명</p>
								</div>
								<div class="d-flex align-items-center">
									<span class="mr-1"><i class="far fa-star favourite-note"></i></span>
									<span class="mr-1"><i
										class="far fa-trash-alt remove-note"></i></span>
								</div>
							</div>
						</div>
						<div
							class="col-md-4 single-note-item all-category archives-discipline">
							<div class="card card-body ">
								<span class="side-stick"></span>
								<h5 class="note-title text-truncate w-75 mb-0"
									data-noteHeading="사내 규율2">
									사내 규율2 <i class="fa fa-paperclip"></i>
								</h5>
								<p class="note-date font-12 text-muted">2022-10-04(수정 날짜)</p>
								<div class="note-content">
									<p class="note-inner-content text-muted"
										data-noteContent="사내 규율2에 대한 설명">사내 규율2에 대한 설명</p>
								</div>
								<div class="d-flex align-items-center">
									<span class="mr-1"><i class="far fa-star favourite-note"></i></span>
									<span class="mr-1"><i
										class="far fa-trash-alt remove-note"></i></span>
								</div>
							</div>
						</div>
						<div
							class="col-md-4 single-note-item all-category archives-documents">
							<div class="card card-body ">
								<span class="side-stick"></span>
								<h5 class="note-title text-truncate w-75 mb-0"
									data-noteHeading="행정 문서1">
									행정 문서1 <i class="fa fa-paperclip"></i>
								</h5>
								<p class="note-date font-12 text-muted">2022-10-04(수정 날짜)</p>
								<div class="note-content">
									<p class="note-inner-content text-muted"
										data-noteContent="행정 문서1에 대한 설명">행정 문서1에 대한 설명</p>
								</div>
								<div class="d-flex align-items-center">
									<span class="mr-1"><i class="far fa-star favourite-note"></i></span>
									<span class="mr-1"><i
										class="far fa-trash-alt remove-note"></i></span>
								</div>
							</div>
						</div>
						<div
							class="col-md-4 single-note-item all-category archives-documents">
							<div class="card card-body ">
								<span class="side-stick"></span>
								<h5 class="note-title text-truncate w-75 mb-0"
									data-noteHeading="행정 문서2">
									행정 문서2 <i class="fa fa-paperclip"></i>
								</h5>
								<p class="note-date font-12 text-muted">2022-10-04(수정 날짜)</p>
								<div class="note-content">
									<p class="note-inner-content text-muted"
										data-noteContent="행정 문서2에 대한 설명">행정 문서2에 대한 설명</p>
								</div>
								<div class="d-flex align-items-center">
									<span class="mr-1"><i class="far fa-star favourite-note"></i></span>
									<span class="mr-1"><i
										class="far fa-trash-alt remove-note"></i></span>
								</div>
							</div>
						</div>
						<div
							class="col-md-4 single-note-item all-category archives-documents">
							<div class="card card-body ">
								<span class="side-stick"></span>
								<h5 class="note-title text-truncate w-75 mb-0"
									data-noteHeading="행정 문서3">
									행정 문서3 <i class="fa fa-paperclip"></i>
								</h5>
								<p class="note-date font-12 text-muted">2022-10-04(수정 날짜)</p>
								<div class="note-content">
									<p class="note-inner-content text-muted"
										data-noteContent="행정 문서3에 대한 설명">행정 문서3에 대한 설명</p>
								</div>
								<div class="d-flex align-items-center">
									<span class="mr-1"><i class="far fa-star favourite-note"></i></span>
									<span class="mr-1"><i
										class="far fa-trash-alt remove-note"></i></span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Modal Add notes -->
				<div class="modal fade" id="addnotesmodal" tabindex="-1"
					role="dialog" aria-labelledby="addnotesmodalTitle"
					aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content border-0">
							<div class="modal-header bg-info text-white">
								<h5 class="modal-title text-white">파일 올리기</h5>
								<button type="button" class="close text-white"
									data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<div class="notes-box">
									<div class="notes-content">
										<form action="javascript:void(0);" id="addnotesmodalTitle">
											<div class="row">
												<div class="col-md-12 mb-3">
													<div class="note-title">
														<label>파일 이름</label> <input type="text"
															id="note-has-title" class="form-control" minlength="25"
															placeholder="파일 이름">
													</div>
												</div>

												<div class="col-md-12">
													<div class="note-description">
														<label>설명</label>
														<textarea id="note-has-description" class="form-control"
															minlength="60" placeholder="설명" rows="3"></textarea>
													</div>
												</div>
												
												<div class="col-md-12">
													<div class="data-category">
													<br>
														<label>카테고리</label>
														<select name="data-category-select" id="data-category-select">
															<option value="">자료 카테고리</option>
															<option value="개인 자료실">개인 자료실</option>
															<option value="중요 파일함">중요 파일함</option>
															<option value="사내 규율">사내 규율</option>
															<option value="행정 문서">행정 문서</option>
														</select>
													</div>
												</div>
											</div>
										</form>
										<div class="col-sm-12 col-md-6">
										<br>
										<label class="card-title">파일 업로드</label>
											<div class="card" style="width:450px; align:center;">
												<div class="card-body">
													<h6 class="card-subtitle">
														파일 추가하기
													</h6>
													<form>
														<div class="input-group mb-3">
															<div class="input-group-prepend">
																<span class="input-group-text">업로드</span>
															</div>
															<div class="custom-file">
																<input type="file" class="custom-file-input"
																	id="inputGroupFile01"> <label
																	class="custom-file-label" for="inputGroupFile01">파일 선택</label>
															</div>
														</div>
													</form>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<button id="btn-n-save" class="float-left btn btn-success">저장</button>
								<button class="btn btn-danger" data-dismiss="modal">삭제</button>
								<button id="btn-n-add" class="btn btn-info" disabled>추가</button>
							</div>
						</div>
					</div>
				</div>
			</div>
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
		<a href="javascript:void(0)" class="service-panel-toggle"><i
			class="fa fa-spin fa-cog"></i></a>
		<div class="customizer-body">
			<div class="p-3 border-bottom">
				<!-- Sidebar -->
				<h5 class="font-weight-medium mb-2 mt-2">Layout Settings</h5>
				<div class="custom-control custom-checkbox mt-2">
					<input type="checkbox" class="custom-control-input sidebartoggler"
						name="collapssidebar" id="collapssidebar"> <label
						class="custom-control-label" for="collapssidebar">Collapse
						Sidebar</label>
				</div>
				<div class="custom-control custom-checkbox mt-2">
					<input type="checkbox" class="custom-control-input"
						name="sidebar-position" id="sidebar-position"> <label
						class="custom-control-label" for="sidebar-position">Fixed
						Sidebar</label>
				</div>
				<div class="custom-control custom-checkbox mt-2">
					<input type="checkbox" class="custom-control-input"
						name="header-position" id="header-position"> <label
						class="custom-control-label" for="header-position">Fixed
						Header</label>
				</div>
				<div class="custom-control custom-checkbox mt-2">
					<input type="checkbox" class="custom-control-input"
						name="boxed-layout" id="boxed-layout"> <label
						class="custom-control-label" for="boxed-layout">Boxed
						Layout</label>
				</div>
			</div>
			<div class="p-3 border-bottom">
				<!-- Header BG -->
				<h5 class="font-weight-medium mb-2 mt-2">Header Backgrounds</h5>
				<ul class="theme-color">
					<li class="theme-item"><a href="javascript:void(0)"
						class="theme-link" data-navbarbg="skin1"></a></li>
					<li class="theme-item"><a href="javascript:void(0)"
						class="theme-link" data-navbarbg="skin2"></a></li>
					<li class="theme-item"><a href="javascript:void(0)"
						class="theme-link" data-navbarbg="skin3"></a></li>
					<li class="theme-item"><a href="javascript:void(0)"
						class="theme-link" data-navbarbg="skin4"></a></li>
					<li class="theme-item"><a href="javascript:void(0)"
						class="theme-link" data-navbarbg="skin5"></a></li>
					<li class="theme-item"><a href="javascript:void(0)"
						class="theme-link" data-navbarbg="skin6"></a></li>
				</ul>
				<!-- Header BG -->
			</div>
			<div class="p-3 border-bottom">
				<!-- Logo BG -->
				<h5 class="font-weight-medium mb-2 mt-2">Sidebar Backgrounds</h5>
				<ul class="theme-color">
					<li class="theme-item"><a href="javascript:void(0)"
						class="theme-link" data-sidebarbg="skin1"></a></li>
					<li class="theme-item"><a href="javascript:void(0)"
						class="theme-link" data-sidebarbg="skin2"></a></li>
					<li class="theme-item"><a href="javascript:void(0)"
						class="theme-link" data-sidebarbg="skin3"></a></li>
					<li class="theme-item"><a href="javascript:void(0)"
						class="theme-link" data-sidebarbg="skin4"></a></li>
					<li class="theme-item"><a href="javascript:void(0)"
						class="theme-link" data-sidebarbg="skin5"></a></li>
					<li class="theme-item"><a href="javascript:void(0)"
						class="theme-link" data-sidebarbg="skin6"></a></li>
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
	<script
		src="${path}/resources/assets/libs/popper.js/dist/umd/popper.min.js"></script>
	<script
		src="${path}/resources/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- apps -->
	<script src="${path}/resources/dist/js/app.min.js"></script>
	<script src="${path}/resources/dist/js/app.init-menusidebar.js"></script>
	<script src="${path}/resources/dist/js/app-style-switcher.js"></script>
	<script src="${path}/resources/dist/js/feather.min.js"></script>
	<!-- slimscrollbar scrollbar JavaScript -->
	<script
		src="${path}/resources/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
	<script
		src="${path}/resources/assets/extra-libs/sparkline/sparkline.js"></script>
	<!--Menu sidebar -->
	<script src="${path}/resources/dist/js/sidebarmenu.js"></script>
	<!--Custom JavaScript -->
	<script src="${path}/resources/dist/js/custom.min.js"></script>
	<!--This page JavaScript -->
	<script src="${path}/resources/dist/js/pages/notes/notes.js"></script>
</body>

</html>