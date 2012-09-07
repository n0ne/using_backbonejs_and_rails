class App.Views.PostNew extends Backbone.View

	template: JST['posts/post_new']

	events:
		'submit #new_post': 'createPost'

	initialize: ->
		# @collection = new App.Collections.Posts()
		console.log @collection

	render: ->
		$(@el).html(@template())
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
				# console.log @collection
				Backbone.history.navigate('posts/' + model.get('id'), true)
				# console.log $.parseJSON(response.responseText)


		# console.log attributes

		# @model.set(attributes)

		# @model.save attributes,
		# 	wait:	true
		# 	success: (model, response) ->
		# 		console.log model.get('id')
		# 		Backbone.history.navigate('posts/' + model.get('id'), true)
				# console.log $.parseJSON(response.responseText)

		# console.log @model

		# collection = new App.Collections.Posts()

		# self = @

		# collection.create @model
		# 	wait:	true
		# 	success: (response) ->
		# 		console.log response
			# 	console.log "Success"
			# 	# Backbone.history.navigate('posts/' + self.model.id, true)

		# @collection.create attributes,
		# 	wait: true
		# 	success: ->
		# 		$('#new_post_title').val('')
		# 		$('#new_post_content').val('')
		# 	# error: @handleError