<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>


<div class="row">
	<!-- page header-->
	<div class="col-lg-12">
		<h1 class="page-header">WEBACTION MANAGER</h1>
	</div>
	<!-- end page header-->
</div>
<div class="panel panel-default">
	<div class="panel-heading">Edition</div>
	<div class="panel-body">
		<div class="row">
			<div class="col-lg-12">
				<form:form action="admin/web-action/index.php"
					modelAttribute="model" class="form1">
					<span>${message} </span>
					<div class="form-group">
						<label>Id</label>
						<form:input path="id" cssClass="form-control" readonly="true" />
					</div>
					<div class="form-group">
						<label>Name</label>
						<form:input path="name" cssClass="form-control" />
					</div>
					<div class="form-group">
						<label>Description</label>
						<form:input path="description" cssClass="form-control" />
					</div>
					<div class="form-group">
						<button class="btn btn-primary"
							formaction="admin/web-action/insert.php">Insert</button>
						<button class="btn btn-primary"
							formaction="admin/web-action/update.php">Update</button>
						<button class="btn btn-primary"
							formaction="admin/web-action/delete.php">Delete</button>
						<button class="btn btn-primary"
							formaction="admin/web-action/index.php">Reset</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</div>
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
								<th>Name</th>
								<th>Description</th>
								<th>Edit</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${items}">
								<tr>
									<td>${item.id}</td>
									<td>${item.name}</td>
									<td>${item.description}</td>
									<td><a href="admin/web-action/edit/${item.id}.php"
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