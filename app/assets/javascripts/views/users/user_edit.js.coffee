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
			messages:
				name:
					required: "Title required"
					minlength: "Title at least 2 characters"
				email:
					required: "Content required"
					minlength: "Content at least 2 characters"
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

		# @collection.create attributes,
		# 	wait:	true
		# 	success: (model, response) ->
		# 		console.log model.get('id')
		# 		# console.log @collection
		# 		Backbone.history.navigate('posts/' + model.get('id'), true)
		# 		# console.log $.parseJSON(response.responseText)