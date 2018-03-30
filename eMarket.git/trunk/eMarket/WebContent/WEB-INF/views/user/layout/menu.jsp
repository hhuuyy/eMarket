
<%@page import="eMarket.entity.SubCategory"%>
<%@page import="eMarket.entity.Category"%>
<%@page import="java.util.List"%>
<%@page import="eMarket.controller.ProductController"%>

<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<div class="container">
	<div class="text-center">
		<div class="menu-parent-box">
			<!-- header-menu -->
			<nav class="header-menu">
				<ul >
					<li  class="dropdown selected"><a  href="user/home/index.php">Home</a></li>
					<%
						ProductController homeC = new ProductController();
						List<Category> listCate = homeC.showCate();
					%>
					<%
						for (Category cate : listCate) {
					%>
					<li class="dropdown megamenu"><a
						href="product/list-by-category/<%=cate.getId()%>.php"><%=cate.getNameVN()%></a>
						<div class="dropdown-menu">
							<div class="custom-layout-02 menu-list-col">
								<ul class="megamenu-submenu">
									<%
										List<SubCategory> listSub = homeC.showSubCateByCate(cate.getId());
									%>
									<%
										for (SubCategory subCate : listSub) {
									%>
									<li><a
										href="product/list-by-subcategory/<%=subCate.getId()%>.php">
											<%=subCate.getNameVN()%>
									</a></li>
									<%
										}
									%>
								</ul>
							</div>
						</div></li>
					<%
						}
					%>
				</ul>
			</nav>
			<!-- /header-menu -->
		</div>


		<!-- search -->
		<div class="search">
			<a href="#" class="search-open"><span class="icon icon-search"></span></a>
			<div class="search-dropdown">
				<form method="post" action="product/search.php">
					<div class="input-outer">
						<input placeholder="Keywords" type="search" name="keywords"
							value="${param.keywords}" class="form-control" />
						<button type="submit" class="btn-search">SEARCH</button>
					</div>
					<a href="#" class="search-close"><span class="icon icon-close"></span></a>
				</form>
			</div>
		</div>
		<!-- /search -->
	</div>

</div>





