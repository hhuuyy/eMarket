<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<base href="${pageContext.request.contextPath}/">
<title>Limitless - Responsive Web Application Kit by Eugene
	Kopyov</title>

<!-- Global stylesheets -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700,900"
	rel="stylesheet" type="text/css">
<link href="assets/css/icons/icomoon/styles.css" rel="stylesheet"
	type="text/css">
<link href="assets/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="assets/css/core.css" rel="stylesheet" type="text/css">
<link href="assets/css/components.css" rel="stylesheet" type="text/css">
<link href="assets/css/colors.css" rel="stylesheet" type="text/css">
<!-- /global stylesheets -->

<!-- Core JS files -->
<script type="text/javascript"
	src="assets/js/plugins/loaders/pace.min.js"></script>
<script type="text/javascript"
	src="assets/js/core/libraries/jquery.min.js"></script>
<script type="text/javascript" src="assets/js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="assets/js/loader.js"></script>
<script type="text/javascript"
	src="assets/js/core/libraries/bootstrap.min.js"></script>
<script type="text/javascript"
	src="assets/js/plugins/loaders/blockui.min.js"></script>
<!-- /core JS files -->

<!-- Theme JS files -->
<script type="text/javascript"
	src="assets/js/plugins/visualization/d3/d3.min.js"></script>
<script type="text/javascript"
	src="assets/js/plugins/visualization/d3/d3_tooltip.js"></script>
<script type="text/javascript"
	src="assets/js/plugins/forms/styling/switchery.min.js"></script>
<script type="text/javascript"
	src="assets/js/plugins/forms/styling/uniform.min.js"></script>
<script type="text/javascript"
	src="assets/js/plugins/forms/selects/bootstrap_multiselect.js"></script>
<script type="text/javascript"
	src="assets/js/plugins/ui/moment/moment.min.js"></script>
<script type="text/javascript"
	src="assets/js/plugins/pickers/daterangepicker.js"></script>

<script type="text/javascript" src="assets/js/core/app.js"></script>
<script type="text/javascript" src="/assets/js/pages/dashboard.js"></script>
<!-- /theme JS files -->

</head>

<body class="layout-boxed">

	<!-- Main navbar -->
	<div class="navbar navbar-default header-highlight">
		<div class="navbar-header">
			<a class="navbar-brand" href="index.html"><img
				src="images/customers/logo.png" alt=""></a>

			<ul class="nav navbar-nav visible-xs-block">
				<li><a data-toggle="collapse" data-target="#navbar-mobile"><i
						class="icon-tree5"></i></a></li>
				<li><a class="sidebar-mobile-main-toggle"><i
						class="icon-paragraph-justify3"></i></a></li>
			</ul>
		</div>

		<div class="navbar-collapse collapse" id="navbar-mobile">
			<ul class="nav navbar-nav">
				<li><a class="sidebar-control sidebar-main-toggle hidden-xs"><i
						class="icon-paragraph-justify3"></i></a></li>
			</ul>

			<p class="navbar-text">
				<span class="label bg-success">Online</span>
			</p>

			<ul class="nav navbar-nav navbar-right">

				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"> <i class="icon-bubbles4"></i> <span
						class="visible-xs-inline-block position-right">Messages</span> <span
						class="badge bg-warning-400">2</span>
				</a>

					<div class="dropdown-menu dropdown-content width-350">
						<div class="dropdown-content-heading">
							Messages
							<ul class="icons-list">
								<li><a href="#"><i class="icon-compose"></i></a></li>
							</ul>
						</div>

						<ul class="media-list dropdown-content-body">
							<li class="media">
								<div class="media-left">
									<img src="assets/images/placeholder.jpg"
										class="img-circle img-sm" alt=""> <span
										class="badge bg-danger-400 media-badge">5</span>
								</div>

								<div class="media-body">
									<a href="#" class="media-heading"> <span
										class="text-semibold">James Alexander</span> <span
										class="media-annotation pull-right">04:58</span>
									</a> <span class="text-muted">who knows, maybe that would be
										the best thing for me...</span>
								</div>
							</li>



							<li class="media">
								<div class="media-left">
									<img src="assets/images/placeholder.jpg"
										class="img-circle img-sm" alt="">
								</div>
								<div class="media-body">
									<a href="#" class="media-heading"> <span
										class="text-semibold">Richard Vango</span> <span
										class="media-annotation pull-right">Mon</span>
									</a> <span class="text-muted">Other travelling salesmen live
										a life of luxury...</span>
								</div>
							</li>
						</ul>

						<div class="dropdown-content-footer">
							<a href="#" data-popup="tooltip" title="All messages"><i
								class="icon-menu display-block"></i></a>
						</div>
					</div></li>

				<li class="dropdown dropdown-user"><a class="dropdown-toggle"
					data-toggle="dropdown"> <img
						src="assets/images/placeholder.jpg" alt=""> <span>Victoria</span>
						<i class="caret"></i>
				</a>

					<ul class="dropdown-menu dropdown-menu-right">
						<li><a href="#"><i class="icon-user-plus"></i> My profile</a></li>
						<li><a href="#"><i class="icon-coins"></i> My balance</a></li>
						<li><a href="#"><span
								class="badge bg-teal-400 pull-right">58</span> <i
								class="icon-comment-discussion"></i> Messages</a></li>
						<li class="divider"></li>
						<li><a href="#"><i class="icon-cog5"></i> Account
								settings</a></li>
						<li><a href="order/logoff.php"><i class="icon-switch2"></i>
								Logout</a></li>
					</ul></li>
			</ul>
		</div>
	</div>
	<!-- /main navbar -->
	<!-- Page container -->
	<div class="page-container">

		<!-- Page content -->
		<div class="page-content">

			<!-- Main sidebar -->
			<div class="sidebar sidebar-main">
				<div class="sidebar-content">

					<!-- User menu -->
					<div class="sidebar-user">
						<div class="category-content">
							<div class="media">
								<a href="#" class="media-left"><img
									src="assets/images/placeholder.jpg" class="img-circle img-sm"
									alt=""></a>
								<div class="media-body">
									<span class="media-heading text-semibold">admin</span>
									
								</div>

								<div class="media-right media-middle">
									<ul class="icons-list">
										<li><a href="#"><i class="icon-cog3"></i></a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<!-- /user menu -->
					<!-- Main navigation -->
					<div class="sidebar-category sidebar-category-visible">
						<div class="category-content no-padding">
							<ul class="navigation navigation-main navigation-accordion">

								<!-- Main -->
								<li class="navigation-header"><span>Main</span> <i
									class="icon-menu" title="Main pages"></i></li>
								<li><a href="admin/home/index.php"><i
										class="icon-home4"></i> <span>Dashboard</span></a></li>
								<li><a href="#"><i class="icon-stack2"></i> <span>Quản
											lí trang bán hàng</span></a>
									<ul>
										<li><a href="admin/category/index.php">Thể loại</a></li>
										<li><a href="admin/product/index.php">Sản phẩm</a></li>
										<li><a href="admin/supplier/index.php">Nhà cung cấp</a></li>
										<li><a href="admin/order/index.php">Hóa đơn</a></li>
										<li><a href="admin/customer/index.php">Khách hàng</a></li>

									</ul></li>
								<li><a href="#"><i class="icon-copy"></i> <span>Quản
											lí </span></a>
									<ul>
										<li><a href="admin/master/index.php">Quản lý tài
												khoản</a></li>
										<li><a href="admin/role/index.php">Quản lý vai trò</a></li>
										<li><a href="admin/web-action/index.php">Quản lý chức
												năng</a></li>
									</ul></li>
								<li><a href="#"><i class="icon-droplet2"></i> <span>Phân
											quyền</span></a>
									<ul>
										<li><a href="admin/master-role/index.php">Phân vai
												trò</a></li>
										<li><a href="admin/web-action-role/index.php">Phân
												quyền sử dụng</a></li>
									</ul></li>
								<li><a><i class="icon-table2"></i>Thống kê<span
										class="fa arrow"></span></a>
									<ul class="nav nav-third-level">

										<li class="selected"><a
											href="admin/inventory/bycategory.php">Theo loại</a></li>
										<li class="selected"><a
											href="admin/revenue/bycategory.php">Theo từng loại hàng</a></li>
										<li class="selected"><a
											href="admin/inventory/bysupplier.php">Theo hãng</a></li>
										<li class="selected"><a
											href="admin/revenue/bysupplier.php">Theo từng hãng</a></li>
										<li class="selected"><a href="admin/revenue/byyear.php">Theo
												năm</a></li>
										<li class="selected"><a
											href="admin/revenue/byquarter.php">Theo quý</a></li>
										<li class="selected"><a href="admin/revenue/bymonth.php">Theo
												tháng</a></li>

									</ul></li>

								<!-- /tables -->
							</ul>
						</div>
					</div>
					<!-- /main navigation -->
				</div>
			</div>
			<!-- /main sidebar -->
			<!-- Main content -->
			<div class="content-wrapper">
				<!-- Content area -->
				<div class="content">
					<jsp:include page="${param.view}" />
				</div>
				<!-- /content area -->
			</div>
			<!-- /main content -->
		</div>
		<!-- /page content -->
	</div>
	<!-- /page container -->

</body>
</html>

