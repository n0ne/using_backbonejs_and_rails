class App.Views.PostsIndex extends Backbone.View

	template: JST['posts/index']

	initialize: ->
		@collection.on('reset', @render, @)

	render: ->
		$(@el).html(@template())
		@collection.each(@appendPost)
		@

	appendPost: (post) =>
		view = new App.Views.PostItem(model: post, true)
		@$('#postslist').prepend(view.render().el)
