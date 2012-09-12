class App.Views.PostItem extends Backbone.View

	template: JST['posts/post_item']

	tagName:	'li'

	events:
		'click .delete'	: 'deletePost'
		'click .edit'	: 'editPost'

	render: ->
		$(@el).html(@template(post: @model))
		@

	deletePost: (event) ->
		event.preventDefault()
		@model.destroy
			wailt: true
			success: =>
				$(@el).fadeOut()

	editPost: (event) ->
		event.preventDefault()

		Backbone.history.navigate('posts/' + @model.get('id') + '/edit', true)