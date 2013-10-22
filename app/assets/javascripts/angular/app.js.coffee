#Define our main app module and its dependencies
angular.module "messages.app", [
	"messages.controllers"
	"messages.directives"
	"messages.services"
	"messages.config"
]

# Sub Modules
angular.module "messages.controllers", []
angular.module "messages.directives", []
angular.module "messages.services", []
angular.module "messages.config", []

# Setup routes and turn on HTML5 push state
angular.module("messages.app").config [
	"$routeProvider"
	"$locationProvider"
	(routeProvider, locationProvider) ->
		locationProvider.html5Mode true

		routeProvider
			.when "/",
				templateUrl: "/templates/main/main.html"
			.when "/messages",
				templateUrl: "/templates/messages/messages.html"
				controller: "MessagesCtrl"
			.when "/messages/new",
				templateUrl: "/templates/messages/message_edit.html"
				controller: "EditMessageCtrl"
			.when "/messages/:id",
				templateUrl: "/templates/messages/message_detail.html"
				controller: "MessageDetailCtrl"
			.when "/messages/:id/edit",
				templateUrl: "/templates/messages/message_edit.html"
				controller: "EditMessageCtrl"
			.when "/404",
				templateUrl: "/404.html"
			.when "422",
				templateUrl: "/422.html"			
			.when "500",
				templateUrl: "/500.html"			
			.otherwise
				redirectTo: "/404"
]