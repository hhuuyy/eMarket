<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<div class="row">
	<!-- page header-->
	<div class="col-lg-12">
		<h1 class="page-header">PRODUCT MANAGER</h1>
	</div>
	<!-- end page header-->
</div>
<div class="panel panel-default">
	<div class="panel-heading">Edition</div>
	<div class="panel-body">
		<div class="row">
			<form:form action="admin/product/index.php" modelAttribute="model"
				enctype="multipart/form-data" class="form1">

				<div class="col-lg-12">

					<span>${message} </span>

					<div class="row">
						<div class="form-group col-sm-4">
							<label>Id</label>
							<form:input path="id" cssClass="form-control" readonly="true" />
						</div>
						<div class="form-group col-sm-4">
							<label>Name</label>
							<form:input path="name" cssClass="form-control" />
						</div>
						<div class="form-group col-sm-4">
							<label>Unit Price</label>
							<form:input path="unitPrice" cssClass="form-control" />
						</div>
					</div>

					<div class="row">
						<div class="form-group col-sm-4">
							<label>Unit Brief</label>
							<form:input path="unitBrief" cssClass="form-control" />
						</div>
						<div class="form-group col-sm-4">
							<label>Quantity</label>
							<form:input path="quantity" cssClass="form-control" />
						</div>
						<div class="form-group col-sm-4">
							<label>Discount</label>
							<form:input path="discount" cssClass="form-control" />
						</div>
					</div>

					<div class="row">
						<div class="form-group col-sm-4">
							<label>Product Date</label>
							<form:input path="productDate" cssClass="form-control" />
						</div>
						<div class="form-group col-sm-4">
							<label>View Count</label>
							<form:input path="views" cssClass="form-control" />
						</div>
						<div class="form-group col-sm-4">
							<label>Features</label>
							<div class="form-control">
								<form:checkbox path="available" label="Available? " />
								<form:checkbox path="special" label="Special?" />
								<form:checkbox path="latest" label="Latest?" />
							</div>
						</div>
					</div>

					<div class="row">
						<div class="form-group col-sm-4">
							
							<img src="images/products/${model.image}"
								width="100" height="100" /></br></br> <input type="file" name="upimage">
							<form:hidden path="image" />
						</div>
						<div class="form-group col-sm-4">
							<label>Category</label>
							<form:select path="category.id" cssClass="form-control"
								items="${categories}" itemValue="id" itemLabel="nameVN" />
						</div>
						<div class="form-group col-sm-4">
							<label>subCategory</label>
							<form:select path="subCategory.id" cssClass="form-control"
								items="${subCategories}" itemValue="id" itemLabel="nameVN" />
						</div>
						<div class="form-group col-sm-4">
							<label>User</label>
							<form:select path="user.id" cssClass="form-control"
								items="${users}" itemValue="id" itemLabel="fullName" />
						</div>
						<div class="form-group col-sm-4">
							<label>Supplier</label>
							<form:select path="supplier.id" cssClass="form-control"
								items="${suppliers}" itemValue="id" itemLabel="name" />
						</div>
					</div>

					<div class="row">
						<div class="form-group col-sm-12">
							<label>Description</label>
							<form:textarea path="description" rows="3"
								cssClass="form-control"></form:textarea>
						</div>
						<div class="form-group col-sm-12">
							<button class="btn btn-primary"
								formaction="admin/product/insert.php">Insert</button>
							<button class="btn btn-primary"
								formaction="admin/product/update.php">Update</button>
							<button class="btn btn-primary"
								formaction="admin/product/delete.php">Delete</button>
							<button class="btn btn-primary"
								formaction="admin/product/index.php">Reset</button>
						</div>
					</div>
				</div>
			</form:form>

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
								<th>Image</th>
								<th>Name</th>
								<th>Quantity</th>
								<th>Category</th>
								<th>Supplier</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${items}">
								<tr>
									<td>${item.id}</td>
									<td><img src="images/products/${item.image}" height="50"
										width="50"></td>
									<td>${item.name}</td>
									<td>${item.unitPrice}</td>

									<td>${item.category.nameVN}</td>
									<td>${item.supplier.name}</td>
									<td>${item.subCategory.nameVN}</td>
									<td>${item.user.fullName}</td>
									<td><a href="admin/product/edit/${item.id}.php"
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
