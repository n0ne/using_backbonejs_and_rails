class App.Views.UserItem extends Backbone.View

	template: JST['users/user_item']

	tagName:	'li'

	events:
		'click .delete'	: 'deleteUser'
		'click .edit'	: 'editUser'

	render: ->
		$(@el).html(@template(user: @model))
		@

	deleteUser: (event) ->
		event.preventDefault()
		@model.destroy
			wailt: true
			success: =>
				$(@el).fadeOut()

	editUser: (event) ->
		event.preventDefault()

		Backbone.history.navigate('users/' + @model.get('id') + '/edit', true)