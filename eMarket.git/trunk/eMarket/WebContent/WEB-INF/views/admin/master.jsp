<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>


<div class="row">
	<!-- page header-->
	<div class="col-lg-12">
		<h1 class="page-header">MASTER MANAGER</h1>
	</div>
	<!-- end page header-->
</div>
<div class="panel panel-default">
	<div class="panel-heading">Edition</div>
	<div class="panel-body">
		<div class="row">
			<div class="col-lg-12">
				<form:form action="admin/master/index.php" modelAttribute="model"
					enctype="multipart/form-data" class="form1">

					<span>${message} </span>

					<div class="form-group">
						<label>UserName</label>
						<form:input path="id" cssClass="form-control" />
					</div>
					<div class="form-group">
						<label>Password</label>
						<form:input path="password" cssClass="form-control" />
					</div>
					<div class="form-group">
						<label>Full Name</label>
						<form:input path="fullName" cssClass="form-control" />
					</div>
					<div class="form-group">
						<label>Email Address</label>
						<form:input path="email" cssClass="form-control" />
					</div>
					<div class="form-group">
						<label>Mobile Number</label>
						<form:input path="mobile" cssClass="form-control" />
					</div>

					<button formaction="admin/master/insert.php"
						class="btn btn-primary">Insert</button>
					<button formaction="admin/master/update.php"
						class="btn btn-primary">Update</button>
					<button class="btn btn-primary"
						formaction="admin/master/delete.php">Delete</button>
					<button class="btn btn-primary" formaction="admin/master/index.php">Reset</button>
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
								<th>User</th>
								<th>Password</th>
								<th>Fullname</th>
								<th>Email</th>

								<th>Edit</th>


							</tr>
						</thead>
						<tbody>

							<c:forEach var="item" items="${items}">
								<tr>
									<td>${item.id}</td>
									<td>${item.fullName}</td>
									<td>${item.email}</td>
									<td>${item.mobile}</td>
									<td><a href="admin/master/edit/${item.id}.php"
										class="btn btn-default btn-sm"> <span
											class="glyphicon glyphicon-edit"></span> Edit
									</a></td>
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