<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<div class="container offset-14">
	<!-- <h1 class="block-title large">Đăng kí tài khoản</h1> -->
	<div class="row">
		<div class="col-sm-8 col-sm-push-2 col-lg-6 col-lg-push-3">
			<div class="login-form-box">
				<h2 class="text-uppercase">Thông tin khách hàng</h2>
				<%-- ${message} --%>
				<form:form action="user/order/user.php" modelAttribute="user"
					id="myForm" enctype="multipart/form-data" class="form-horizontal"
					method="post">
					<div class="form-group">
						<div class="input-group">

							<form:hidden path="id" value="${cookie.uidd.value}" />
						</div>
					</div>
					<div class="form-group">
						<div class="input-group">
							<form:hidden path="password" value="${cookie.pwdd.value}" />
						</div>
					</div>
					<div class="form-group">
						<div class="input-group">
							<span class="input-group-addon"> <span
								class="icon icon-person_outline"></span>
							</span>
							<form:input path="fullname" type="text" id="LoginEmail"
								class="form-control" placeholder="Vui lòng nhập họ và tên" />
						</div>
					</div>
					<div class="form-group">
						<div class="input-group">
							<span class="input-group-addon"> <span
								class="icon icon-email"></span>
							</span>
							<form:input path="email" type="email" id="LoginEmail"
								class="form-control" placeholder="Vui lòng nhập Email"
								value="${cookie.emm.value}" />
						</div>
					</div>
					<div class="form-group">
						<div class="hidden">
							<input type="file"
								name="upphoto"> 
							<!-- <input value="true" type="hidden" name="upphoto"> -->
						</div>
					</div>
					<input name="activated" value="true" type="hidden">
					<div class="row">
						<div class="col-md-12">
							<div class="button-block">
								<div class="col-md-5">
									<input type="submit" value="Lưu" class="btn icon-btn-left"></a>
								</div>
								<div class="col-md-2"></div>
								<div class="col-md-5">
									<a class="btn icon-btn-left" href="javascript:history.back()">Cancel
									</a>
								</div>
								<%-- <input  class="btn icon-btn-left" type="submit" name="submit" value="Submit" /><span
										class="icon icon-check_circle"></span> --%>


							</div>
						</div>
						<!-- <div class="col-md-12">
							<div class="additional-links-01">
								or <a href="#">Return to Store</a>
							</div>
						</div> -->
					</div>
				</form:form>
			</div>
		</div>
	</div>
</div>
