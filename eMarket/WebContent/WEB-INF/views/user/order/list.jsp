<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Insert title here</title>
</head>
<body>
	<h2>YOUR ORDERS</h2>
	<table class="table table-hover">
	<thead>
		<tr>
			<th>Id</th>
			<th>Order Date</th>
			<th>Receiver</th>
			<th>Address</th>
			<th>Amount</th>
			<th></th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="o" items="${orders}">
			<tr>
				<td>${o.id}</td>
				<td>${o.orderDate}</td>
				<td>${o.receiver}</td>
				<td>${o.address}</td>
				<td>${o.amount}</td>
				<td>
					<a href="user/order/detail.php?id=${o.id}">Detail</a>
				</td>
			</tr>
		</c:forEach>
	</tbody>
	</table>
	
</body>
</html>