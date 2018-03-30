
<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<div class="container offset-0">
	<div class="row">
		<div class="slider-revolution revolution-default">
			<div class="tp-banner-container">
				<div class="tp-banner revolution">
					<ul>
						<li data-thumb="images/customers/slide-1.jpg"
							data-transition="fade" data-slotamount="1"
							data-masterspeed="100" data-saveperformance="off"
							data-title="Slide"><img src="images/customers/slide-1.jpg"
							alt="slide1" data-bgposition="center center" data-bgfit="cover"
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

<style>
.product_inside{
border:1px inset #dcdcdc;
border-radius:5px;
}
</style>

	<div class="container hidden-mobile">
		<hr>
	</div>
	<div class="container-fluid ">
		<h1 class="block-title">HÀNG MỚI</h1>
		<div class="row">
			<div
				class="carousel-products-1 carouselTab slick-arrow-top products-mobile-arrow">
				<c:forEach var="spec" items="${latests}" begin="0" end="20">
					<div>
						<div class="product">
							<div class="product_inside">
								<div class="image-box">
									<a href="product/detail/${spec.id}.php"> <img
										src="images/products/${spec.image}" alt="">
									</a>
								</div>
								<h2 class="title">
									<a href="product/detail/${spec.id}.php">${fn:substring(spec.name, 0,19)}</a>
								</h2>

								<div class="price">
									<span class="new-price"><f:formatNumber
											value="${spec.unitPrice}" ></f:formatNumber> đ</span>
								</div>

								<div class="product_inside_hover">
									<div class="product_inside_info">
										<a class="btn btn-product_addtocart" data-add-id="${spec.id}">
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
	</div>
	<div class="container-fluid ">
		<h1 class="block-title">HÀNG BÁN CHẠY</h1>
		<div class="row">
			<div
				class="carousel-products-1 carouselTab slick-arrow-top products-mobile-arrow">
				<c:forEach var="spec" items="${orders}" begin="0" end="20">
					<div>
						<div class="product">
							<div class="product_inside">
								<div class="image-box">
									<a href="product/detail/${spec.id}.php"> <img
										src="images/products/${spec.image}" alt="">
									</a>
								</div>
								<h2 class="title">
									<a href="product/detail/${spec.id}.php">${fn:substring(spec.name, 0,19)}</a>
								</h2>

								<div class="price">
									<span class="new-price"><f:formatNumber
											value="${spec.unitPrice}" ></f:formatNumber> đ</span>
								</div>

								<div class="product_inside_hover">
									<div class="product_inside_info">
										<a class="btn btn-product_addtocart" data-add-id="${spec.id}">
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
	</div>
	<div class="container-fluid ">
		<h1 class="block-title">HÀNG GIẢM GIÁ</h1>
		<div class="row">
			<div
				class="carousel-products-1 carouselTab slick-arrow-top products-mobile-arrow">
				<c:forEach var="spec" items="${discounts}" begin="0" end="20">
					<div>
						<div class="product">
							<div class="product_inside">
								<div class="image-box">
									<a href="product/detail/${spec.id}.php"> <img
										src="images/products/${spec.image}" alt="">
									</a>
								</div>
								<h2 class="title">
									<a href="product/detail/${spec.id}.php">${fn:substring(spec.name, 0,19)}</a>
								</h2>

								<div class="price">
									<span class="new-price"><f:formatNumber
											value="${spec.unitPrice}" ></f:formatNumber> đ</span>
								</div>

								<div class="product_inside_hover">
									<div class="product_inside_info">
										<a class="btn btn-product_addtocart" data-add-id="${spec.id}">
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
	</div>
	<div class="container-fluid ">
		<h1 class="block-title">HÀNG ĐẶC BIỆT</h1>
		<div class="row">
			<div
				class="carousel-products-1 carouselTab slick-arrow-top products-mobile-arrow">
				<c:forEach var="spec" items="${specials}" begin="0" end="20">
					<div>
						<div class="product">
							<div class="product_inside">
								<div class="image-box">
									<a href="product/detail/${spec.id}.php"> <img
										src="images/products/${spec.image}" alt="">
									</a>
								</div>
								<h2 class="title">
									<a href="product/detail/${spec.id}.php">${fn:substring(spec.name, 0,19)}</a>
								</h2>

								<div class="price">
									<span class="new-price"><f:formatNumber
											value="${spec.unitPrice}" ></f:formatNumber> đ</span>
								</div>

								<div class="product_inside_hover">
									<div class="product_inside_info">
										<a class="btn btn-product_addtocart" data-add-id="${spec.id}">
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
	</div>
	<div class="container hidden-mobile">
		<hr>
	</div>
	<div class="container">
		<div class="row">
			<h1 class="block-title">NHÀ SẢN XUẤT</h1>
			<div class="carousel-brands">
				<c:forEach var="sup" items="${sups}">
					<div>
						<a href="product/list-by-supplier/${sup.id}.php"> <img
							src="images/suppliers/${sup.logo}" alt=""></br>${sup.name}
						</a>
					</div>
				</c:forEach>

			</div>
		</div>
	</div>



