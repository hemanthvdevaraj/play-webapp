<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id="test">
	<h1>User Register</h1>
	
	<table class="table">
		<thead>
			<tr>
				<th>User ID</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>E-mail</th>
				<th>Status</th>
				<th>Time Stamp</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="user" items="${userdetails}">
				<tr>
					<td><c:out value="${user.userid}" /></td>
					<td><c:out value="${user.firstname}" /></td>
					<td><c:out value="${user.lastname}" /></td>
					<td><c:out value="${user.email}" /></td>
					<td><c:out value="${user.status}" /></td>
					<td><c:out value="${user.timestamp}" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<button id="testfooter" title="To Test Footer" class="btn btn-default">Add more content</button>
<div id="test2"></div>

<script>
$(document).ready(function() {
	$("#testfooter").click(function(){
		//alert($("#test").html());
		var htmlText = $("#test").html();
		$("#test2").append(htmlText);
	});
});
</script>