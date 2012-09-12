class App.Views.Help extends Backbone.View

	template: JST['help/index']

	render: ->
		$(@el).html(@template())
		@
