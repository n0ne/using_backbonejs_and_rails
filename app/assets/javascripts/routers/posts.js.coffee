Backbone.View::close = ->
  @beforeClose()  if @beforeClose
  @remove()
  @unbind()


class App.Routers.Posts extends Backbone.Router

	routes:
		''				: 'index'
		'posts/new'		: 'add'
		'posts/:id'		: 'show'
		'posts/:id/edit': 'edit'
		'users'			: 'users'
		'users/new'		: 'newUser'
		'users/:id'		: 'showUser'
		'users/:id/edit': 'editUser'
		'help'			: 'help'

	initialize: ->
		@collection = new App.Collections.Posts()
		@collection.reset($('#all_posts_data').data('posts'))

		@users = new App.Collections.Users()
		@users.reset($('#all_users_data').data('users'))

		view = new App.Views.Menu()
		$('#sidebar').html(view.render().el)

	index: ->
		$('.current').removeClass('current')
		$('#all_posts').addClass('current')
		$('.active').removeClass('active')
		$('#home_link').addClass('active')
		view = new App.Views.PostsIndex(collection: @collection)
		@showView('#content', view)

	add: ->
		$('.current').removeClass('current')
		$('#add_post').addClass('current')
		$('.active').removeClass('active')
		$('#add_post_link').addClass('active')

		view = new App.Views.PostNew(collection: @collection)
		@showView('#content', view)

	show: (id) ->
		$('.current').removeClass('current')
		$('#all_posts').addClass('current')
		view = new App.Views.PostShow(model: @collection.get(id))
		@showView('#content', view)

	edit: (id) ->
		$('.current').removeClass('current')
		$('#all_posts').addClass('current')
		view = new App.Views.PostEdit(model: @collection.get(id))
		@showView('#content', view)

	showView: (selector, view) ->
		@currentView.close()  if @currentView
		$(selector).html view.render().el
		@currentView = view
		view

	users: ->
		$('.current').removeClass('current')
		$('#all_users').addClass('current')
		view = new App.Views.UsersIndex(collection: @users)
		@showView('#content', view)

	showUser: (id) ->
		$('.current').removeClass('current')
		$('#all_users').addClass('current')
		view = new App.Views.UserShow(model: @users.get(id))
		@showView('#content', view)

	newUser: ->
		$('.current').removeClass('current')
		$('#all_users').addClass('current')
		$('.active').removeClass('active')
		$('#add_user_link').addClass('active')
		view = new App.Views.UserNew(collection: @users)
		@showView('#content', view)

	editUser: (id) ->
		$('.current').removeClass('current')
		$('#all_users').addClass('current')
		view = new App.Views.UserEdit(model: @users.get(id))
		@showView('#content', view)

	help: ->
		$('.current').removeClass('current')
		$('#help').addClass('current')
		view = new App.Views.Help()
		@showView('#content', view)