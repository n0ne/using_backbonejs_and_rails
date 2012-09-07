class App.Views.PostItem extends Backbone.View

	template: JST['posts/post_item']

	events:
		'click .delete'	: 'deletePost'
		'click .edit'	: 'editPost'

	render: ->
		# console.log 'PostItem render function'
		$(@el).html(@template(post: @model))
		@

	deletePost: (event) ->
		event.preventDefault()
		@model.destroy
			wailt: true
			success: =>
				$(@el).fadeOut()
		console.log "Delete Item"
		# console.log event
		console.log @model
		# $(@el).remove()

	editPost: (event) ->
		event.preventDefault()

		Backbone.history.navigate('posts/' + @model.get('id') + '/edit', true)