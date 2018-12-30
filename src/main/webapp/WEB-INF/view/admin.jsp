<form:form cssClass="form-horizontal col-sm-10" id="createUserForm" method="post" action="createUser" modelAttribute="user">
	<fieldset>
		<div id="legend">
			<legend class="">Register</legend>
		</div>
		<div class="form-group">
			<form:label path="userid">User ID</form:label>
			<form:input id="userid" path="userid" placeholder="User ID" cssClass="form-control" />
			<p class="help-block">User ID can contain any letters or numbers, without spaces</p>
		</div>

		<div class="form-group">
			<form:label path="firstname">First Name</form:label>
			<form:input id="firstname" path="firstname" placeholder="First Name" cssClass="form-control" />
		</div>

		<div class="form-group">
			<form:label path="lastname">Last Name</form:label>
			<form:input id="lastname" path="lastname" placeholder="Last Name" cssClass="form-control" />
		</div>

		<div class="form-group">
			<form:label path="email">E-mail</form:label>
			<form:input id="email" path="email" placeholder="E-mail" cssClass="form-control" />
		</div>

		<div class="form-group">
			<form:label path="password">Password</form:label>
			<form:password id="password" path="password" placeholder="Password" cssClass="form-control" />
			<p class="help-block">Password should be at least 4 characters</p>
		</div>

		<div class="form-group">
			<label for="password_confirm">Password (Confirm)</label>
			<input type="password" name="password_confirm" placeholder="Confirm Password" class="form-control" />
			<p class="help-block">Please confirm password</p>
		</div>

		<div class="form-group">
			<button type="submit" class="btn btn-success">Register</button>
		</div>
	</fieldset>
</form:form>

<script>
	$(document).ready(function () {
		$('#createUserForm').validate({
		    rules: {
		    	userid: {
		    		minlength: 5,
		    	},
		        firstname: {
		            minlength: 2,
		            required: true
		        },
		        email: {
		            required: true,
		            email: true
		        },
		        message: {
		            minlength: 2,
		            required: true
		        }
		    },
		    highlight: function (element) {
		    	$(element).closest('.form-group').addClass('has-error');
		    },
		    unhighlight: function(element) {
	            $(element).closest('.form-group').removeClass('has-error');
	        },
	        errorElement: 'span',
	        errorClass: 'help-block',
	        errorPlacement: function(error, element) {
	            if(element.parent('.input-group').length) {
	                error.insertAfter(element.parent());
	            } else {
	                error.insertAfter(element);
	            }
	        }
		});
	});
</script>