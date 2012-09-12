class App.Views.UsersIndex extends Backbone.View

	template: JST['users/index']

	initialize: ->
		@collection.on('reset', @render, @)

	render: ->
		$(@el).html(@template())
		@collection.each(@appendUser)
		@

	appendUser: (user) =>
		view = new App.Views.UserItem(model: user, true)
		@$('#userslist').prepend(view.render().el)