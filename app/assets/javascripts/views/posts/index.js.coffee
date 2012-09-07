class App.Views.PostsIndex extends Backbone.View

	template: JST['posts/index']

	# events:
	# 	'click .delete': 'deletePost'

	initialize: ->
		@collection.on('reset', @render, @)

	render: ->
		$(@el).html(@template())
		@collection.each(@appendPost)
		@

	appendPost: (post) =>
		# console.log 'PostsIndex appendPost function'
		view = new App.Views.PostItem(model: post, true)
		@$('#postslist').prepend(view.render().el)

	# deletePost: (event) ->
	# 	event.preventDefault()
	# 	console.log "Delete Item"
	# 	console.log event