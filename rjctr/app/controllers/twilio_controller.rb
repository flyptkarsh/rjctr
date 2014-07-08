class TwilioController < ApplicationController
	def test
		twiml = Twilio::TwiML::Response.new do |r|
    		r.Message "Hey Monkey. Thanks for the message!"
 		end
  		render text: twiml.text
	end 


end