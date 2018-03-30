<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<c:set value="${sessionScope['scopedTarget.cart']}" var="cart" />
<div class="main-parent-cart">
	<div class="cart">
		<div class="dropdown">
			<a class="dropdown-toggle"> <span
				class="icon icon-shopping_basket"></span> <span
				class="badge badge-cart" id="cart-cnt">${cart.count} </span>
				<div class="dropdown-label hidden-sm hidden-xs" id="cart-amt">
					<f:formatNumber value="${cart.amount}" />
				</div>
			</a>
			
			<div class="dropdown-menu slide-from-top">
				<div class="container">
					<div class="top-title">Hàng trong giỏ</div>
					<a href="#" class="icon icon-close cart-close"></a>
					<ul>
						<c:forEach var="p" items="${cart.items}">
							<li class="item">
								<div class="img">
									<a href="product/detail/${p.id}.php"><img
										src="images/products/${p.image}" alt=""></a>
								</div>
								<div class="info">
									<div class="title-col">
										<h2 class="title">
											<a href="product/detail/${p.id}.php">${p.name}</a>
										</h2>
									</div>
									<div class="price">
										<f:formatNumber value="${p.unitPrice}"></f:formatNumber>
									</div>

									<div class="price">
										<div class="qty-label">Qty:</div>
										<div class="style-2 input-counter">
											<input value="${p.quantity}" data-qty-id="${p.id}"
												type="number" size="100" min="0" />
										</div>
									</div>
									<div class="price">
										<label class="qty-label">Giảm giá:</label>
										<f:formatNumber value="${p.discount}"></f:formatNumber>
										%
									</div>
									<div class="price">
										<div class="product-price subtotal">
											<f:formatNumber
												value="${p.unitPrice*p.quantity*(1-p.discount)}"></f:formatNumber>
										</div>
									</div>
								</div>
								<div class="price">
									<div class="delete">
										<button class="product-delete icon icon-delete"
											data-remove-id="${p.id}"></button>
									</div>
									<!-- <div class="edit">
										<a href="#" class="icon icon-edit" title="Edit"></a>
									</div> -->
								</div>
							</li>
						</c:forEach>
					</ul>
					<h4 class="empty-cart-js hide">Your Cart is Empty</h4>
					<div class="cart-bottom">
						<div class="pull-right">
							<div class="pull-left">
								<div class="cart-total">
									TOTAL: <span> <f:formatNumber
											value="${sessionScope['scopedTarget.cart'].amount}" /></span>
								</div>
							</div>

							<c:choose>
								<c:when test="${empty sessionScope.user}">

									<a href="user/order/user.php" class="btn icon-btn-left"><span
										class="icon icon-check_circle"></span>Tiến hành đặt hàng</a>
								</c:when>
								<c:otherwise>

									<a href="user/order/checkout.php" class="btn icon-btn-left"><span
										class="icon icon-check_circle"></span>Tiến hành đặt hàng</a>
								</c:otherwise>
							</c:choose>

						</div>
						<div class="pull-left">
							<a href="cart/view.php" class="btn icon-btn-left"><span
								class="icon icon-shopping_basket"></span>VIEW CART</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

