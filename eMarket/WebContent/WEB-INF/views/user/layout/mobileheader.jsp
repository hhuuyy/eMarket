<%@ page pageEncoding="utf-8"%>

<div class="mobile-header">
			<div class="container-fluid">
				<div class="pull-left">
					<!-- language -->
					<div class="mobile-parent-language"></div>
					<!-- /language -->
					<!-- currency -->
					<div class="mobile-parent-currency"></div>
					<!-- /currency -->
					<div class="mini-menu-dropdown dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown"> <span
							class="icon icon-more_horiz"></span>
						</a>
						<div class="dropdown-menu">
							<div class="mini-menu">
								<ul>
									<li class="active"><a href="index.html">Home</a></li>
									<li><a href="faqs.html">Delivery</a></li>
									<li><a href="blog_listing.html">Blog</a></li>
									<li><a href="contact.html">Contacts</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="pull-right">
					<!-- account -->
					<div class="account dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown"><span
							class="icon icon-person "></span></a>
						<div class="dropdown-label hidden-sm hidden-xs">My Account</div>
						<ul class="dropdown-menu">
							<li><a href="login-form.html"><span
									class="icon icon-person"></span>My Account</a></li>
							<li><a href="wishlist.html"><span
									class="icon icon-favorite_border"></span>My Wishlist</a></li>
							<li><a href="compare.html"><span
									class="fa fa-balance-scale"></span>Compare</a></li>
							<li><a href="checkout.html"><span
									class="icon icon-check"></span>Checkout</a></li>
							<li><a href="user/account/login.php" ><span
									class="icon icon-lock_outline"></span>Log In</a></li>
							<li><a href="login-form.html"><span
									class="icon icon-person_add"></span>Create an account</a></li>
						</ul>
					</div>
					<!-- /account -->
					<!-- cart -->
					<div class="mobile-parent-cart"></div>
					<!-- /cart -->
				</div>
			</div>
			<div class="container-fluid text-center">
				<!-- logo -->
				<div class="logo">
					<a href="index.html"><img src="images/logo-mobile.png" alt="" /></a>
				</div>
				<!-- /logo -->
			</div>
			<div class="container-fluid fill-bg-base">
				<div class="pull-left">
					<div class="mobile-parent-menu">
						<div class="mobile-menu-toggle">
							<span class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span> <span class="menu-text"> MENU </span>
						</div>
					</div>
				</div>
				<div class="pull-right">
					<!-- search -->
					<div class="search">
						<a href="#" class="search-open"><span class="icon icon-search"></span></a>
						<div class="search-dropdown">
							<form action="#" method="get">
								<div class="input-outer">
									<input type="search" name="search" value="" maxlength="128"
										placeholder="Enter keyword">
									<button type="submit" class="btn-search">
										<span>Search</span>
									</button>
								</div>
								<a href="#" class="search-close"><span
									class="icon icon-close"></span></a>
							</form>
						</div>
					</div>
					<!-- /search -->
				</div>
			</div>
		</div>