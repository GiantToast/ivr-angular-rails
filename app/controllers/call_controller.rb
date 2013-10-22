require 'twilio-ruby'
class CallController < ApplicationController
	# Base Url
	BASE_URL = "https://73016a0e.ngrok.com/api"

	# Entry point to the IVR System
	def handle_call
		@post_to = BASE_URL + "/play"
		render :action => "handle.xml.builder"
	end

	# Looks up message using entered number and plays it
	def play_message
		if params['Digits'] == "*"
			render :action => "end.xml.builder"
			return
		end

		begin
			@message = Message.find params['Digits']
			if @message and @message.active
				@message_play = MessagePlay.new do |mp|
					mp.phonenumber = params['Caller']
					mp.message = @message
				end
				@message_play.save

				render :action => "play_message.xml.builder"
			else
				render :action => "no_message.xml.builder"
			end
		rescue ActiveRecord::RecordNotFound
			render :action => "no_message.xml.builder"
		end
	end

	# Ends the call
	def end_call
		render :action => "end.xml.builder"
	end
end
