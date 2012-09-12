class App.Views.UserShow extends Backbone.View

	template: JST['users/user_show']

	events:
		"click .edit"	: 'editUser'

	render: ->
		$(@el).html(@template(user: @model))
		@

	editUser: (event) ->
		event.preventDefault()
		Backbone.history.navigate('users/' + @model.get('id') + '/edit', true)