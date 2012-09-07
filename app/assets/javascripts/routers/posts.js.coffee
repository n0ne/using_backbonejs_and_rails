Backbone.View::close = ->
  # console.log "Closing view " + this
  @beforeClose()  if @beforeClose
  @remove()
  @unbind()


class App.Routers.Posts extends Backbone.Router

	routes:
		''				: 'index'
		'posts/new'		: 'add'
		'posts/:id'		: 'show'
		'posts/:id/edit': 'edit'

	initialize: ->
		@collection = new App.Collections.Posts()
		@collection.reset($('#all_posts_data').data('posts'))


	index: ->
		# console.log 'Routing start'
		# console.log posts
		view = new App.Views.PostsIndex(collection: @collection)
		@showView('#content', view)
		# $('#content').html(view.render().el)

	add: ->
		# view = new App.Views.PostNew(model: new App.Models.Post())
		# @showView('#content', view)

		view = new App.Views.PostNew(collection: @collection)
		@showView('#content', view)


		# $('#content').html('Add post')

	show: (id) ->
		view = new App.Views.PostShow(model: @collection.get(id))
		@showView('#content', view)
		# $('#content').html(view.render().el)

	edit: (id) ->
		# console.log "Edit post"
		# console.log id
		view = new App.Views.PostEdit(model: @collection.get(id))
		@showView('#content', view)

	showView: (selector, view) ->
		@currentView.close()  if @currentView
		$(selector).html view.render().el
		@currentView = view
		view