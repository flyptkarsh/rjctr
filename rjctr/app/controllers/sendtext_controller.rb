class SendTextController < ApplicationController
	def index 
	end

	def send_text_message 
		number_to_send_to = params[:number_to_send_to]

		twilio_sid = "AC3c076ac9ad764ed233de4624370a8b97"
		twilio_token = "2b9c570ca4b1fa9e9a68d29f39a08b53"
		twilio_phone_number = "9493976547"

		@twilio_client = Twilio:REST:Client.new twilio_sid, twilio_token

		@twilio_client.account.sms.messages.create(
			:from => "+1#{twilio_phone_number}", 
			:to => number_to_send_to
			:body => "This is a message from rejctr"
			)
	end 
	
	
end