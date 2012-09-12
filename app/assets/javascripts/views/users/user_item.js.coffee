class App.Views.UserItem extends Backbone.View

	template: JST['users/user_item']

	tagName:	'li'

	events:
		'click .delete'	: 'deleteUser'
		'click .edit'	: 'editUser'

	render: ->
		# console.log 'PostItem render function'
		$(@el).html(@template(user: @model))
		@

	deleteUser: (event) ->
		event.preventDefault()
		@model.destroy
			wailt: true
			success: =>
				$(@el).fadeOut()
		# console.log "Delete Item"
		# console.log event
		# console.log @model
		# $(@el).remove()

	editUser: (event) ->
		event.preventDefault()

		Backbone.history.navigate('users/' + @model.get('id') + '/edit', true)