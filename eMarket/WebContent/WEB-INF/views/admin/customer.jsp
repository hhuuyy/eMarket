<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>


<div class="row">
	<!-- page header-->
	<div class="col-lg-12">
		<h1 class="page-header">CUSTOMER MANAGER</h1>
	</div>
	<!-- end page header-->
</div>
<div class="panel panel-default">
	<div class="panel-heading">Edition</div>
	<div class="panel-body">
		<div class="row">
			<div class="col-lg-12">
				<form:form action="admin/customer/index.php" modelAttribute="model"
					enctype="multipart/form-data">
					<span>${message} </span>
					
					<div class="form-group">
						<label>Id</label>
						<form:input path="id" cssClass="form-control" />
					</div>
					<div class="form-group">
						<label>Password</label>
						<form:input path="password" cssClass="form-control" />
					</div>
					<div class="form-group">
						<label>Email Address</label>
						<form:input path="email" cssClass="form-control" />
					</div>
					<div class="form-group">
						<label>Full Name</label>
						<form:input path="fullname" cssClass="form-control" />
					</div>
					<div class="form-group">
						<label>Photo</label><br> 
					
						<form:hidden path="photo" cssClass="form-control" />
						<input name="upphoto" type="file">
					</div>
					<div class="form-group">
						<label>Activate?</label>
						<form:radiobutton path="activated" value="true" label="Yes" />
						<form:radiobutton path="activated" value="false" label="No" />
					</div>
					<div class="form-group">
						<button class="btn btn-primary"
							formaction="admin/customer/insert.php">Insert</button>
						<button class="btn btn-primary"
							formaction="admin/customer/update.php">Update</button>
						<button class="btn btn-primary"
							formaction="admin/customer/delete.php">Delete</button>
						<button class="btn btn-primary"
							formaction="admin/customer/index.php">Reset</button>
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
								<th>Password</th>
								<th>Email</th>
								<th>Fullname</th>
								
								<th>Activated?</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${items}">
								<tr>
									<td>${item.id}</td>
									<td>${item.password}</td>
									<td>${item.email}</td>
									<td>${item.fullname}</td>
									
									<td>${item.activated?'Yes':'No'}</td>
									<td><a href="admin/customer/edit/${item.id}.php"
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