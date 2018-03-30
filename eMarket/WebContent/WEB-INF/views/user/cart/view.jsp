<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<c:choose>
	<c:when test="${cart.count == 0}">
		<div class="container offset-80">
			<div class="on-duty-box">
				<img src="images/empty-shopping-cart-icon.png" alt="">
				<h1 class="block-title large">Shopping Cart is Empty</h1>
				<div class="description">You have no items in your shopping
					cart.</div>
				<a class="btn btn-default" href="javascript:history.back()">CONTINUE
					SHOPPING </a>
			</div>
		</div>
	</c:when>
	<c:otherwise>

		<div class="container offset-18">
			<h1 class="block-title text-inherit large text">Shopping cart</h1>
			<div class="row">
				<div class="col-lg-1"></div>
				<div class="col-lg-10">
					<div class="shopping-cart-col">
						<table class="shopping-cart-table">
							<c:forEach var="p" items="${cart.items}">
								<tbody>
									<tr>
										<td>
											<div class="product-image">
												<a href="product/detail/${p.id}.php"> <img
													src="images/products/${p.image}" alt="">
												</a>
											</div>
										</td>
										<td>
											<h5 class="product-title">
												<a href="product/detail/${p.id}.php">${p.name}</a>
											</h5>

										</td>
										<td>
											<div class="product-price subtotal">
												<f:formatNumber value="${p.unitPrice}"></f:formatNumber>
												
											</div>
										</td>

										<td>

											<div class="detach-quantity-desctope">
												<div class="input">
													<label>Số Lượng</label>
													<div class="style-2 input-counter">
														<input
															value="${p.quantity}" data-qty-id="${p.id}" type="number"
															size="100" min="0" />

													</div>
												</div>
											</div>
										</td>
										<td>
											<div class="product-price unit-price">
												<label>Giảm giá:</label>
												<f:formatNumber value="${p.discount}"></f:formatNumber>
												%
											</div>
										</td>
										<%-- <td>
											<div class="product-price subtotal">
												<f:formatNumber
													value="${p.unitPrice*p.quantity*(1-p.discount)}"></f:formatNumber>
											</div>
										</td> --%>
										<td><button class="product-delete icon icon-delete"
												data-remove-id="${p.id}"></button></td>
									</tr>


								</tbody>
							</c:forEach>
						</table>
						<div class="shopping-cart-btns">
							<div class="pull-right">
								<a class="btn-link" href="javascript:history.back()">CONTINUE
									SHOPPING<span class="icon icon-keyboard_arrow_right"></span>
								</a>
								<div class="clearfix visible-xs visible-sm"></div>
								<a class="btn-link" href="cart/clear.php"><span
									class="icon icon-delete"></span>CLEAR SHOPPING CART</a>
							</div>
							<div class="pull-left">
								<a class="btn-link" href="cart/view.php"><span
									class="icon icon-cached color-base"></span>UPDATE CART</a>

							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-1"></div>
				<div class="col-lg-9 "></div>
				<div class="col-lg-3 ">


					<div class="shopping-cart-box">
						<c:choose>
							<c:when test="${empty sessionScope.user}">

								<a href="user/order/user.php" class="btn btn-full icon-btn-left"><span
									class="icon icon-check_circle"></span>Tiến hành đặt hàng</a>
							</c:when>
							<c:otherwise>
								<a href="user/order/checkout.php"
									class="btn btn-full icon-btn-left"><span
									class="icon icon-check_circle"></span>Tiến hành đặt hàng</a>
							</c:otherwise>
						</c:choose>


					</div>

				</div>
			</div>
		</div>

	</c:otherwise>
</c:choose>











