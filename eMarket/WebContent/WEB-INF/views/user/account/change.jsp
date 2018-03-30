<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="container offset-14">
	<h1 class="block-title large">Đổi mật khẩu</h1>
	<div class="row">
		<div class="col-sm-8 col-sm-push-2 col-lg-6 col-lg-push-3">
			<div class="login-form-box">
				<h2 class="text-uppercase">Thông tin người dùng</h2>
				${message}
				<form action="user/account/change.php" class="form-horizontal" method="post">
					<div class="form-group">
						<div class="input-group">
							<span class="input-group-addon"> <span
								class="icon icon-person_outline"></span>
							</span>
							<input name="id" type="text" id="LoginFormName1"
								class="form-control" placeholder="Nhập user name" />
						</div>
					</div>
					<div class="form-group">
						<div class="input-group">
							<span class="input-group-addon"> <span
								class="icon icon-lock_outline"></span>
							</span>
							<input name="password" type="password" id="LoginFormPass1"
								class="form-control" placeholder="Nhập mật khẩu cũ" />
						</div>
					</div>
					<div class="form-group">
						<div class="input-group">
							<span class="input-group-addon"> <span
								class="icon icon-lock_outline"></span>
							</span>
							<input name="password1" type="password" id="LoginFormPass1"
								class="form-control" placeholder="Nhập mật khẩu mới" />
						</div>
					</div>
					<div class="form-group">
						<div class="input-group">
							<span class="input-group-addon"> <span
								class="icon icon-lock_outline"></span>
							</span>
							<input name="password2" type="password" id="LoginFormPass1"
								class="form-control" placeholder="Xác nhận mật khẩu mới" />
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="button-block">
								<button type="submit" class="btn" >SUBMIT</button>
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