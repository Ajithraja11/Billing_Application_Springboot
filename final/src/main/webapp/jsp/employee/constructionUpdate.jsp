<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

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

h2 {
	padding: 0px;
	margin: 0px;
}
</style>

</head>

<body>
	<jsp:include page="/jsp/employee/header.jsp"></jsp:include>
	<div class="container">
		<ul class="nav nav-pills nav-justified">
			<li><a href="/employee/index">Home</a></li>
			<li class="active"><a href="/employee/construction">Construction</a></li>
			<li><a href="/employee/interior">Interior</a></li>
			<li><a href="/employee/paint">Paint</a></li>

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
	<h3>Construction Old Bill Update Section</h3>
	<br>

	<div class="container">
		<div class="row">
			<div class="col-sm-8 ">
				<form:form action="/employee/constructioUpdateForm"
					modelAttribute="constructionupdate">


					<div class="labels">Name of the customer(*):</div>
					<div class="input">
						<form:input path="customer_name" value="${name }" />
						<form:errors path="customer_name" cssClass="error" />
					</div>
					<br>
					<br>
					<div class="labels">Receipt number:</div>
					<div class="input">
						<form:input path="id" value="${receiptNumber }" />
						<form:errors path="id" cssClass="error" />
					</div>
					<br>
					<br>
					<div class="labels">Number of units of sand:</div>
					<div class="input">
						<form:input path="sand_unit"
							value="${constructionupdate.sand_unit }"></form:input>
						<form:errors path="sand_unit" cssClass="error" />
					</div>
					<br>
					<br>
					<div class="labels">Number of Bricks 6" inch:</div>
					<div class="input">
						<form:input path="bricks_6"
							value="${constructionupdate.bricks_6 }" />
						<form:errors path="bricks_6" cssClass="error" />
					</div>
					<br>
					<br>
					<div class="labels">Number of Bricks 10" inch:</div>
					<div class="input">
						<form:input path="bricks_10"
							value="${constructionupdate.bricks_10 }" />
						<form:errors path="bricks_10" cssClass="error" />
					</div>
					<br>
					<br>
					<div class="labels">Number of Cement bags:</div>
					<div class="input">
						<form:input path="cementBag"
							value="${constructionupdate.cementBag }" />
						<form:errors path="cementBag" cssClass="error" />
					</div>
					<br>
					<br>
					<div class="submit">
						<input class="btn btn-primary" type="submit" value="Update Bill" />
					</div>

				</form:form>
			</div>

		</div>