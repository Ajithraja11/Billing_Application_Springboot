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


	<div class="container">
		<div class="row">
			<div class="span12">
				<c:if test="${show==1}">
					<fieldset>
						<legend>
							Enter <strong>Receipt</strong> of the old customer bill to
							display-<a href="/employee/paint">Back</a>
						</legend>
					</fieldset>


					<form:form action="getPaintBill" modelAttribute="receipt">
						<p class="text-center">
							<form:input path="receipt" />
							<form:errors path="receipt" cssClass="error" />
							<input type="submit" value="Get order" />
						</p>
					</form:form>
				</c:if>

				<c:if test="${show==0}">
					<fieldset>
						<legend>
							Enter <strong>Receipt</strong> of the old customer bill to
							update-<a href="/employee/paint">Back</a>
						</legend>
					</fieldset>
					<form:form action="getUpdateInteriorBill" modelAttribute="receipt">
						<p class="text-center">
							<form:input path="receipt" />
							<form:errors path="receipt" cssClass="error" />
							<input type="submit" value="Get order" />
						</p>
					</form:form>
				</c:if>

			</div>
		</div>
	</div>

</body>
</html>