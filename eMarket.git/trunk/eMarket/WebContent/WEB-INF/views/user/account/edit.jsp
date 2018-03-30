<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>


<div class="container offset-14">
	<h1 class="block-title medium">Cập nhật thông tin</h1>
	<div class="row">
		<div class="col-sm-8 col-sm-push-2 col-lg-6 col-lg-push-3">
			<div class="login-form-box">
				<h2 class="text-uppercase">Thông tin người dùng</h2>
				${message}
				<form:form action="user/account/edit.php" modelAttribute="user"
					enctype="multipart/form-data" class="form-horizontal">
					<div class="form-group">
						<div class="input-group">
							<span class="input-group-addon"> <span
								class="icon icon-person_outline"></span>
							</span>
							<form:input path="fullname" id="LoginFormName1" />
						</div>
					</div>

					<div class="form-group">
						<div class="input-group">
							<span class="input-group-addon"> <span
								class="icon icon-lock_outline"></span>
							</span>
							<form:input type="email" path="email" id="LoginFormName1" />
						</div>
					</div>
					<div class="form-group">
						<div class="input-group">
							<label class="control-label">Photo</label> <br> <img
								src="images/customers/${user.photo}" width="200" height="100"><br>
							<div class="controls">
								<input type="file" name="upphoto">
								<form:hidden path="photo" />
							</div>
						</div>
					</div>
					<form:hidden path="activated" />
					<div class="row">
						<div class="col-md-12">
							<div class="button-block">
								<button type="submit" class="btn">Cập nhật</button>
							</div>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</div>