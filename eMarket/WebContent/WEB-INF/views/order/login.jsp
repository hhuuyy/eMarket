<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div class="content pb-20">
	<!-- Form with validation -->
	<form role="form" class="form-validate" action="order/login.php"
		method="post">
		<div class="panel panel-body login-form">
			<div class="text-center">
				<div class="icon-object border-slate-300 text-slate-300">
					<i class="icon-reading"></i>
				</div>
				<h5 class="content-group">
					Login to your account <small class="display-block">${message}</small>
				</h5>
			</div>

			<div class="form-group has-feedback has-feedback-left">
				<input type="text" class="form-control" placeholder="Username"
					name="id" required="required">
				<div class="form-control-feedback">
					<i class="icon-user text-muted"></i>
				</div>
			</div>

			<div class="form-group has-feedback has-feedback-left">
				<input type="password" class="form-control" placeholder="Password"
					name="password" required="required">
				<div class="form-control-feedback">
					<i class="icon-lock2 text-muted"></i>
				</div>
			</div>
			<div class="form-group">
				<button type="submit" class="btn bg-blue btn-block">
					Login <i class="icon-arrow-right14 position-right"></i>
				</button>
			</div>
		</div>
	</form>
	<!-- /form with validation -->

</div>

