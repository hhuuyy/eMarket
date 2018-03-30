<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12">
			<div class="carousel-heading no-margin">
				<h4> ORDER DETAIL</h4>
			</div>
			<div class="page-content">
				<span>${message}</span>
				<table class="shopping-table">
					<thead>
						<tr>
							<th>Name</th>
							<th>Unit Price</th>
							<th>Quantity</th>
							<th>Discount</th>
							<th>Amount</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="d" items="${order.orderDetails}">
							<tr>
								<td>${d.product.name}</td>
								<td>${d.unitPrice}</td>
								<td>${d.quantity}</td>
								<td>${d.discount}</td>
								<td>${d.unitPrice*p.quantity*(1-p.discount)}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<form:form action="user/order/purchase.php" modelAttribute="order">
					<form:hidden path="id" />
					<div class="row">
						<div class="form-group col-sm-4">
							<label>Customer</label>
							<form:input path="customer.id" readonly="true"
								cssClass="form-control" />
						</div>
						<div class="form-group col-sm-4">
							<label>Order Date</label>
							<form:input path="orderDate" readonly="true"
								cssClass="form-control" />
						</div>
						<div class="form-group col-sm-4">
							<label>Require Date</label>
							<form:input path="requireDate" readonly="true"
								cssClass="form-control" />
						</div>
					</div>
					<div class="row">
						<div class="form-group col-sm-4">
							<label>Receiver</label>
							<form:input path="receiver" readonly="true"
								cssClass="form-control" />
						</div>
						<div class="form-group col-sm-4">
							<label>Address</label>
							<form:input path="address" readonly="true"
								cssClass="form-control" />
						</div>
						<div class="form-group col-sm-4">
							<label>Amount</label>
							<form:input path="amount" readonly="true" cssClass="form-control" />
						</div>
					</div>
					<div class="row">
						<div class="form-group col-sm-12">
							<label>Notes</label>
							<form:textarea path="description" readonly="true"
								cssClass="form-control" rows="5"></form:textarea>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
	

</body>
</html>