<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<body>
	<h1>Vanakkam, thambi</h1>
	<form:form action="${pageContext.request.contextPath}/public/login"
		method="GET">
		<input type="submit" value="Login" />
	</form:form>

	<c:if test="${param.login!=null }">
		<form:form action="${pageContext.request.contextPath}/logout"
			method="POST">
			<input type="submit" value="Logout" />
		</form:form>
	</c:if>

	<form:form action="${pageContext.request.contextPath}/employee/index"
		method="GET">
		<input type="submit" value="Employee page" />
	</form:form>
	<form:form action="${pageContext.request.contextPath}/admin/index"
		method="GET">
		<input type="submit" value="Admin page" />
	</form:form>
</body>

</html>