class App.Views.UserEdit extends Backbone.View

	template: JST["users/user_edit"]

	events:
		'submit #update_user': 'updateUser'

	render: ->
		$(@el).html(@template(user: @model))
		@$('form').validate
			rules:
				name:
					required:	true
					minlength: 	2
				email:
					required:	true
					minlength: 	2
					email: 		true
			messages:
				name:
					required: 	"Name required"
					minlength: 	"Name at least 2 characters"
				email:
					required: 	"Email required"
					minlength: 	"Email at least 2 characters"
					email:		"Must be valid email format"
			highlight: (element, errorClass) ->
		       $(element).addClass('error')
		       $(element).parent().parent().addClass('error')
			unhighlight: (element, errorClass) ->
				$(element).removeClass('error')
				$(element).parent().parent().removeClass('error')
		@

	updateUser: (event) ->
		console.log @model.get('id')
		event.preventDefault()
		attributes =
			name:	 	$('#update_user_name').val()
			email: 		$('#update_user_email').val()

		@model.save attributes,
			wait: true
			success: (model, response) ->
				Backbone.history.navigate('users/' + model.get('id'), true)
			error: @handleError

	handleError: (model, response) ->
		if response.status == 422
			errors = $.parseJSON(response.responseText).errors
			for attribute, messages of errors
				for message in messages
					message = message.charAt(0).toUpperCase() + message.slice(1);
					$("input[name=\'" + attribute + "\']").parent().parent().addClass('error')
					$("input[name=\'" + attribute + "\']").addClass('error')
					$("input[name=\'" + attribute + "\']").after('<label for="update_user_name" generated="true" class="error" style="display: block; ">' + message + '</label>')

