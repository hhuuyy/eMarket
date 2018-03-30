<%@page import="org.apache.http.HttpRequest"%>
<%@page import="java.util.List"%>
<%@page import="eMarket.entity.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="eMarket.pagination.Product2"%>
<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<style>
.product_inside {
	border: 1px inset #dcdcdc;
	border-radius: 5px;
}
</style>
<%	
	Integer id = (Integer) request.getAttribute("idPagination");

	Product2 p2 = new Product2();
	List<Product> arr = p2.getList(id);
	int start = 0, end = 12;
	if (arr.size() < 12) {
		end = arr.size();
	}
	if (request.getParameter("start") != null) {
		start = Integer.parseInt(request.getParameter("start"));
	}
	if (request.getParameter("end") != null) {
		end = Integer.parseInt(request.getParameter("end"));
	}
	List<Product> list = p2.getListByPage(arr, start, end);
%>

<div class="container offset-0">
	<div class="row">
		<div class="slider-revolution revolution-default">
			<div class="tp-banner-container">
				<div class="tp-banner revolution">
					<ul>
						<li data-thumb="images/customers/slide-1.jpg"
							data-transition="fade" data-slotamount="1" data-masterspeed="100"
							data-saveperformance="off" data-title="Slide"><img
							src="images/customers/slide-1.jpg" alt="slide1"
							data-bgposition="center center" data-bgfit="cover"
							data-bgrepeat="no-repeat">
							<div class="tp-caption tp-resizeme  lfb stb text-center"
								data-x="center" data-y="center" data-hoffset="0"
								data-voffset="-20" data-speed="60" data-start="90"
								data-easing="Power4.easeOut" data-endeasing="Power4.easeIn"
								data-responsive_offset="on" style="z-index: 2;"></div></li>
						<li data-thumb="images/customers/slide-2.jpg"
							data-transition="fade" data-slotamount="1"
							data-masterspeed="1000" data-saveperformance="off"
							data-title="Slide"><img src="images/customers/slide-2.jpg"
							alt="slide1" data-bgposition="center center" data-bgfit="cover"
							data-bgrepeat="no-repeat">
							<div class="tp-caption tp-resizeme  lfr str text-right"
								data-x="right" data-y="center" data-voffset="-20"
								data-hoffset="-351" data-speed="600" data-start="900"
								data-easing="Power4.easeOut" data-endeasing="Power4.easeIn"
								data-responsive_offset="on" style="z-index: 2;"></div></li>
						<li data-thumb="images/customers/slide-3.jpg"
							data-transition="fade" data-slotamount="1"
							data-masterspeed="1000" data-saveperformance="off"
							data-title="Slide"><img src="images/customers/slide-3.jpg"
							alt="slide1" data-bgposition="center center" data-bgfit="cover"
							data-bgrepeat="no-repeat">
							<div class="tp-caption tp-resizeme  lfr str text-right"
								data-x="right" data-y="center" data-voffset="-20"
								data-hoffset="-351" data-speed="600" data-start="900"
								data-easing="Power4.easeOut" data-endeasing="Power4.easeIn"
								data-responsive_offset="on" style="z-index: 2;"></div></li>

					</ul>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="container">
	<div class="product-listing row">

		<c:forEach var="p" items="${prods}">
			<div class="col-xs-6 col-sm-4 col-md-4 col-lg-one-fourth">
				<div class="product">
					<div class="product_inside">
						<div class="image-box">
							<a href="product/detail/${p.id}.php"> <img
								src="images/products/${p.image}" alt="">
							</a>
						</div>
						<h2 class="title">
							<a href="product/detail/${p.id}.php">${fn:substring(p.name, 0,19)}</a>
						</h2>

						<div class="price">
							<span class="new-price"><f:formatNumber
									value="${p.unitPrice}"></f:formatNumber> đ</span>
						</div>

						<div class="product_inside_hover">
							<div class="product_inside_info">
								<a class="btn btn-product_addtocart" data-add-id="${p.id}">
									<span class="icon icon-shopping_basket"></span>Thêm vào giỏ
									hàng
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>

<div class="container">
	<div class="product-listing row">
		<%
			for (Product p : list) {
		%>
		<div class="col-xs-6 col-sm-4 col-md-4 col-lg-one-fourth">
			<div class="product">
				<div class="product_inside">
					<div class="image-box">
						<a href="product/detail/<%=p.getId()%>.php"> <img
							src="images/products/<%=p.getImage()%>" alt="">
						</a>
					</div>
					<h2 class="title">
						<a href="product/detail/<%=p.getId()%>.php"><%=p.getName()%></a>
					</h2>

					<div class="price">
						<span class="new-price"><f:formatNumber
								value="<%=p.getUnitPrice()%>"></f:formatNumber> đ</span>
					</div>

					<div class="product_inside_hover">
						<div class="product_inside_info">
							<a class="btn btn-product_addtocart"
								data-add-id="<%=p.getId()%>"> <span
								class="icon icon-shopping_basket"></span>Thêm vào giỏ hàng
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%
			}
		%>
	</div>
</div>


<center>
	<div class="pagination">
		<ul>
			<%
				int a, b;
				int limit = arr.size() / 12;
				if (limit * 12 < arr.size()) {
					limit += 1;
				}
				for (int i = 1; i <= limit; i++) {
					a = (i - 1) * 12;
					b = i * 12;
					if (b > arr.size()) {
						b = arr.size();
					}
			%>
			<li><a
				href="product/list-by-category/${idPagination}.php?start=<%=a%>&end=<%=b%>"><%=i%></a></li>
			<%
				}
			%>
		</ul>
	</div>
</center>
<br class="clr" />