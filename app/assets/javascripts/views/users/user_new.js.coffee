class App.Views.UserNew extends Backbone.View

	template: JST['users/user_new']

	events:
		'submit #new_user': 'createUser'

	initialize: ->
		console.log @collection

	render: ->
		$(@el).html(@template())
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
					required: "Title required"
					minlength: "Title at least 2 characters"
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

	createUser: (event) ->
		event.preventDefault()
		attributes =
			name:	 	$('#new_user_name').val()
			email:		$('#new_user_email').val()


		@collection.create attributes,
			wait:	true
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
					$("input[name=\'" + attribute + "\']").after('<label for="new_user_name" generated="true" class="error" style="display: block; ">' + message + '</label>')
