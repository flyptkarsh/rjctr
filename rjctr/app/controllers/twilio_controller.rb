class TwilioController < ApplicationController
	
	def index 
		# Get your Account Sid and Auth Token from twilio.com/user/account
		account_sid = 'AC3c076ac9ad764ed233de4624370a8b97'
		auth_token = '2b9c570ca4b1fa9e9a68d29f39a08b53'
		@client = Twilio::REST::Client.new account_sid, auth_token
	end 


	def reply
		body = params[:body]
		message_type = {"hi" => "hello"}


			if body == message_type["hi"]
					message = "Hello"
				else
					message = "My Bieber fever is so bad today" 
			end
		twiml = Twilio::TwiML::Response.new do |r|
			r.Message "#{message}"
		end
		render text: twiml.text
	end
end
