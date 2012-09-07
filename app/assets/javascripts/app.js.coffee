window.App =
	Models: {}
	Collections: {}
	Views: {}
	Routers: {}
	init: ->
		new App.Routers.Posts()
		Backbone.history.start()

$(document).ready ->
 	App.init()
