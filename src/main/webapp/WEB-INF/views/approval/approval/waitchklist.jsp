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
    <div id="main-wrapper">
        <div class="app-container"></div>
        <!-- ============================================================== -->
        <!-- Topbar header - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <header class="topbar">
            <nav class="navbar top-navbar navbar-expand-md navbar-dark">
                <div class="navbar-header">
                    <!-- This is for the sidebar toggle which is visible on mobile only -->
                    <a class="nav-toggler waves-effect waves-light d-block d-md-none" href="javascript:void(0)"><i
                            class="ti-menu ti-close"></i></a>
                    <!-- ============================================================== -->
                    <!-- Logo -->
                    <!-- ============================================================== -->
                    <div class="navbar-brand">
                        <!-- Logo icon -->
                        <a href="index.html">
                            <b class="logo-icon">
                                <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
                                <!-- Dark Logo icon -->
                                <img src="${path}/resources/assets/images/logo-icon.png" alt="homepage" class="dark-logo" />
                                <!-- Light Logo icon -->
                                <img src="${path}/resources/assets/images/logo-icon.png" alt="homepage" class="light-logo" />
                            </b>
                            <!--End Logo icon -->
                            <!-- Logo text -->
                            <span class="logo-text">
                                <!-- dark Logo text -->
                                <img src="${path}/resources/assets/images/logo-text.png" alt="homepage" class="dark-logo" />
                                <!-- Light Logo text -->
                                <img src="${path}/resources/assets/images/logo-light-text.png" class="light-logo" alt="homepage" />
                            </span>
                        </a>
                        <a class="d-none d-md-block op-7 sidebartoggler" href="javascript:void(0)">
                            <span class="line line-1"></span>
                            <span class="line line-2"></span>
                            <span class="line line-3"></span>
                        </a>
                    </div>
                    <!-- ============================================================== -->
                    <!-- End Logo -->
                    <!-- ============================================================== -->
                    <!-- ============================================================== -->
                    <!-- Toggle which is visible on mobile only -->
                    <!-- ============================================================== -->
                    <a class="topbartoggler d-block d-md-none waves-effect waves-light" href="javascript:void(0)"
                        data-toggle="collapse" data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><i
                            class="ti-more"></i></a>
                </div>
                <!-- ============================================================== -->
                <!-- End Logo -->
                <!-- ============================================================== -->
                <div class="navbar-collapse collapse" id="navbarSupportedContent">
                    <!-- ============================================================== -->
                    <!-- toggle and nav items -->
                    <!-- ============================================================== -->
                    <ul class="navbar-nav float-left mr-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="app-chats.html" role="button">
                                <span class="d-block d-lg-none"><i data-feather="book-open"></i></span>
                                <span class="d-none d-lg-block">Live Feed</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="app-calendar.html">
                                <span class="d-block d-lg-none"><i data-feather="calendar"></i></span>
                                <span class="d-none d-lg-block">Calendar</span>
                            </a>
                        </li>
                        <li class="nav-item dropdown topbar-dropdown-width">
                            <a class="nav-link dropdown-toggle" href="javascript:void(0)" id="dd3" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="d-block d-lg-none"><i data-feather="activity"></i></span>
                                <span class="d-none d-lg-block">
                                    Apps
                                    <i class="svg-icon" data-feather="chevron-down"></i>
                                </span>
                            </a>
                            <div class="dropdown-menu" aria-labelledby="dd3">
                                <div class="row no-gutters">
                                    <div class="col-6">
                                        <a class="dropdown-item w-100 text-truncate" href="inbox-email.html"><i
                                                class="ti-email"></i><span class="ml-2">Email</span> </a>
                                        <a class="dropdown-item w-100 text-truncate" href="inbox-email-detail.html"><i
                                                class="icon-envelope-open"></i><span class="ml-2">Email
                                                Details</span></a>
                                        <a class="dropdown-item w-100 text-truncate" href="inbox-email-compose.html"><i
                                                class="ti-pencil-alt"></i><span class="ml-2">Email Compose</span></a>
                                    </div>
                                    <div class="col-6">
                                        <a class="dropdown-item w-100 text-truncate" href="ticket-list.html"><i
                                                class="ti-bookmark"></i><span class="ml-2">Ticket List</span></a>
                                        <a class="dropdown-item w-100 text-truncate" href="ticket-detail.html"><i
                                                class="ti-bookmark-alt"></i><span class="ml-2">Ticket Details</span></a>
                                        <a class="dropdown-item w-100 text-truncate" href="app-taskboard.html"><i
                                                class="icon-notebook"></i><span class="ml-2">Taskboard</span></a>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="nav-item dropdown topbar-dropdown-width">
                            <a class="nav-link dropdown-toggle" href="javascript:void(0)" id="dd4" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="d-block d-lg-none"><i data-feather="bar-chart-2"></i></span>
                                <span class="d-none d-lg-block">
                                    Elements
                                    <i class="svg-icon" data-feather="chevron-down"></i>
                                </span>
                            </a>
                            <div class="dropdown-menu" aria-labelledby="dd4">
                                <div class="scrollable" style="height: 180px;">
                                    <div class="row no-gutters">
                                        <div class="col-md-4">
                                            <a class="dropdown-item w-100 text-truncate" href="ui-buttons.html"><i
                                                    class="mdi mdi-toggle-switch"></i><span
                                                    class="ml-2">Buttons</span></a>
                                            <a class="dropdown-item w-100 text-truncate" href="ui-modals.html"><i
                                                    class="mdi mdi-tablet"></i><span class="ml-2">Modals</span></a>
                                            <a class="dropdown-item w-100 text-truncate" href="ui-tab.html"><i
                                                    class="mdi mdi-sort-variant"></i><span class="ml-2">Tabs</span></a>
                                            <a class="dropdown-item w-100 text-truncate"
                                                href="ui-tooltip-popover.html"><i
                                                    class="mdi mdi-image-filter-vintage"></i><span class="ml-2">Tooltips
                                                    & Popover</span></a>
                                            <a class="dropdown-item w-100 text-truncate" href="ui-notification.html"><i
                                                    class="mdi mdi-message-bulleted"></i><span
                                                    class="ml-2">Notifications</span></a>
                                        </div>
                                        <div class="col-md-4">
                                            <a class="dropdown-item w-100 text-truncate" href="ui-progressbar.html"><i
                                                    class="mdi mdi-poll"></i><span class="ml-2">Progressbar</span></a>
                                            <a class="dropdown-item w-100 text-truncate" href="ui-typography.html"><i
                                                    class="mdi mdi-format-line-spacing"></i><span
                                                    class="ml-2">Typography</span></a>
                                            <a class="dropdown-item w-100 text-truncate" href="ui-bootstrap.html"><i
                                                    class="mdi mdi-bootstrap"></i><span class="ml-2">Bootstrap
                                                    UI</span></a>
                                            <a class="dropdown-item w-100 text-truncate" href="ui-breadcrumb.html"><i
                                                    class="mdi mdi-equal"></i><span class="ml-2">Breadcrumb</span></a>
                                            <a class="dropdown-item w-100 text-truncate" href="ui-list-media.html"><i
                                                    class="mdi mdi-file-video"></i><span class="ml-2">List
                                                    Media</span></a>
                                        </div>
                                        <div class="col-md-4">
                                            <a class="dropdown-item w-100 text-truncate" href="ui-grid.html"><i
                                                    class="mdi mdi-view-module"></i><span class="ml-2">Grid</span></a>
                                            <a class="dropdown-item w-100 text-truncate" href="ui-carousel.html"><i
                                                    class="mdi mdi-view-carousel"></i><span
                                                    class="ml-2">Carousel</span></a>
                                            <a class="dropdown-item w-100 text-truncate" href="ui-scrollspy.html"><i
                                                    class="mdi mdi-application"></i><span
                                                    class="ml-2">Scrollspy</span></a>
                                            <a class="dropdown-item w-100 text-truncate" href="ui-toasts.html"><i
                                                    class="mdi mdi-credit-card-scan"></i><span
                                                    class="ml-2">Toasts</span></a>
                                            <a class="dropdown-item w-100 text-truncate" href="ui-spinner.html"><i
                                                    class="mdi mdi-apple-safari"></i><span
                                                    class="ml-2">Spinner</span></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                    <!-- ============================================================== -->
                    <!-- Right side toggle and nav items -->
                    <!-- ============================================================== -->
                    <ul class="navbar-nav float-right align-items-center">
                        <!-- ============================================================== -->
                        <!-- create new -->
                        <!-- ============================================================== -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="javascript:void(0)" id="dd5" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="d-block d-lg-none"><i data-feather="git-pull-request"></i></span>
                                <span class="d-none d-lg-block">English<i class="ml-2"
                                        data-feather="chevron-down"></i></span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dd5">
                                <a class="dropdown-item" href="#">French</a>
                                <a class="dropdown-item" href="#">Spanish</a>
                                <a class="dropdown-item" href="#">German</a>
                            </div>
                        </li>
                        <li class="nav-item d-none d-lg-block">
                            <li class="nav-item d-none d-lg-block">
                            <div class="nav-link search-bar">
                                <form class="my-2 my-lg-0">
                                    <div class="customize-input customize-input-v4">
                                        <input class="form-control" type="search" placeholder="Search"
                                            aria-label="Search">
                                        <i class="form-control-icon" data-feather="search"></i>
                                    </div>
                                </form>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <!-- ============================================================== -->
        <!-- End Topbar header -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <aside class="left-sidebar">
            <div class="user-profile text-center pt-2">
                <div class="d-flex align-items-center justify-content-center pb-3">
                    <div class="dropdown sub-dropdown">
                        <button class="btn profile-pic rounded-circle position-relative" type="button"
                            id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="badge rounded-circle badge-success profile-dd text-center"><i
                                    class="fas fa-angle-down"></i></span>
                        </button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            <a class="dropdown-item" href="javascript:void(0)"><i
                                    class="fas fa-circle text-success font-12 mr-2"></i>Active</a>
                            <a class="dropdown-item" href="javascript:void(0)"><i
                                    class="fas fa-circle text-warning font-12 mr-2"></i>Away</a>
                            <a class="dropdown-item" href="javascript:void(0)"><i
                                    class="fas fa-circle text-danger font-12 mr-2"></i>Do
                                not
                                Disturb</a>
                            <a class="dropdown-item" href="javascript:void(0)"><i
                                    class="fas fa-circle text-muted font-12 mr-2"></i>Invisible</a>
                        </div>
                    </div>
                </div>
                <div class="profile-section">
                    <p class="font-weight-light mb-0 font-18">Sandra Phillip</p>
                    <span class="op-7 font-14">Marketing Head</span>
                    <div class="row border-top border-bottom mt-3 no-gutters">
                        <div class="col-4 border-right">
                            <a class="p-3 d-block menubar-height dropdown-toggle" href="javascript:void(0)" id="bell"
                                data-display="static" role="button" data-toggle="dropdown" aria-haspopup="true"
                                aria-expanded="false">
                                <span><i data-feather="bell" class="svg-icon op-7"></i></span>
                                <span class="badge badge-danger badge-no rounded-circle">5</span>
                            </a>
                            <div class="dropdown-menu mailbox pt-0">
                                <ul class="list-style-none mb-0">
                                    <li>
                                        <div
                                            class="drop-title bg-info text-white position-relative rounded-top px-3 pt-2 pb-3">
                                            <h5 class="mb-0 mt-1 text-white">4 New</h5>
                                            <span class="font-weight-light">Notifications</span>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="message-center notifications position-relative"
                                            style="height:200px;">
                                            <!-- Message -->
                                            <a href="javascript:void(0)"
                                                class="message-item d-flex align-items-center border-bottom px-3 py-2">
                                                <div class="btn btn-danger rounded-circle btn-circle"><i
                                                        data-feather="airplay" class="text-white"></i></div>
                                                <div class="w-75 d-inline-block v-middle pl-2">
                                                    <h6 class="message-title mb-0 mt-1">Luanch Admin</h6>
                                                    <span class="font-12 text-nowrap d-block text-muted">Just see
                                                        the my new
                                                        admin!</span>
                                                    <span class="font-12 text-nowrap d-block text-muted">9:30
                                                        AM</span>
                                                </div>
                                            </a>
                                            <!-- Message -->
                                            <a href="javascript:void(0)"
                                                class="message-item d-flex align-items-center border-bottom px-3 py-2">
                                                <span class="btn btn-success rounded-circle btn-circle"><i
                                                        data-feather="calendar" class="text-white"></i></span>
                                                <div class="w-75 d-inline-block v-middle pl-2">
                                                    <h6 class="message-title mb-0 mt-1">Event today</h6>
                                                    <span
                                                        class="font-12 text-nowrap d-block text-muted text-truncate">Just
                                                        a reminder that you have event</span>
                                                    <span class="font-12 text-nowrap d-block text-muted">9:10
                                                        AM</span>
                                                </div>
                                            </a>
                                            <!-- Message -->
                                            <a href="javascript:void(0)"
                                                class="message-item d-flex align-items-center border-bottom px-3 py-2">
                                                <span class="btn btn-info rounded-circle btn-circle"><i
                                                        data-feather="settings" class="text-white"></i></span>
                                                <div class="w-75 d-inline-block v-middle pl-2">
                                                    <h6 class="message-title mb-0 mt-1">Settings</h6>
                                                    <span
                                                        class="font-12 text-nowrap d-block text-muted text-truncate">You
                                                        can customize this template
                                                        as you want</span>
                                                    <span class="font-12 text-nowrap d-block text-muted">9:08
                                                        AM</span>
                                                </div>
                                            </a>
                                            <!-- Message -->
                                            <a href="javascript:void(0)"
                                                class="message-item d-flex align-items-center border-bottom px-3 py-2">
                                                <span class="btn btn-primary rounded-circle btn-circle"><i
                                                        data-feather="box" class="text-white"></i></span>
                                                <div class="w-75 d-inline-block v-middle pl-2">
                                                    <h6 class="message-title mb-0 mt-1">Pavan kumar</h6> <span
                                                        class="font-12 text-nowrap d-block text-muted">Just
                                                        see the my admin!</span>
                                                    <span class="font-12 text-nowrap d-block text-muted">9:02
                                                        AM</span>
                                                </div>
                                            </a>
                                        </div>
                                    </li>
                                    <li>
                                        <a class="nav-link pt-2 border-top text-center text-dark"
                                            href="javascript:void(0);">
                                            <strong>Check all notifications</strong>
                                            <i class="fa fa-angle-right"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-4 border-right">
                            <a class="p-3 d-block menubar-height dropdown-toggle" id="bottom-sidebar" href="javascript:void(0)" data-display="static" role="button" data-toggle="dropdown" aria-haspopup="true"
                                aria-expanded="false">
                                <span><i data-feather="settings" class="svg-icon op-7"></i></span>
                            </a>
							<div class="dropdown-menu" aria-labelledby="dd5">
                                <a class="dropdown-item" href="#">Action</a>
                                <a class="dropdown-item" href="#">Action Here</a>
                            </div>
                        </div>
                        <div class="col-4">
                            <a class="p-3 d-block menubar-height dropdown-toggle" href="javascript:void(0)"
                                role="button" data-display="static" data-toggle="dropdown" aria-haspopup="true"
                                aria-expanded="false">
                                <span><i data-feather="message-square" class="svg-icon op-7"></i></span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right mailbox pt-0">
                                <ul class="list-style-none mb-0">
                                    <li>
                                        <div
                                            class="drop-title bg-info text-white position-relative rounded-top px-3 pt-2 pb-3">
                                            <h5 class="mb-0 mt-1 text-white">4 New</h5>
                                            <span class="font-weight-light">Chats</span>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="message-center notifications position-relative"
                                            style="height:200px;">
                                            <!-- Message -->
                                            <a href="javascript:void(0)"
                                                class="message-item d-flex align-items-center border-bottom px-3 py-2">
                                                <img class="img-fluid rounded-circle" alt="img" width="40" style="height:40px"
                                                    src="${path}/resources/assets/images/users/widget-table-pic1.jpg">
                                                <div class="w-75 d-inline-block v-middle pl-2">
                                                    <h6 class="message-title mb-0 mt-1">John Smith</h6>
                                                    <span class="font-12 text-nowrap d-block text-muted">Just see
                                                        the my new
                                                        admin!</span>
                                                    <span class="font-12 text-nowrap d-block text-muted">9:30
                                                        AM</span>
                                                </div>
                                            </a>
                                            <!-- Message -->
                                            <a href="javascript:void(0)"
                                                class="message-item d-flex align-items-center border-bottom px-3 py-2">
                                                <img class="img-fluid rounded-circle" alt="img" width="40" style="height:40px"
                                                    src="${path}/resources/assets/images/users/widget-table-pic2.jpg">
                                                <div class="w-75 d-inline-block v-middle pl-2">
                                                    <h6 class="message-title mb-0 mt-1">Peter John</h6>
                                                    <span
                                                        class="font-12 text-nowrap d-block text-muted text-truncate">Just
                                                        a reminder that you have event</span>
                                                    <span class="font-12 text-nowrap d-block text-muted">9:10
                                                        AM</span>
                                                </div>
                                            </a>
                                            <!-- Message -->
                                            <a href="javascript:void(0)"
                                                class="message-item d-flex align-items-center border-bottom px-3 py-2">
                                                <img class="img-fluid rounded-circle" alt="img" width="40" style="height:40px"
                                                    src="${path}/resources/assets/images/users/widget-table-pic3.jpg">
                                                <div class="w-75 d-inline-block v-middle pl-2">
                                                    <h6 class="message-title mb-0 mt-1">Steve Jobs</h6>
                                                    <span
                                                        class="font-12 text-nowrap d-block text-muted text-truncate">You
                                                        can customize this template
                                                        as you want</span>
                                                    <span class="font-12 text-nowrap d-block text-muted">9:08
                                                        AM</span>
                                                </div>
                                            </a>
                                            <!-- Message -->
                                            <a href="javascript:void(0)"
                                                class="message-item d-flex align-items-center border-bottom px-3 py-2">
                                                <img class="img-fluid rounded-circle" alt="img" width="40" style="height:40px"
                                                    src="${path}/resources/assets/images/users/widget-table-pic4.jpg">
                                                <div class="w-75 d-inline-block v-middle pl-2">
                                                    <h6 class="message-title mb-0 mt-1">John Deo</h6> <span
                                                        class="font-12 text-nowrap d-block text-muted">Just
                                                        see the my admin!</span>
                                                    <span class="font-12 text-nowrap d-block text-muted">9:02
                                                        AM</span>
                                                </div>
                                            </a>
                                        </div>
                                    </li>
                                    <li>
                                        <a class="nav-link pt-2 border-top text-center text-dark"
                                            href="javascript:void(0);">
                                            <strong>Check all notifications</strong>
                                            <i class="fa fa-angle-right"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Sidebar scroll-->
            <div class="scroll-sidebar">
                <!-- Sidebar navigation-->
                <nav class="sidebar-nav">
                    <ul id="sidebarnav">
                        <li class="nav-small-cap"><span class="hide-menu">Dashboards</span></li>
                        <li class="sidebar-item"> <a class="sidebar-link has-arrow" href="javascript:void(0)"
                                aria-expanded="false"><i data-feather="home" class="feather-icon"></i><span
                                    class="hide-menu">Dashboards
                                </span></a>
                            <ul aria-expanded="false" class="collapse  first-level base-level-line">
                                <li class="sidebar-item"><a href="index.html" class="sidebar-link"><span
                                            class="hide-menu"> Multipurpose </span></a></li>
                                <li class="sidebar-item"><a href="index2.html" class="sidebar-link"><span
                                            class="hide-menu"> Analytical <span
                                                class="badge badge-pill badge-success ml-2 font-weight-normal py-1 px-2">New</span></span></a>
                                </li>
                                <li class="sidebar-item"><a href="index3.html" class="sidebar-link"><span
                                            class="hide-menu"> eCommerce </span></a></li>
                                <li class="sidebar-item"><a href="index4.html" class="sidebar-link"><span
                                            class="hide-menu"> Modern </span></a></li>
                            </ul>
                        </li>
                        <li class="list-divider"></li>
                        <li class="nav-small-cap"><span class="hide-menu">Applications</span></li>
                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="app-chats.html"
                                aria-expanded="false"><i data-feather="message-circle" class="feather-icon"></i><span
                                    class="hide-menu">Chat Apps</span></a></li>
                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="app-notes.html"
                                aria-expanded="false"><i data-feather="book" class="feather-icon"></i><span
                                    class="hide-menu">Notes</span></a></li>
                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="app-todo.html"
                                aria-expanded="false"><i data-feather="check-circle" class="feather-icon"></i><span
                                    class="hide-menu">Todo</span></a></li>
                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="app-invoice.html"
                                aria-expanded="false"><i data-feather="clipboard" class="feather-icon"></i><span
                                    class="hide-menu">Invoice</span></a></li>
                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="app-calendar.html"
                                aria-expanded="false"><i data-feather="calendar" class="feather-icon"></i><span
                                    class="hide-menu">Calendar</span></a></li>
                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="app-taskboard.html"
                                aria-expanded="false"><i data-feather="layout" class="feather-icon"></i><span
                                    class="hide-menu">Taskboard</span></a></li>
                        <li class="sidebar-item"> <a class="sidebar-link has-arrow" href="javascript:void(0)"
                                aria-expanded="false"><i data-feather="mail" class="feather-icon"></i><span
                                    class="hide-menu">Inbox </span></a>
                            <ul aria-expanded="false" class="collapse  first-level base-level-line">
                                <li class="sidebar-item"><a href="inbox-email.html" class="sidebar-link"><span
                                            class="hide-menu"> Email
                                        </span></a></li>
                                <li class="sidebar-item"><a href="inbox-email-detail.html" class="sidebar-link"><span
                                            class="hide-menu"> Email
                                            Details
                                        </span></a></li>
                                <li class="sidebar-item"><a href="inbox-email-compose.html" class="sidebar-link"><span
                                            class="hide-menu">
                                            Email Compose </span></a></li>
                            </ul>
                        </li>
                        <li class="sidebar-item"> <a class="sidebar-link has-arrow" href="javascript:void(0)"
                                aria-expanded="false"><i data-feather="tag" class="feather-icon"></i><span
                                    class="hide-menu">Ticket
                                </span></a>
                            <ul aria-expanded="false" class="collapse  first-level base-level-line">
                                <li class="sidebar-item"><a href="ticket-list.html" class="sidebar-link"><span
                                            class="hide-menu"> Ticket List
                                        </span></a></li>
                                <li class="sidebar-item"><a href="ticket-detail.html" class="sidebar-link"><span
                                            class="hide-menu"> Ticket Details
                                        </span></a></li>
                            </ul>
                        </li>

                        <li class="list-divider"></li>
                        <li class="nav-small-cap"><span class="hide-menu">UI</span></li>
                        <li class="sidebar-item"> <a class="sidebar-link has-arrow" href="javascript:void(0)"
                                aria-expanded="false"><i data-feather="box" class="feather-icon"></i><span
                                    class="hide-menu">UI Elements </span></a>
                            <ul aria-expanded="false" class="collapse  first-level base-level-line">
                                <li class="sidebar-item"><a href="ui-buttons.html" class="sidebar-link"><span
                                            class="hide-menu"> Buttons
                                        </span></a></li>
                                <li class="sidebar-item"><a href="ui-modals.html" class="sidebar-link"><span
                                            class="hide-menu"> Modals </span></a>
                                </li>
                                <li class="sidebar-item"><a href="ui-tab.html" class="sidebar-link"><span
                                            class="hide-menu"> Tabs </span></a></li>
                                <li class="sidebar-item"><a href="ui-tooltip-popover.html" class="sidebar-link"><span
                                            class="hide-menu"> Tooltip &
                                            Popover</span></a></li>
                                <li class="sidebar-item"><a href="ui-notification.html" class="sidebar-link"><span
                                            class="hide-menu">Notification</span></a></li>
                                <li class="sidebar-item"><a href="ui-progressbar.html" class="sidebar-link"><span
                                            class="hide-menu">Progressbar</span></a></li>
                                <li class="sidebar-item"><a href="ui-typography.html" class="sidebar-link"><span
                                            class="hide-menu">Typography</span></a></li>
                                <li class="sidebar-item"><a href="ui-bootstrap.html" class="sidebar-link"><span
                                            class="hide-menu">Bootstrap
                                            UI</span></a></li>
                                <li class="sidebar-item"><a href="ui-breadcrumb.html" class="sidebar-link"><span
                                            class="hide-menu">Breadcrumb</span></a></li>
                                <li class="sidebar-item"><a href="ui-list-media.html" class="sidebar-link"><span
                                            class="hide-menu">List
                                            Media</span></a></li>
                                <li class="sidebar-item"><a href="ui-grid.html" class="sidebar-link"><span
                                            class="hide-menu"> Grid </span></a></li>
                                <li class="sidebar-item"><a href="ui-carousel.html" class="sidebar-link"><span
                                            class="hide-menu">
                                            Carousel</span></a></li>
                                <li class="sidebar-item"><a href="ui-scrollspy.html" class="sidebar-link"><span
                                            class="hide-menu">
                                            Scrollspy</span></a></li>
                                <li class="sidebar-item"><a href="ui-toasts.html" class="sidebar-link"><span
                                            class="hide-menu"> Toasts</span></a>
                                </li>
                                <li class="sidebar-item"><a href="ui-spinner.html" class="sidebar-link"><span
                                            class="hide-menu"> Spinner </span></a>
                                </li>
                            </ul>
                        </li>


                        <li class="sidebar-item"> <a class="sidebar-link has-arrow" href="javascript:void(0)"
                                aria-expanded="false"><i data-feather="sidebar" class="feather-icon"></i><span
                                    class="hide-menu">Cards
                                </span></a>
                            <ul aria-expanded="false" class="collapse  first-level base-level-line">
                                <li class="sidebar-item"><a href="ui-cards.html" class="sidebar-link"><span
                                            class="hide-menu"> Basic Cards
                                        </span></a></li>
                                <li class="sidebar-item"><a href="ui-card-customs.html" class="sidebar-link"><span
                                            class="hide-menu"> Custom
                                            Cards </span></a></li>
                                <li class="sidebar-item"><a href="ui-card-weather.html" class="sidebar-link"><span
                                            class="hide-menu"> Weather
                                            Cards </span></a></li>
                                <li class="sidebar-item"><a href="ui-card-draggable.html" class="sidebar-link"><span
                                            class="hide-menu">
                                            Draggable Cards </span></a></li>
                            </ul>
                        </li>

                        <li class="sidebar-item"> <a class="sidebar-link has-arrow" href="javascript:void(0)"
                                aria-expanded="false"><i data-feather="package" class="feather-icon"></i><span
                                    class="hide-menu">Components
                                </span></a>
                            <ul aria-expanded="false" class="collapse  first-level base-level-line">
                                <li class="sidebar-item"><a href="component-sweetalert.html" class="sidebar-link"><span
                                            class="hide-menu">
                                            Sweetalert
                                        </span></a></li>
                                <li class="sidebar-item"><a href="component-nestable.html" class="sidebar-link"><span
                                            class="hide-menu">
                                            Nestable </span></a></li>
                                <li class="sidebar-item"><a href="component-noui-slider.html" class="sidebar-link"><span
                                            class="hide-menu"> Noui
                                            Slider </span></a></li>
                                <li class="sidebar-item"><a href="component-rating.html" class="sidebar-link"><span
                                            class="hide-menu">Rating</span></a></li>
                                <li class="sidebar-item"><a href="component-toastr.html" class="sidebar-link"><span
                                            class="hide-menu">Toastr
                                        </span></a></li>
                            </ul>
                        </li>

                        <li class="sidebar-item"> <a class="sidebar-link has-arrow" href="javascript:void(0)"
                                aria-expanded="false"><i data-feather="sliders" class="feather-icon"></i><span
                                    class="hide-menu">Widgets
                                </span></a>
                            <ul aria-expanded="false" class="collapse  first-level base-level-line">
                                <li class="sidebar-item"><a href="widget-apps.html" class="sidebar-link"><span
                                            class="hide-menu"> Apps Widget
                                        </span></a></li>
                                <li class="sidebar-item"><a href="widget-charts.html" class="sidebar-link"><span
                                            class="hide-menu"> Charts
                                            Widget </span></a></li>
                                <li class="sidebar-item"><a href="widgets-data.html" class="sidebar-link"><span
                                            class="hide-menu"> Data Widget
                                        </span></a></li>
                            </ul>
                        </li>
                        <li class="list-divider"></li>
                        <li class="nav-small-cap"><span class="hide-menu">Forms</span></li>
                        <li class="sidebar-item"> <a class="sidebar-link has-arrow" href="javascript:void(0)"
                                aria-expanded="false"><i data-feather="codepen" class="feather-icon"></i><span
                                    class="hide-menu">Form Elements
                                </span></a>
                            <ul aria-expanded="false" class="collapse  first-level base-level-line">
                                <li class="sidebar-item"><a href="form-inputs.html" class="sidebar-link"><span
                                            class="hide-menu"> Form Inputs
                                        </span></a></li>
                                <li class="sidebar-item"><a href="form-input-groups.html" class="sidebar-link"><span
                                            class="hide-menu"> Form Groups
                                        </span></a></li>
                                <li class="sidebar-item"><a href="form-input-grid.html" class="sidebar-link"><span
                                            class="hide-menu"> Form Grids
                                        </span></a></li>
                                <li class="sidebar-item"><a href="form-checkbox-radio.html" class="sidebar-link"><span
                                            class="hide-menu"> Checkboxes &
                                            Radios
                                        </span></a></li>
                                <li class="sidebar-item"><a href="form-bootstrap-touchspin.html"
                                        class="sidebar-link"><span class="hide-menu"> Bootstrap
                                            Touchspin
                                        </span></a></li>
                                <li class="sidebar-item"><a href="form-bootstrap-switch.html" class="sidebar-link"><span
                                            class="hide-menu"> Bootstrap
                                            Switch </span></a></li>
                                <li class="sidebar-item"><a href="form-select2.html" class="sidebar-link"><span
                                            class="hide-menu"> Select2 </span></a>
                                </li>
                                <li class="sidebar-item"><a href="form-dual-listbox.html" class="sidebar-link"><span
                                            class="hide-menu"> Dual Listbox
                                        </span></a></li>
                            </ul>
                        </li>
                        <li class="sidebar-item"> <a class="sidebar-link has-arrow" href="javascript:void(0)"
                                aria-expanded="false"><i data-feather="file-text" class="feather-icon"></i><span
                                    class="hide-menu">Form Layouts
                                </span></a>
                            <ul aria-expanded="false" class="collapse  first-level base-level-line">
                                <li class="sidebar-item"><a href="form-basic.html" class="sidebar-link"><span
                                            class="hide-menu"> Form Basic </span></a>
                                </li>
                                <li class="sidebar-item"><a href="form-horizontal.html" class="sidebar-link"><span
                                            class="hide-menu"> Form Horizontal
                                        </span></a></li>
                                <li class="sidebar-item"><a href="form-actions.html" class="sidebar-link"><span
                                            class="hide-menu"> Form Actions
                                        </span></a></li>
                                <li class="sidebar-item"><a href="form-row-separator.html" class="sidebar-link"><span
                                            class="hide-menu"> Form Row
                                            Separator </span></a></li>
                                <li class="sidebar-item"><a href="form-bordered.html" class="sidebar-link"><span
                                            class="hide-menu"> Form Bordered
                                        </span></a></li>
                                <li class="sidebar-item"><a href="form-striped-row.html" class="sidebar-link"><span
                                            class="hide-menu"> Striped Rows
                                        </span></a></li>
                                <li class="sidebar-item"><a href="form-detail.html" class="sidebar-link"><span
                                            class="hide-menu"> Form Details
                                        </span></a></li>
                            </ul>
                        </li>
                        <li class="sidebar-item"> <a class="sidebar-link has-arrow" href="javascript:void(0)"
                                aria-expanded="false"><i data-feather="copy" class="feather-icon"></i><span
                                    class="hide-menu">Form Addons
                                </span></a>
                            <ul aria-expanded="false" class="collapse  first-level base-level-line">
                                <li class="sidebar-item"><a href="form-paginator.html" class="sidebar-link"><span
                                            class="hide-menu">
                                            Paginator</span></a></li>
                                <li class="sidebar-item"><a href="form-img-cropper.html" class="sidebar-link"><span
                                            class="hide-menu"> Image Cropper
                                        </span></a></li>
                                <li class="sidebar-item"><a href="form-dropzone.html" class="sidebar-link"><span
                                            class="hide-menu"> Dropzone
                                        </span></a></li>
                                <li class="sidebar-item"><a href="form-mask.html" class="sidebar-link"><span
                                            class="hide-menu"> Form Mask </span></a>
                                </li>
                                <li class="sidebar-item"><a href="form-typeahead.html" class="sidebar-link"><span
                                            class="hide-menu"> Form Typeahead
                                        </span></a></li>
                            </ul>
                        </li>
                        <li class="sidebar-item"> <a class="sidebar-link has-arrow" href="javascript:void(0)"
                                aria-expanded="false"><i data-feather="check-square" class="feather-icon"></i><span
                                    class="hide-menu">Form Validation
                                </span></a>
                            <ul aria-expanded="false" class="collapse  first-level base-level-line">
                                <li class="sidebar-item"><a href="form-bootstrap-validation.html"
                                        class="sidebar-link"><span class="hide-menu">
                                            Bootstrap Validation </span></a>
                                </li>
                                <li class="sidebar-item"><a href="form-custom-validation.html"
                                        class="sidebar-link"><span class="hide-menu">
                                            Custom
                                            Validation </span></a></li>
                            </ul>
                        </li>
                        <li class="sidebar-item"> <a class="sidebar-link has-arrow" href="javascript:void(0)"
                                aria-expanded="false"><i data-feather="droplet" class="feather-icon"></i><span
                                    class="hide-menu">Form Pickers
                                </span></a>
                            <ul aria-expanded="false" class="collapse  first-level base-level-line">
                                <li class="sidebar-item"><a href="form-picker-colorpicker.html"
                                        class="sidebar-link"><span class="hide-menu"> Form
                                            Colorpicker </span></a></li>
                                <li class="sidebar-item"><a href="form-picker-datetimepicker.html"
                                        class="sidebar-link"><span class="hide-menu"> Form
                                            Datetimepicker </span></a>
                                </li>
                                <li class="sidebar-item"><a href="form-picker-bootstrap-rangepicker.html"
                                        class="sidebar-link"><span class="hide-menu">
                                            Form Bootstrap Rangepicker
                                        </span></a></li>
                                <li class="sidebar-item"><a href="form-picker-bootstrap-datepicker.html"
                                        class="sidebar-link"><span class="hide-menu">
                                            Form Bootstrap Datepicker
                                        </span></a></li>
                                <li class="sidebar-item"><a href="form-picker-material-datepicker.html"
                                        class="sidebar-link"><span class="hide-menu">
                                            Form Material Datepicker
                                        </span></a></li>
                            </ul>
                        </li>
                        <li class="sidebar-item"> <a class="sidebar-link has-arrow" href="javascript:void(0)"
                                aria-expanded="false"><i data-feather="clipboard" class="feather-icon"></i><span
                                    class="hide-menu">Form Editor
                                </span></a>
                            <ul aria-expanded="false" class="collapse  first-level base-level-line">
                                <li class="sidebar-item"><a href="form-editor-ckeditor.html" class="sidebar-link"><span
                                            class="hide-menu"> Ckeditor
                                        </span></a></li>
                                <li class="sidebar-item"><a href="form-editor-quill.html" class="sidebar-link"><span
                                            class="hide-menu"> Quill Editor
                                        </span></a></li>
                                <li class="sidebar-item"><a href="form-editor-summernote.html"
                                        class="sidebar-link"><span class="hide-menu"> Summernote
                                            Editor </span></a></li>
                                <li class="sidebar-item"><a href="form-editor-tinymce.html" class="sidebar-link"><span
                                            class="hide-menu"> Tinymce Editor
                                        </span></a></li>
                            </ul>
                        </li>
                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="form-wizard.html"
                                aria-expanded="false"><i data-feather="edit" class="feather-icon"></i><span
                                    class="hide-menu">Form Wizard</span></a></li>
                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="form-repeater.html"
                                aria-expanded="false"><i data-feather="crop" class="feather-icon"></i><span
                                    class="hide-menu">Form Repeater</span></a></li>
                        <li class="list-divider"></li>
                        <li class="nav-small-cap"><span class="hide-menu">Tables</span></li>
                        <li class="sidebar-item"> <a class="sidebar-link has-arrow" href="javascript:void(0)"
                                aria-expanded="false"><i data-feather="grid" class="feather-icon"></i><span
                                    class="hide-menu">Bootstrap Tables
                                </span></a>
                            <ul aria-expanded="false" class="collapse  first-level base-level-line">
                                <li class="sidebar-item"><a href="table-basic.html" class="sidebar-link"><span
                                            class="hide-menu"> Basic Table
                                        </span></a></li>
                                <li class="sidebar-item"><a href="table-dark-basic.html" class="sidebar-link"><span
                                            class="hide-menu"> Dark Basic Table
                                        </span></a></li>
                                <li class="sidebar-item"><a href="table-sizing.html" class="sidebar-link"><span
                                            class="hide-menu"> Sizing Table
                                        </span></a></li>
                                <li class="sidebar-item"><a href="table-layout-coloured.html" class="sidebar-link"><span
                                            class="hide-menu"> Coloured
                                            Table Layout
                                        </span></a></li>
                            </ul>
                        </li>
                        <li class="sidebar-item"> <a class="sidebar-link has-arrow" href="javascript:void(0)"
                                aria-expanded="false"><i data-feather="hard-drive" class="feather-icon"></i><span
                                    class="hide-menu">Datatables
                                </span></a>
                            <ul aria-expanded="false" class="collapse  first-level base-level-line">
                                <li class="sidebar-item"><a href="table-datatable-basic.html" class="sidebar-link"><span
                                            class="hide-menu"> Basic
                                            Datatables
                                            Layout </span></a></li>
                                <li class="sidebar-item"><a href="table-datatable-api.html" class="sidebar-link"><span
                                            class="hide-menu"> API
                                        </span></a></li>
                                <li class="sidebar-item"><a href="table-datatable-advanced.html"
                                        class="sidebar-link"><span class="hide-menu"> Advanced
                                            Datatables </span></a>
                                </li>
                            </ul>
                        </li>
                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="table-jsgrid.html"
                                aria-expanded="false"><i data-feather="disc" class="feather-icon"></i><span
                                    class="hide-menu">Table Jsgrid</span></a></li>
                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="table-responsive.html"
                                aria-expanded="false"><i data-feather="smartphone" class="feather-icon"></i><span
                                    class="hide-menu">Table Responsive</span></a></li>
                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="table-footable.html"
                                aria-expanded="false"><i data-feather="command" class="feather-icon"></i><span
                                    class="hide-menu">Table Footable</span></a></li>
                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="table-editable.html"
                                aria-expanded="false"><i data-feather="edit-2" class="feather-icon"></i><span
                                    class="hide-menu">Table Editable</span></a></li>
                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="table-bootstrap.html"
                                aria-expanded="false"><i data-feather="layers" class="feather-icon"></i><span
                                    class="hide-menu">Table Bootstrap</span></a></li>
                        <li class="list-divider"></li>
                        <li class="nav-small-cap"><span class="hide-menu">Charts</span></li>
                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="chart-morris.html"
                                aria-expanded="false"><i data-feather="loader" class="feather-icon"></i><span
                                    class="hide-menu">Morris Chart</span></a></li>

                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="chart-chart-js.html"
                                aria-expanded="false"><i data-feather="pie-chart" class="feather-icon"></i><span
                                    class="hide-menu">ChartJs</span></a></li>

                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="chart-sparkline.html"
                                aria-expanded="false"><i data-feather="radio" class="feather-icon"></i><span
                                    class="hide-menu">Sparkline Chart</span></a></li>

                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="chart-chartist.html"
                                aria-expanded="false"><i data-feather="trello" class="feather-icon"></i><span
                                    class="hide-menu">Chartist Chart</span></a></li>

                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="chart-knob.html"
                                aria-expanded="false"><i data-feather="slack" class="feather-icon"></i><span
                                    class="hide-menu">Knob Chart</span></a></li>

                        <li class="sidebar-item"> <a class="sidebar-link has-arrow" href="javascript:void(0)"
                                aria-expanded="false"><i data-feather="bar-chart-2" class="feather-icon"></i><span
                                    class="hide-menu">C3 Charts
                                </span></a>
                            <ul aria-expanded="false" class="collapse  first-level base-level-line">
                                <li class="sidebar-item"><a href="chart-c3-axis.html" class="sidebar-link"><span
                                            class="hide-menu"> C3 Axis Chart
                                        </span></a></li>
                                <li class="sidebar-item"><a href="chart-c3-bar.html" class="sidebar-link"><span
                                            class="hide-menu"> C3 Bar Chart
                                        </span></a></li>
                                <li class="sidebar-item"><a href="chart-c3-data.html" class="sidebar-link"><span
                                            class="hide-menu"> C3 Data Chart
                                        </span></a></li>
                                <li class="sidebar-item"><a href="chart-c3-line.html" class="sidebar-link"><span
                                            class="hide-menu"> C3 Line Chart
                                        </span></a></li>
                            </ul>
                        </li>
                        <li class="sidebar-item"> <a class="sidebar-link has-arrow" href="javascript:void(0)"
                                aria-expanded="false"><i data-feather="bar-chart" class="feather-icon"></i><span
                                    class="hide-menu">Echarts
                                </span></a>
                            <ul aria-expanded="false" class="collapse  first-level base-level-line">
                                <li class="sidebar-item"><a href="chart-echart-basic.html" class="sidebar-link"><span
                                            class="hide-menu"> Basic
                                            Echarts</span></a></li>
                                <li class="sidebar-item"><a href="chart-echart-bar.html" class="sidebar-link"><span
                                            class="hide-menu"> Bar
                                            Echarts</span></a></li>
                                <li class="sidebar-item"><a href="chart-echart-pie-doughnut.html"
                                        class="sidebar-link"><span class="hide-menu"> Pie &
                                            Doughnut Echarts </span></a>
                                </li>
                            </ul>
                        </li>

                        <li class="list-divider"></li>
                        <li class="nav-small-cap"><span class="hide-menu">Sample Pages</span></li>

                        <li class="sidebar-item"> <a class="sidebar-link has-arrow" href="javascript:void(0)"
                                aria-expanded="false"><i data-feather="shopping-cart" class="feather-icon"></i><span
                                    class="hide-menu">Ecommerce Pages
                                </span></a>
                            <ul aria-expanded="false" class="collapse  first-level base-level-line">
                                <li class="sidebar-item"><a href="eco-products.html" class="sidebar-link"><span
                                            class="hide-menu"> Products </span></a></li>
                                <li class="sidebar-item"><a href="eco-products-cart.html" class="sidebar-link"><span
                                            class="hide-menu"> Products Cart </span></a></li>
                                <li class="sidebar-item"><a href="eco-products-edit.html" class="sidebar-link"><span
                                            class="hide-menu"> Products Edit </span></a></li>
                                <li class="sidebar-item"><a href="eco-products-detail.html" class="sidebar-link"><span
                                            class="hide-menu">Products Details</span></a></li>
                                <li class="sidebar-item"><a href="eco-products-orders.html" class="sidebar-link"><span
                                            class="hide-menu"> Products Orders</span></a></li>
                                <li class="sidebar-item"><a href="eco-products-checkout.html" class="sidebar-link"><span
                                            class="hide-menu"> Products Checkout </span></a></li>
                            </ul>
                        </li>

                        <li class="sidebar-item"> <a class="sidebar-link has-arrow" href="javascript:void(0)"
                                aria-expanded="false"><i data-feather="check-square" class="feather-icon"></i><span
                                    class="hide-menu">Sample Pages
                                </span></a>
                            <ul aria-expanded="false" class="collapse  first-level base-level-line">
                                <li class="sidebar-item"><a href="starter-kit.html" class="sidebar-link"><span
                                            class="hide-menu"> Starter Kit
                                        </span></a></li>
                                <li class="sidebar-item"><a href="pages-utility-classes.html" class="sidebar-link"><span
                                            class="hide-menu"> Helper Classes </span></a></li>
                                <li class="sidebar-item"><a href="pages-animation.html" class="sidebar-link"><span
                                            class="hide-menu"> Animation </span></a></li>
                                <li class="sidebar-item"><a href="pages-search-result.html" class="sidebar-link"><span
                                            class="hide-menu">Search Result</span></a></li>
                                <li class="sidebar-item"><a href="pages-gallery.html" class="sidebar-link"><span
                                            class="hide-menu">Gallery</span></a></li>
                                <li class="sidebar-item"><a href="pages-treeview.html" class="sidebar-link"><span
                                            class="hide-menu">Treeview</span></a></li>
                                <li class="sidebar-item"><a href="pages-block-ui.html" class="sidebar-link"><span
                                            class="hide-menu">Block UI</span></a></li>
                                <li class="sidebar-item"><a href="pages-session-timeout.html" class="sidebar-link"><span
                                            class="hide-menu">Session Timeout</span></a></li>
                                <li class="sidebar-item"><a href="pages-session-idle-timeout.html"
                                        class="sidebar-link"><span class="hide-menu">Session Idle Timeout</span></a>
                                </li>
                                <li class="sidebar-item"><a href="pages-maintenance.html" class="sidebar-link"><span
                                            class="hide-menu">Maintenance Page</span></a></li>
                            </ul>
                        </li>

                        <li class="sidebar-item"> <a class="sidebar-link has-arrow" href="javascript:void(0)"
                                aria-expanded="false"><i data-feather="lock" class="feather-icon"></i><span
                                    class="hide-menu">Authentication
                                </span></a>
                            <ul aria-expanded="false" class="collapse  first-level base-level-line">
                                <li class="sidebar-item"><a href="authentication-login1.html" class="sidebar-link"><span
                                            class="hide-menu">
                                            Login
                                        </span></a></li>
                                <li class="sidebar-item"><a href="authentication-login2.html" class="sidebar-link"><span
                                            class="hide-menu">
                                            Login 2 </span></a></li>
                                <li class="sidebar-item"><a href="authentication-register1.html"
                                        class="sidebar-link"><span class="hide-menu"> Register </span></a></li>
                                <li class="sidebar-item"><a href="authentication-register2.html"
                                        class="sidebar-link"><span class="hide-menu">Register 2</span></a></li>
                                <li class="sidebar-item"><a href="authentication-lockscreen.html"
                                        class="sidebar-link"><span class="hide-menu">Lock Screen
                                        </span></a></li>
                                <li class="sidebar-item"><a href="authentication-recover-password.html"
                                        class="sidebar-link"><span class="hide-menu">Recover Password
                                        </span></a></li>
                            </ul>
                        </li>

                        <li class="sidebar-item"> <a class="sidebar-link has-arrow" href="javascript:void(0)"
                                aria-expanded="false"><i data-feather="users" class="feather-icon"></i><span
                                    class="hide-menu">Users
                                </span></a>
                            <ul aria-expanded="false" class="collapse  first-level base-level-line">
                                <li class="sidebar-item"><a href="ui-user-card.html" class="sidebar-link"><span
                                            class="hide-menu">
                                            User Cards
                                        </span></a></li>
                                <li class="sidebar-item"><a href="ui-user-contacts.html" class="sidebar-link"><span
                                            class="hide-menu">
                                            User Contact </span></a></li>
                                <li class="sidebar-item"><a href="pages-profile.html" class="sidebar-link"><span
                                            class="hide-menu">
                                            User Profile </span></a></li>
                            </ul>
                        </li>

                        <li class="sidebar-item"> <a class="sidebar-link has-arrow" href="javascript:void(0)"
                                aria-expanded="false"><i data-feather="feather" class="feather-icon"></i><span
                                    class="hide-menu">Icons
                                </span></a>
                            <ul aria-expanded="false" class="collapse  first-level base-level-line">
                                <li class="sidebar-item"><a href="icon-fontawesome.html" class="sidebar-link"><span
                                            class="hide-menu"> Fontawesome Icons </span></a></li>
                                <li class="sidebar-item"><a href="icon-material.html" class="sidebar-link"><span
                                            class="hide-menu"> Material Icons </span></a></li>
                                <li class="sidebar-item"><a href="icon-simple-lineicon.html" class="sidebar-link"><span
                                            class="hide-menu"> Simple Line Icons </span></a></li>
                                <li class="sidebar-item"><a href="icon-themify.html" class="sidebar-link"><span
                                            class="hide-menu"> Themify Icons </span></a></li>
                                <li class="sidebar-item"><a href="icon-weather.html" class="sidebar-link"><span
                                            class="hide-menu"> Weather Icons </span></a></li>
                                <li class="sidebar-item"><a href="icon-flag.html" class="sidebar-link"><span
                                            class="hide-menu"> Flag Icons </span></a></li>
                            </ul>
                        </li>

                        <li class="sidebar-item"> <a class="sidebar-link has-arrow" href="javascript:void(0)"
                                aria-expanded="false"><i data-feather="paperclip" class="feather-icon"></i><span
                                    class="hide-menu">Invoice
                                </span></a>
                            <ul aria-expanded="false" class="collapse  first-level base-level-line">
                                <li class="sidebar-item"><a href="pages-invoice.html" class="sidebar-link"><span
                                            class="hide-menu">
                                            Invoice Layout
                                        </span></a></li>
                                <li class="sidebar-item"><a href="pages-invoice-list.html" class="sidebar-link"><span
                                            class="hide-menu">
                                            Invoice List </span></a></li>
                            </ul>
                        </li>

                        <li class="sidebar-item"> <a class="sidebar-link has-arrow" href="javascript:void(0)"
                                aria-expanded="false"><i data-feather="map-pin" class="feather-icon"></i><span
                                    class="hide-menu">Maps
                                </span></a>
                            <ul aria-expanded="false" class="collapse  first-level base-level-line">
                                <li class="sidebar-item"><a href="map-google.html" class="sidebar-link"><span
                                            class="hide-menu">
                                            Google Map
                                        </span></a></li>
                                <li class="sidebar-item"><a href="map-vector.html" class="sidebar-link"><span
                                            class="hide-menu">
                                            Vector Map </span></a></li>
                            </ul>
                        </li>

                        <li class="sidebar-item"> <a class="sidebar-link has-arrow" href="javascript:void(0)"
                                aria-expanded="false"><i data-feather="activity" class="feather-icon"></i><span
                                    class="hide-menu">Timelines
                                </span></a>
                            <ul aria-expanded="false" class="collapse  first-level base-level-line">
                                <li class="sidebar-item"><a href="timeline-center.html" class="sidebar-link"><span
                                            class="hide-menu">
                                            Center Timeline
                                        </span></a></li>
                                <li class="sidebar-item"><a href="timeline-horizontal.html" class="sidebar-link"><span
                                            class="hide-menu">
                                            Horizontal Timeline </span></a></li>
                                <li class="sidebar-item"><a href="timeline-left.html" class="sidebar-link"><span
                                            class="hide-menu">
                                            Left Timeline </span></a></li>
                                <li class="sidebar-item"><a href="timeline-right.html" class="sidebar-link"><span
                                            class="hide-menu">
                                            Right Timeline </span></a></li>
                            </ul>
                        </li>

                        <li class="sidebar-item"> <a class="sidebar-link has-arrow" href="javascript:void(0)"
                                aria-expanded="false"><i data-feather="mail" class="feather-icon"></i><span
                                    class="hide-menu">Email Templates
                                </span></a>
                            <ul aria-expanded="false" class="collapse  first-level base-level-line">
                                <li class="sidebar-item"><a href="email-templete-alert.html" class="sidebar-link"><span
                                            class="hide-menu">
                                            Alert
                                        </span></a></li>
                                <li class="sidebar-item"><a href="email-templete-basic.html" class="sidebar-link"><span
                                            class="hide-menu">
                                            Basic </span></a></li>
                                <li class="sidebar-item"><a href="email-templete-billing.html"
                                        class="sidebar-link"><span class="hide-menu">
                                            Billing </span></a></li>
                                <li class="sidebar-item"><a href="email-templete-password-reset.html"
                                        class="sidebar-link"><span class="hide-menu">
                                            Password Reset </span></a></li>
                            </ul>
                        </li>

                        <li class="sidebar-item"> <a class="sidebar-link has-arrow" href="javascript:void(0)"
                                aria-expanded="false"><i data-feather="user-x" class="feather-icon"></i><span
                                    class="hide-menu">Error Pages
                                </span></a>
                            <ul aria-expanded="false" class="collapse  first-level base-level-line">
                                <li class="sidebar-item"><a href="error-400.html" class="sidebar-link"><span
                                            class="hide-menu">
                                            Error 400
                                        </span></a></li>
                                <li class="sidebar-item"><a href="error-403.html" class="sidebar-link"><span
                                            class="hide-menu">
                                            Error 403 </span></a></li>
                                <li class="sidebar-item"><a href="error-404.html" class="sidebar-link"><span
                                            class="hide-menu">
                                            Error 404 </span></a></li>
                                <li class="sidebar-item"><a href="error-500.html" class="sidebar-link"><span
                                            class="hide-menu"> Error 500 </span></a></li>
                                <li class="sidebar-item"><a href="error-503.html" class="sidebar-link"><span
                                            class="hide-menu">
                                            Error 503 </span></a></li>
                            </ul>
                        </li>

                        <li class="sidebar-item"> <a class="sidebar-link has-arrow" href="javascript:void(0)"
                                aria-expanded="false"><i class="mdi mdi-notification-clear-all"></i><span
                                    class="hide-menu">Multi level
                                    dd</span></a>
                            <ul aria-expanded="false" class="collapse first-level">
                                <li class="sidebar-item"><a href="javascript:void(0)" class="sidebar-link"><i
                                            class="mdi mdi-octagram"></i><span class="hide-menu"> item 1.1</span></a>
                                </li>
                                <li class="sidebar-item"><a href="javascript:void(0)" class="sidebar-link"><i
                                            class="mdi mdi-octagram"></i><span class="hide-menu"> item 1.2</span></a>
                                </li>
                                <li class="sidebar-item"> <a class="has-arrow sidebar-link" href="javascript:void(0)"
                                        aria-expanded="false"><i class="mdi mdi-playlist-plus"></i> <span
                                            class="hide-menu">Menu 1.3</span></a>
                                    <ul aria-expanded="false" class="collapse second-level">
                                        <li class="sidebar-item"><a href="javascript:void(0)" class="sidebar-link"><i
                                                    class="mdi mdi-octagram"></i><span class="hide-menu"> item
                                                    1.3.1</span></a></li>
                                        <li class="sidebar-item"><a href="javascript:void(0)" class="sidebar-link"><i
                                                    class="mdi mdi-octagram"></i><span class="hide-menu"> item
                                                    1.3.2</span></a></li>
                                        <li class="sidebar-item"><a href="javascript:void(0)" class="sidebar-link"><i
                                                    class="mdi mdi-octagram"></i><span class="hide-menu"> item
                                                    1.3.3</span></a></li>
                                        <li class="sidebar-item"><a href="javascript:void(0)" class="sidebar-link"><i
                                                    class="mdi mdi-octagram"></i><span class="hide-menu"> item
                                                    1.3.4</span></a></li>
                                    </ul>
                                </li>
                                <li class="sidebar-item"><a href="javascript:void(0)" class="sidebar-link"><i
                                            class="mdi mdi-playlist-check"></i><span class="hide-menu"> item
                                            1.4</span></a></li>
                            </ul>
                        </li>
                        <li class="list-divider"></li>
                        <li class="nav-small-cap"><span class="hide-menu">Extra</span></li>
                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link"
                                href="${path}/resources/../documentation/documentation.html" aria-expanded="false"><i
                                    data-feather="edit-3" class="feather-icon"></i><span
                                    class="hide-menu">Documentation</span></a></li>
                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="authentication-login1.html"
                                aria-expanded="false"><i data-feather="log-out" class="feather-icon"></i><span
                                    class="hide-menu">Logout</span></a></li>
                    </ul>
                </nav>
                <!-- End Sidebar navigation -->
            </div>
            <!-- End Sidebar scroll-->
        </aside>
        <!-- ============================================================== -->
        <!-- End Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Page wrapper  -->
        <!-- ============================================================== -->
        <div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Start Page Content -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Email App Part -->
            <!-- ============================================================== -->
            <div class="email-app position-relative">
                <!-- ============================================================== -->
                <!-- Left Part -->
                <!-- ============================================================== -->
                <div class="left-part">
                <%@ include file = "/WEB-INF/views/approval/submenu.jsp" %>
                </div>
                <!-- ============================================================== -->
                <!-- Right Part -->
                <!-- ============================================================== -->
                <div class="right-part mail-list overflow-auto">
                    <div class="p-3 b-b">
                        <div class="d-flex align-items-center">
                            <div>
                                <h4> 기안문서함 </h4>
                            </div>
                            <div class="ml-auto">
                                <input placeholder="문서 제목 검색" type="text" class="form-control">
                            </div>
                        </div>
                    </div>
                    <!-- Action part -->
                    <!-- Button group part -->
                    <div class="bg-light p-3 d-flex align-items-center do-block">
                        <div class="btn-group mt-1 mb-1">
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input sl-all" id="cstall">
                                <label class="custom-control-label" for="cstall">Check All  기안문서함 > 진행문서</label>
                            </div>
                        </div>
                        <div class="ml-auto">
                            <div class="btn-group mr-2" role="group" aria-label="Button group with nested dropdown">
                                <button type="button" class="btn btn-outline-secondary font-18" onclick="location.href='${path}/onapproval.ap'">진행</button>
                                <button type="button" class="btn btn-outline-secondary font-18" onclick="location.href='${path}/comapproval.ap'">완료</button>
                                <button type="button" class="btn btn-outline-secondary font-18" onclick="location.href='${path}/rejapproval.ap'">반려</button>
                            </div>

                        </div>
                    </div>
                    <!-- Action part -->
                    <!-- list-->
                    <div class="table-responsive">
                        <table class="table email-table no-wrap table-hover v-middle">
                            <tbody>
                                <!-- row -->
                                <tr class="unread">
                                    <!-- label -->
                                    <td class="chb">
                                        <div class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" id="cst1">
                                            <label class="custom-control-label" for="cst1">&nbsp;</label>
                                        </div>
                                    </td>
                                    <td class="user-image p-2">진행</td>
                                    <td class="user-name px-1 py-2">
                                        <h6 class="mb-0 text-truncate font-weight-medium">문서번호</h6>
                                    </td>
                                    <td class="py-2 px-3 no-wrap text-truncate"> 
                                            <span class="blue-grey-text text-darken-4">문서제목</span>
                                    </td>
                                    <td class="clip px-1 py-2"><i class="fa fa-paperclip"></i></td>
                                    <td class="time text-right"> 기안일 </td>
                                </tr>
                                <!-- row -->
                                <tr class="unread">
                                    <!-- label -->
                                    <td class="chb">
                                        <div class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" id="cst1">
                                            <label class="custom-control-label" for="cst1">&nbsp;</label>
                                        </div>
                                    </td>
                                    <td class="user-image p-2"><span class="badge badge-warning blue-grey-text text-darken-4 mr-2">진행중</span> </td>
                                    <td class="user-name px-1 py-2">
                                        <h6 class="mb-0 text-truncate font-weight-medium">bee-22-0001</h6>
                                    </td>
                                    <td class="py-2 px-3 no-wrap text-truncate"> 
                                     <a class="link font-weight-medium"
                                            href="#" onclick = "window.open('${path}/finishform_1.fo','결재정보','width=850,height=1000,location=no,status=no,scrollbars=yes');">
                                            <span class="blue-grey-text text-darken-4">Spring project 진행 계획 보고</span>
                                     </a>                                    </td>
                                    <td class="clip px-1 py-2"><i class="fa fa-paperclip"></i></td>
                                    <td class="time text-right"> 22-10-03 </td>
                                </tr>
                                <!-- row -->
                                <tr class="unread">
                                    <!-- label -->
                                    <td class="chb">
                                        <div class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" id="cst1">
                                            <label class="custom-control-label" for="cst1">&nbsp;</label>
                                        </div>
                                    </td>
                                    <td class="user-image p-2"><span class="badge badge-warning blue-grey-text text-darken-4 mr-2">진행중</span> </td>
                                    <td class="user-name px-1 py-2">
                                        <h6 class="mb-0 text-truncate font-weight-medium">bee-22-0001</h6>
                                    </td>
                                    <td class="py-2 px-3 no-wrap text-truncate"> 
                                            <span class="blue-grey-text text-darken-4">JSP 프로젝트 회의록</span>
                                    </td>
                                    <td class="clip px-1 py-2"><i class="fa fa-paperclip"></i></td>
                                    <td class="time text-right"> 22-10-03 </td>
                                </tr>
                                <!-- row -->
                                <tr class="unread">
                                    <!-- label -->
                                    <td class="chb">
                                        <div class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" id="cst1">
                                            <label class="custom-control-label" for="cst1">&nbsp;</label>
                                        </div>
                                    </td>
                                    <td class="user-image p-2"><span class="badge badge-warning blue-grey-text text-darken-4 mr-2">진행중</span> </td>
                                    <td class="user-name px-1 py-2">
                                        <h6 class="mb-0 text-truncate font-weight-medium">bee-22-0001</h6>
                                    </td>
                                    <td class="py-2 px-3 no-wrap text-truncate"> 
                                            <span class="blue-grey-text text-darken-4">java 기초 교육 참여자 리스트 보고</span>
                                    </td>
                                    <td class="clip px-1 py-2"><i class="fa fa-paperclip"></i></td>
                                    <td class="time text-right"> 22-10-03 </td>
                                </tr>

                        </table>
                    </div>
                    <div class="p-3 mt-4">
                        <nav aria-label="Page navigation example">
                            <ul class="pagination justify-content-center">
                                <li class="page-item"><a class="page-link" href="javascript:void(0)">Previous</a></li>
                                <li class="page-item"><a class="page-link" href="javascript:void(0)">1</a></li>
                                <li class="page-item"><a class="page-link" href="javascript:void(0)">2</a></li>
                                <li class="page-item"><a class="page-link" href="javascript:void(0)">3</a></li>
                                <li class="page-item"><a class="page-link" href="javascript:void(0)">Next</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- Right Part  Mail Compose -->
                <!-- ============================================================== -->
                <div class="right-part mail-compose overflow-auto" style="display: none;">
                    <div class="p-4 border-bottom">
                        <div class="d-flex align-items-center">
                            <div>
                                <h4>Compose</h4>
                                <span>create new message</span>
                            </div>
                            <div class="ml-auto">
                                <button id="cancel_compose" class="btn btn-dark">Back</button>
                            </div>
                        </div>
                    </div>
                    <!-- Action part -->
                    <!-- Button group part -->
                    <div class="card-body">
                        <form>
                            <div class="form-group">
                                <input type="email" id="example-email" name="example-email" class="form-control"
                                    placeholder="To">
                            </div>
                            <div class="form-group">
                                <input type="text" id="example-subject" name="example-subject" class="form-control"
                                    placeholder="Subject">
                            </div>
                            <div id="summernote"></div>
                            <h4>Attachment</h4>
                            <div class="dropzone" id="dzid">
                                <div class="fallback">
                                    <input name="file" type="file" multiple />
                                </div>
                            </div>
                            <button type="submit" class="btn btn-success mt-3"><i class="far fa-envelope"></i>
                                Send</button>
                            <button type="submit" class="btn btn-dark mt-3">Discard</button>
                        </form>
                        <!-- Action part -->
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
</body>

</html>