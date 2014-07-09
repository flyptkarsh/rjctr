class TwilioController < ApplicationController
	
	def index
		@client.all 
	end 
 
 def reply 
		
		session["counter"] ||= 0
		sms_count = session["counter"]
		
		if sms_count == 0
			message = "Hey how r u?"
		elsif 
			message = "Hello, thanks for message number #{sms_count + 1}"
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
