class App.Views.PostEdit extends Backbone.View

	template: JST["posts/post_edit"]

	events:
		'submit #update_post': 'updatePost'

	render: ->
		$(@el).html(@template(post: @model))
		@$('form').validate
			rules:
				title:
					required:	true
					minlength: 	2
				body:
					required:	true
					minlength: 	2
			highlight: (element, errorClass) ->
		       $(element).addClass('error')
		       $(element).parent().parent().addClass('error')
			unhighlight: (element, errorClass) ->
				$(element).removeClass('error')
				$(element).parent().parent().removeClass('error')
		@

	updatePost: (event) ->
		console.log @model.get('id')
		event.preventDefault()
		attributes =
			title:	 	$('#update_post_title').val()
			content:	$('#update_post_content').val()

		@model.save attributes,
			wait: true
			success: (model, response) ->
				Backbone.history.navigate('posts/' + model.get('id'), true)