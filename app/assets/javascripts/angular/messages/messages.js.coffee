angular.module("messages.controllers")
.controller "MessagesCtrl", [
	"$scope"
	"$http"
	"$location"
	"BACKEND"
	(scope, http, location, BACKEND) ->
		scope.messages = []

		do ->
			promise = http.get "#{BACKEND}/messages"
			promise.success (data, status, headers, config) ->
				scope.messages = data

			promise.error (data, status, headers, config) ->
				scope.messages = []

		scope.deleteMessage = (messageID, index) ->
			promise = http.delete "#{BACKEND}/messages/#{messageID}"
			promise.success (data, status, headers, config) ->
				scope.messages.splice index, 1

			promise.error (data, status, headers, config) ->
				console.log data

		scope.updateMessage = (index) ->
			postData = scope.messages[index]

			promise = http.put "#{BACKEND}/messages/#{postData.id}", postData
			promise.success (data, status, headers, config) ->
				console.log data

			promise.error (data, status, headers, config) ->
				cosnole.log data
]