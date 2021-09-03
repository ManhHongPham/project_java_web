
<!-- sử dụng tiếng việt, tàu,... -->
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!-- TagLibs -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<header class="header-area bg-ash">
	<!--Header Top Area Start -->
	<div class="header-top">
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<span class="welcome-text">Welcome you to ArtFuture store!</span>
					<!-- change -->
				</div>
				<div class="col-md-8">
					<div class="header-top-links">
						<div class="account-wishlist">
							<a href="/account">My Account</a>


							<c:choose>
								<c:when test="${isLogined }">

									<a href="/index">${userLogined.userName }</a>


									<a href="${base }/logout"> <i class="zmdi zmdi-power"></i>Logout
									</a>

								</c:when>
								<c:otherwise>
									<a href="/login">Sign In</a>
								</c:otherwise>
							</c:choose>



						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--Header Top Area End -->
	<!--Header Middle Area Start -->
	<div class="header-middle-area">
		<div class="container">
			<div class="row">
				<div class="col-md-3">
					<div class="logo">
						<a href="/index"><img src="user/assets/img/icon/logo.png"
							alt="Artfurniture"></a>
					</div>
				</div>
				<div class="col-md-3">
					<span class="email-image"> <span><img
							src="user/assets/img/icon/email.png" alt=""></span> <span><span>Email:
						</span>admin@artfurniture.com</span>
					</span>
				</div>
				<div class="col-md-6">

					<form action="${base }/search" method="get" class="header-search">
						<input type="text" placeholder="Search for item..."
							name="searchText">
						<button type="submit">
							<i class="icon icon-Search"></i>
						</button>
					</form>

					<div class="cart-box-wrapper">

						<a class="cart-info" href="/cart/view"> <span> <img
								src="user/assets/img/icon/cart.png" alt=""> <span
								id="totalItemsInCart"> (${totalItems })</span>
						</span> <span>My Bag</span>
						</a>



					</div>
				</div>
			</div>
		</div>
	</div>
	<!--Header Middle Area End -->
	<!-- Mainmenu Area Start -->
	<div class="mainmenu-area header-sticky display-none">
		<div class="container">
			<div class="menu-wrapper">
				<div class="main-menu">
					<nav>
						<ul>
							<li class="active"><a href="/index">Home</a></li>
							
							<li><a href="/shop">Shop</a></li>
							<li><a href="/contact">Contact</a></li>
							<li><a href="/account">Register</a></li>
							<li><a href="/login">Login</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<!-- Mainmenu Area End -->
</header>