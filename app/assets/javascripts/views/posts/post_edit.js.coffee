class App.Views.PostEdit extends Backbone.View

	template: JST["posts/post_edit"]

	events:
		'submit #update_post': 'updatePost'

	render: ->
		$(@el).html(@template(post: @model))
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

		# @collection.create attributes,
		# 	wait:	true
		# 	success: (model, response) ->
		# 		console.log model.get('id')
		# 		# console.log @collection
		# 		Backbone.history.navigate('posts/' + model.get('id'), true)
		# 		# console.log $.parseJSON(response.responseText)