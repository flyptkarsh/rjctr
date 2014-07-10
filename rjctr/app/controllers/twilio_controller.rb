class TwilioController < ApplicationController
	
	def index 
		# Get your Account Sid and Auth Token from twilio.com/user/account
		account_sid = 'AC3c076ac9ad764ed233de4624370a8b97'
		auth_token = '2b9c570ca4b1fa9e9a68d29f39a08b53'
		@client = Twilio::REST::Client.new account_sid, auth_token
	end 

	# def create
	# 	@client = Twilio::REST::Client.new account_sid, auth_token


	# end 

	def reply 
		session["counter"] ||= 0
		sms_count = session["counter"]
		
		if sms_count == 13
			message = "Fucking bitches making money!"
		else
			message = "Hello, thanks for message number #{sms_count + 1}"
		end
		twiml = Twilio::TwiML::Response.new do |r|
		r.Sms message
	end
		session["counter"] += 1
		render text: twiml.text
	end
end
