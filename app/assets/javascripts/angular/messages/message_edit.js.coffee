angular.module("messages.controllers")
.controller "EditMessageCtrl", [
	"$scope"
	"$http"
	"$location"
	"$routeParams"
	"BACKEND"
	(scope, http, location, routeParams, BACKEND, auth) ->
		scope.message = {}

		do ->
			if routeParams.id?
				promise = http.get "#{BACKEND}/messages/#{routeParams.id}"
				promise.success (data, status, headers, config) ->
					scope.message = data

				promise.error (data, status, headers, config) ->
					console.log data
					scope.message = {}

		scope.save = ->
			if routeParams.id?
				promise = http.put "#{BACKEND}/messages/#{routeParams.id}", scope.message
			else
				promise = http.post "#{BACKEND}/messages", scope.message
			
			promise.success (data, status, headers, config) ->
				location.path "/messages/#{data.id}"

			promise.error (data, status, headers, config) ->
				console.log data
				scope.message = {}
]