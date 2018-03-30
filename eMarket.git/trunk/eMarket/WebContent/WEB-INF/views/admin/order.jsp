<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>


<div class="row">
	<!-- page header-->
	<div class="col-lg-12">
		<h1 class="page-header">ORDER MANAGER</h1>
	</div>
	<!-- end page header-->
</div>
<div class="panel panel-default">
	<div class="panel-heading">Edition</div>
	<div class="panel-body">
		<div class="row">
			<div class="col-lg-12">
				<form:form action="admin/order/index.php" modelAttribute="model">
					<c:if test="${model.id > 0}">
						<span>${message} </span>
						<div class="form-group">
							<label>Id</label>
							<form:input path="id" cssClass="form-control" readonly="true" />
						</div>
					</c:if>
					<div class="form-group">
						<label>Customer</label>
						<form:input path="customer.id" cssClass="form-control" />
					</div>
					<div class="form-group">
						<label>Order Date</label>
						<form:input path="orderDate" cssClass="form-control" />
					</div>
					<div class="form-group">
						<label>Required Date</label>
						<form:input path="requireDate" cssClass="form-control" />
					</div>
					<div class="form-group">
						<label>Receiver</label>
						<form:input path="receiver" cssClass="form-control" />
					</div>
					<div class="form-group">
						<label>Address</label>
						<form:input path="address" cssClass="form-control" />
					</div>
					<div class="form-group">
						<label>Amount</label>
						<form:input path="amount" cssClass="form-control" />
					</div>
					<div class="form-group">
						<label>Notes</label>
						<form:textarea path="description" rows="5" cssClass="form-control"></form:textarea>
					</div>
					<div class="form-group">
						<button class="btn btn-primary"
							formaction="admin/order/insert.php">Insert</button>
						<button class="btn btn-primary"
							formaction="admin/order/update.php">Update</button>
						<button class="btn btn-primary"
							formaction="admin/order/delete.php">Delete</button>
						<button class="btn btn-primary" formaction="admin/order/index.php">Reset</button>
					</div>
				</form:form>
			</div>


		</div>
	</div>
</div>
.
<div class="row">
	<div class="col-lg-12">
		<!-- Advanced Tables -->
		<div class="panel panel-default">
			<div class="panel-heading">List</div>
			<div class="panel-body">
				<div class="table-responsive">
					<table class="table table-striped table-bordered table-hover"
						id="dataTables-example">
						<thead>
							<tr>
								<th>Id</th>
								<th>Customer</th>
								<th>Order Date</th>
								<th>Amount</th>
								<th>Receiver</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${list}">
								<tr>
									<td>${item.id}</td>
									<td>${item.customer.id}</td>
									<td>${item.orderDate}</td>
									<td>${item.amount}</td>
									<td>${item.receiver}</td>
									<td><a href="admin/order/edit.php?id=${item.id}">Edit</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

			</div>
		</div>
		<!--End Advanced Tables -->
	</div>
</div>