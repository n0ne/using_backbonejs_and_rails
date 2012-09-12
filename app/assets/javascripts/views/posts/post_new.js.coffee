class App.Views.PostNew extends Backbone.View

	template: JST['posts/post_new']

	events:
		'submit #new_post': 'createPost'

	render: ->
		$(@el).html(@template())
		@$('form').validate
			rules:
				title:
					required:	true
					minlength: 	2
				body:
					required:	true
					minlength: 	2
			messages:
				title:
					required: "Title required"
					minlength: "Title at least 2 characters"
				body:
					required: "Content required"
					minlength: "Content at least 2 characters"
			highlight: (element, errorClass) ->
		       $(element).addClass('error')
		       $(element).parent().parent().addClass('error')
			unhighlight: (element, errorClass) ->
				$(element).removeClass('error')
				$(element).parent().parent().removeClass('error')
		@

	createPost: (event) ->
		event.preventDefault()
		attributes =
			title:	 	$('#new_post_title').val()
			content:	$('#new_post_content').val()


		@collection.create attributes,
			wait:	true
			success: (model, response) ->
				console.log model.get('id')
				Backbone.history.navigate('posts/' + model.get('id'), true)