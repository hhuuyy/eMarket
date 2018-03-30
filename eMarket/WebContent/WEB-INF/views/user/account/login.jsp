<%@page import="eMarket.entity.APIWrapper"%>
<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<div class="container offset-18">
	<h1 class="block-title large">Login</h1>
	<div class="row">
		<div class="col-sm-12 col-md-6 col-lg-6">
			<div class="login-form-box">
				<h2>NEW CUSTOMERS</h2>
				<div class="extra-indent-bottom">
					<p>By creating an account with our store, you will be able to
						move through the checkout process faster, store multiple shipping
						addresses, view and track your orders in your account and more.</p>
				</div>
				<div class="extra-bottom">
					<a href="user/account/register.php"><button class="btn btn-border color-default">CREATE AN
						ACCOUNT</button></a>
				</div>
			</div>
		</div>
		<div class="col-sm-12 col-md-6 col-lg-6">
			<div class="login-form-box">
				<h2>REGISTERED CUSTOMERS</h2>
				<p>If you have an account with us, please log in.</p>
				<span style="color:blue">${message}</span>
				
				<form action="user/account/login.php" method="post">
					<div class="form-group">
						<div class="input-group">
							<span class="input-group-addon"> <span
								class="icon icon-person_outline"></span>
							</span> <input name="id" type="text" id="LoginFormName1" class="form-control"
								placeholder="Username" value="${cookie.uid.value}">
						</div>
					</div>
					<div class="form-group">
						<div class="input-group">
							<span class="input-group-addon"> <span
								class="icon icon-lock_outline"></span>
							</span> <input name="password" type="password" id="LoginFormPass1" class="form-control"
								placeholder="Password" value="${cookie.pwd.value}">
						</div>
					</div>
					<div class="checkbox-group">
								<input name="remember" value="true" type="checkbox" id="checkBox2"> <label
									for="checkBox2"> <span class="check"></span> <span
									class="box"></span> Remember me
								</label>
							</div>
					
					<div class="row">
						<div class="col-md-12 col-lg-3">
							<button type="submit" >SIGN
								IN</button>
						</div>
						<div class="col-md-12 col-lg-9">
							<ul class="additional-links">
								<li><a href="#">Forgot your username?</a></li>
								<li><a href="user/account/forgot.php">Forgot your password?</a></li>
							</ul>
						</div>
					</div>
				</form>
				<form>
						<a href="<%= APIWrapper.getDialogLink() %>">Login with Facebook</a>
					</form>
			</div>
		</div>
	</div>
</div>