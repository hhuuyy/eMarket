<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<h2>Supplier Manager</h2>



<ul class="nav nav-tabs">
	<li class="active"><a data-toggle="tab" href="#edit">Edition</a></li>
	<li><a data-toggle="tab" href="#list">List of items</a></li>
</ul>

<div class="tab-content">
	<div id="edit" class="tab-pane fade in active">
		<!-- Form -->
		<div class="panel panel-default">
			<div class="panel-heading">Supplier Edition</div>
			<div class="panel-body">
				${message}
				<form:form action="admin/supplier/index.php" modelAttribute="model"
					enctype="multipart/form-data">
					<div class="form-group">
						<label>Id</label>
						<form:input path="id" cssClass="form-control" />
					</div>
					<div class="form-group">
						<label>Name</label>
						<form:input path="name" cssClass="form-control" />
					</div>
					
					<div class="form-group">
						<label>Logo</label><br> <img
							src="images/suppliers/${model.logo}" width="150" height="150" /><br>
						<br>
						<form:hidden path="logo" cssClass="form-control" />
						<input name="uplogo" type="file" />
					</div>
					<div class="form-group">
						<button class="btn btn-default"
							formaction="admin/supplier/insert.php">Insert</button>
						<button class="btn btn-default"
							formaction="admin/supplier/update.php">Update</button>
						<button class="btn btn-default"
							formaction="admin/supplier/delete.php">Delete</button>
						<button class="btn btn-default"
							formaction="admin/supplier/index.php">Reset</button>
					</div>
				</form:form>
			</div>
			<div class="panel-footer"></div>
		</div>
	</div>
	<div id="list" class="tab-pane fade">
		<!-- Table -->
		<div class="panel panel-default">
			<div class="panel-heading">List of Supplier</div>
			<div class="panel-body">
				<table class="table table-hovered" id="myTable">
					<thead>
						<tr>
							<th>Id</th>
							<th>Name</th>
							
							<th>Logo</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${items}">
							<tr>
								<td>${item.id}</td>
								<td>${item.name}</td>
								
								<td><img src="images/suppliers/${item.logo}" height="90"
									width="90"></td>
								<td><a href="admin/supplier/edit/${item.id}.php"
									class="btn btn-default btn-sm"> <span
										class="glyphicon glyphicon-edit"></span> Edit
								</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="panel-footer"></div>
		</div>
	</div>
</div>