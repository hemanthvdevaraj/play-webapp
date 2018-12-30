<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
	<body>
		<h2>Play App.</h2>
		<span>If not redirected <a href="${pageContext.servletContext.contextPath}/userLogout">Click Here</a></span>
	</body>
</html>
<c:redirect url="/loginpage" />