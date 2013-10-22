angular.module("messages.controllers")
.controller "MessageDetailCtrl", [
	"$scope"
	"$http"
	"$routeParams"
	"$location"
	"BACKEND"
	(scope, http, routeParams, location, BACKEND) ->
		messageID = routeParams.id
		scope.message = {}

		do ->
			promise = http.get "#{BACKEND}/messages/#{messageID}"
			promise.success (data, status, headers, config) ->
				scope.message = data

			promise.error (data, status, headers, config) ->
				console.log data
				scope.message = {}
]