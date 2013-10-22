class MessagesController < ApplicationController
	# List All Messages
	def index
		render json: Message.all
	end

	# Single Message
	def show
		@message = Message.includes(:message_plays).find(params[:id]).to_json(include: :message_plays)
		render json: @message
	end

	# Create New Message
	def create
		begin
			@message = Message.new :message => params['message'], :active => params['active']
			@message.save
		rescue bang
			# TODO: Something Useful
		end

		render json: @message
	end

	# Update Message
	def update
		@message = Message.find params[:id]
		if @message
			@message.message = params['message']
			@message.active = params['active']

			@message.save
		end

		render json: @message
	end

	# Delete Message
	def destroy
		@message = Message.find params[:id]
		if @message
			@message.destroy
		end

		render json: @message
	end
end
