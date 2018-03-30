<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>



<c:choose>
	<c:when test="${empty sessionScope.user}">
		<div class="account dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown"> <span
				class="icon icon-person "></span> <span
				class="dropdown-label hidden-sm hidden-xs">Đăng nhập / Đăng
					kí </span>
			</a>
	</c:when>
	<c:otherwise>
		<div class="account dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown"> <span
				class="icon icon-person "></span> <span
				class="dropdown-label hidden-sm hidden-xs">${user.fullname}</span>
			</a>
	</c:otherwise>
</c:choose>


<ul class="dropdown-menu">
	<c:choose>
		<c:when test="${empty sessionScope.user}">
			<li><a href="user/account/login.php"><span
					class="icon icon-lock_outline"></span>Đăng nhập</a></li>
		</c:when>
		<c:otherwise>
			<li><a href="user/account/change.php"><span
					class="icon icon-person_add"></span>Đổi mật khẩu</a></li>
			<li><a href="user/account/edit.php"><span
					class="icon icon-person_add"></span>Chỉnh sửa thông tin</a></li>
			<li><a href="user/account/logoff.php"><span
					class="icon icon-lock_outline"></span>Đăng Xuất</a></li>
		</c:otherwise>
	</c:choose>

	<li><a href="user/account/register.php"><span
			class="icon icon-person_add"></span>Đăng kí</a></li>
</ul>
</div>