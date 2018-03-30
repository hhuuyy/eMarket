<%@ page pageEncoding="utf-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<style>
.product_inside{
border:1px inset #dcdcdc;
border-radius:5px;
}
</style>
<div id="pageContent">
	<div class="productPrevNext hidden-xs hidden-sm">
		<a href="#" class="product-prev"><img
			src="images/product/product-01.jpg" alt="" /></a> <a href="#"
			class="product-next"><img src="images/product/product-01.jpg"
			alt="" /></a>
	</div>
	<div class="container offset-0">
		<div class="row">
			<div class="col-md-5 hidden-xs">
				<div class="product-main-image">
					<div class="product-main-image-item">
						<img class="zoom-product" src='images/products/${prod.image}'
							data-zoom-image="images/product/product-big-1-zoom.jpg" alt="" />
					</div>
				</div>
				<div class="product-images-carousel">
					<ul id="smallGallery">
						<li><a class="zoomGalleryActive" href="#"
							data-image="images/product/product-big-1.jpg"
							data-zoom-image="images/product/product-big-1.jpg"><img
								src="images/product/product-small-1.jpg" alt="" /></a></li>
						<li><a href="#" data-image="images/product/product-big-2.jpg"
							data-zoom-image="images/product/product-big-2-zoom.jpg"><img
								src="images/product/product-small-2.jpg" alt="" /></a></li>
						<li><a href="#" data-image="images/product/product-big-3.jpg"
							data-zoom-image="images/product/product-big-3-zoom.jpg"><img
								src="images/product/product-small-3.jpg" alt="" /></a></li>
						<li>
							<div class="video-link-product" data-toggle="modal"
								data-type="youtube" data-target="#modalVideoProduct"
								data-value="http://www.youtube.com/embed/JuO-wy0YxIs">
								<img src="images/product/product-small-empty.png" alt="" />
								<div>
									<span class="icon icon-videocam"></span> <span class="title">Video<br>Review
									</span>
								</div>
							</div>
						</li>
						<li>
							<div class="video-link-product" data-toggle="modal"
								data-type="video" data-target="#modalVideoProduct"
								data-value="images/slides/video/video.mp4">
								<img src="images/product/product-small-empty.png" alt="" />
								<div>
									<span class="icon icon-videocam"></span> <span class="title">Video<br>Review
									</span>
								</div>
							</div>
						</li>
					</ul>
				</div>
			</div>
			<div class="col-md-7">
				<div class="visible-xs">
					<div class="clearfix"></div>
					<ul class="mobileGallery-product">
						<li><img src="images/product/product-big-1.jpg" alt="" /></li>
						<li><img src="images/product/product-big-2.jpg" alt="" /></li>
						<li><img src="images/product/product-big-3.jpg" alt="" /></li>
						<li>
							<div class="video-carusel">
								<img src="images/product/product-small-empty.png" alt="" />
								<div>
									<iframe src="http://www.youtube.com/embed/JuO-wy0YxIs"></iframe>
								</div>
							</div>
						</li>
					</ul>
				</div>
				<div class="product-info">
					<div class="add-info">
						<div class="pull-left">
							<div class="sku">
								<span class="font-weight-medium color-defaulttext2"></span>

							</div>
						</div>
						<div class="pull-left">
							<div class="availability">
								<span class="font-weight-medium color-defaulttext2"></span> <span
									class="color-base"></span> <span class="color-red"></span>
							</div>
						</div>
					</div>
					<div class="productvendor"></div>
					<h1 class="title vendor-top">${prod.name}</h1>
					<div class="price">
						<span class="new-price"><f:formatNumber
								value="${prod.unitPrice*(1-prod.discount)}"></f:formatNumber>đ</span><span
							class="old-price"><f:formatNumber
								value="${prod.unitPrice}"></f:formatNumber>đ</span>
					</div>
					<div class="wrapper">
						<div class="pull-left">
							<a data-add-id="${prod.id}" class="btn btn-lg btn-addtocart"><span
								class="icon icon-shopping_basket"></span>Thêm vào giỏ hàng</a>
						</div>
					</div>
					<div class="description">
						<details>
							<summary style="font-size: 30px">Cấu hình chi tiết</summary>
							<textarea style="border: none; width: 100%; height: 300px">${prod.description}</textarea>
						</details>
					</div>
				</div>
			</div>
		</div>
	</div>

</div>


<div class="container-fluid ">
	<h1 class="block-title">Sản phẩm cùng thể lại</h1>
	<div class="row">
		<div
			class="carousel-products-1 carouselTab slick-arrow-top products-mobile-arrow">
			<c:forEach var="spec" items="${prod.category.products}" begin="0"
				end="20">
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
								value="${spec.unitPrice}"/> đ</span>
							</div>

							<div class="product_inside_hover">
								<div class="product_inside_info"></div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>