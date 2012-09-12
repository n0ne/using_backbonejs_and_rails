class App.Views.Menu extends Backbone.View

	template: JST['menu/index']

	render: ->
		$(@el).html(@template())
		@

