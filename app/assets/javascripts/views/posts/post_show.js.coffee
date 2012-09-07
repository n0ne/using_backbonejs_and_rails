class App.Views.PostShow extends Backbone.View

	template: JST['posts/post_show']

	events:
		"click .edit"	: 'editPost'

	render: ->
		$(@el).html(@template(post: @model))
		@

	editPost: (event) ->
		event.preventDefault()
		Backbone.history.navigate('posts/' + @model.get('id') + '/edit', true)