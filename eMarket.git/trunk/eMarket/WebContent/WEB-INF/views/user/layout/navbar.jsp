<%@page import="eMarket.entity.SubCategory"%>
<%@page import="eMarket.entity.Category"%>
<%@page import="java.util.List"%>
<%@page import="eMarket.controller.ProductController"%>
<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<nav class="panel-menu">

	<ul>
		<%
		ProductController homeC = new ProductController();
			List<Category> listCate = homeC.showCate();
		%>
		<%
			for (Category cate : listCate) {
		%>

		<li><a href="product/list-by-category/<%=cate.getId()%>.php"><%=cate.getNameVN()%></a>
			<ul>
				<%
					List<SubCategory> listSub = homeC.showSubCateByCate(cate.getId());
				%>
				<%
					for (SubCategory subCate : listSub) {
				%>
				<li><a href="product/list-by-category/<%=subCate.getId()%>.php"><span>
							<%=subCate.getNameVN()%></span> </a></li>
				<%
					}
				%>
			</ul></li>
		<%
			}
		%>

	</ul>
	<div class="mm-navbtn-names" style="display: none">
		<div class="mm-closebtn">CLOSE</div>
		<div class="mm-backbtn">BACK</div>
	</div>
</nav>