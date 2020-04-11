<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>

<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript"
	src="https://gc.kis.v2.scr.kaspersky-labs.com/FD126C42-EBFA-4E12-B309-BB3FDD723AC1/main.js?attr=4vuHN2TAmW7A9LlPQmVgS38lomlq4rWQKMkmqeD7rwUjjbPrTalfW4C6nqAssgu2t-b4l6i59VqLwS5ABqzV2Q"
	charset="UTF-8"></script>
<script type="text/javascript"
	src="https://gc.kis.v2.scr.kaspersky-labs.com/FD126C42-EBFA-4E12-B309-BB3FDD723AC1/main.js?attr=_yyNbYB4FxfT79hFbiHUzO0WabD9MirvbjkGZQjyYmorjG9JLXvomMoIzony51s2BJDObwmomO_CR-J-8b5Sbg"
	charset="UTF-8"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
.jumbotron {
	margin-bottom: 0;
}

hr.new4 {
	border: 1px solid lightgrey;
	margin-top: 0px
}
</style>

</head>

<body>
	<jsp:include page="/jsp/employee/header.jsp"></jsp:include>
	<div class="container">
		<ul class="nav nav-pills nav-justified">
			<li><a href="/employee/index">Home</a></li>
			<li><a href="/employee/construction">Construction</a></li>
			<li><a href="/employee/interior">Interior</a></li>
			<li class="active"><a href="/employee/paint">Paint</a></li>

			<sec:authorize access="!isAuthenticated()">
				<li><a href="${pageContext.request.contextPath}/public/login">Login</a></li>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<li><form:form
						action="${pageContext.request.contextPath}/logout" method="POST">
						<input class="btn btn-link" type="submit" value="Logout" />
					</form:form></li>
			</sec:authorize>
		</ul>
	</div>
	<hr class="new4">


	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6 well">
			<h4 class="text-success">
				<a href="paintOldBill">Get another old bill</a>
			</h4>
			<table class="table">
				<tr>
					<td class="text-left"><strong>Customer Name:</strong>
						${paint.customer_name }</td>
					<td> </td>
					<td> </td>
					<td class="text-center"><strong>Order id:</strong>
						${receiptNumber}</td>
				</tr>
				<tr>
					<th><strong>Product</strong></th>
					<th><strong>#</strong></th>
					<th><strong>Price</strong></th>
					<th class="text-center"><strong>Total</strong></th>
				</tr>

				<c:if test="${paint.size30ml>0}">
					<tr>
						<td>30ml</td>
						<td>${paint.size30ml}</td>
						<td>${paint.price30ml }</td>
						<td class="text-center">${paint.totalprice30ml }</td>
					</tr>
				</c:if>
				<c:if test="${paint.size100ml>0}">
					<tr>
						<td>100ml</td>
						<td>${paint.size100ml}</td>
						<td>${paint.price100ml }</td>
						<td class="text-center">${paint.totalprice100ml }</td>
					</tr>
				</c:if>
				<c:if test="${paint.size500ml>0}">
					<tr>
						<td>500ml</td>
						<td>${paint.size500ml}</td>
						<td>${paint.price500ml }</td>
						<td class="text-center">${paint.totalprice500ml }</td>
					</tr>
				</c:if>
				<c:if test="${paint.size1l>0}">
					<tr>
						<td>1L</td>
						<td>${paint.size1l}</td>
						<td>${paint.price1l }</td>
						<td class="text-center">${paint.totalprice1l }</td>
					</tr>
				</c:if>
				<tr>
					<td> </td>
					<td> </td>
					<td class="text-right"><h4>
							<strong>Total: </strong>
						</h4></td>
					<td class="text-center text-danger"><h4>
							<strong>${paint.totalAmount} Rs</strong>
						</h4></td>
				</tr>
			</table>
		</div>
		<div class="col-sm-3"></div>
	</div>

</body>
</html>