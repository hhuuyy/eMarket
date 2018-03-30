<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<div class="container offset-14">
	<h1 class="block-title large">Forgot Password</h1>
	<div class="row">
		<div class="col-sm-8 col-sm-push-2 col-lg-6 col-lg-push-3">
			<div class="login-form-box">
				<h2 class="text-uppercase">Personal Information</h2>
				${message}
				<form action="user/account/forgot.php" class="form-horizontal" method="post">
					<div class="form-group">
						<div class="input-group">
							<span class="input-group-addon"> <span
								class="icon icon-person_outline"></span>
							</span>
							<input name="id" type="text" id="LoginFormName1"
								class="form-control" placeholder="Username" />
						</div>
					</div>
					<div class="form-group">
						<div class="input-group">
							<span class="input-group-addon"> <span
								class="icon icon-email"></span>
							</span>
							<input name="email" type="email" id="LoginEmail"
								class="form-control" placeholder="Email" />
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-12">
							<div class="button-block">
								<button type="submit" class="btn">SUBMIT</button>
							</div>
						</div>
						<div class="col-md-12">
							<div class="additional-links-01">
								or <a href="#">Return to Store</a>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>