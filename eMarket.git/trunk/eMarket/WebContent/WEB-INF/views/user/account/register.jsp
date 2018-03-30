<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<div class="container offset-14">
	<h1 class="block-title large">Đăng kí tài khoản</h1>
	<div class="row">
		<div class="col-sm-8 col-sm-push-2 col-lg-6 col-lg-push-3">
			<div class="login-form-box">
				<h2 class="text-uppercase">Thông tin người dùng</h2>
				${message}
				<form:form action="user/account/register.php" modelAttribute="user"
					enctype="multipart/form-data" class="form-horizontal" method="post">
					<div class="form-group">
						<div class="input-group">
							<span class="input-group-addon"> <span
								class="icon icon-person_outline"></span>
							</span>
							<form:input path="id" type="text" id="LoginFormName1"
								class="form-control" placeholder="Username" />
						</div>
					</div>
					<div class="form-group">
						<div class="input-group">
							<span class="input-group-addon"> <span
								class="icon icon-watch"></span>
							</span>
							<form:input path="password" type="password" id="LoginFormName2"
								class="form-control" placeholder="Password" />
						</div>
					</div>
					<div class="form-group">
						<div class="input-group">
							<span class="input-group-addon"> <span
								class="icon icon-person_outline"></span>
							</span>
							<form:input path="fullname" type="text" id="LoginEmail"
								class="form-control" placeholder="Fullname" />
						</div>
					</div>
					<div class="form-group">
						<div class="input-group">
							<span class="input-group-addon"> <span
								class="icon icon-email"></span>
							</span>
							<form:input path="email" type="email" id="LoginEmail"
								class="form-control" placeholder="Email" />
						</div>
					</div>
					<div class="form-group">
						<div class="input-group">
							<span class="input-group-addon"> </span> <input type="file"
								name="upphoto">
						</div>
					</div>
					<input name="activated" value="false" type="hidden">
					<div class="row">
						<div class="col-md-12">
							<div class="button-block">
								<button type="submit" class="btn">CREATE AN ACCOUNT</button>
							</div>
						</div>
						<div class="col-md-12">
							<div class="additional-links-01">
								or <a href="#">Return to Store</a>
							</div>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</div>