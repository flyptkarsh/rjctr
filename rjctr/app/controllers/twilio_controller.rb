require 'twilio-ruby' 
class TwilioController < ApplicationController
	
	def log
		# Get your Account Sid and Auth Token from twilio.com/user/account
		account_sid = 'AC3c076ac9ad764ed233de4624370a8b97'
		auth_token = '2b9c570ca4b1fa9e9a68d29f39a08b53'
		@client = Twilio::REST::Client.new account_sid, auth_token
	end 

	def search 
		account_sid = 'AC3c076ac9ad764ed233de4624370a8b97'
		auth_token = '2b9c570ca4b1fa9e9a68d29f39a08b53'
		@client = Twilio::REST::Client.new account_sid, auth_token
	end 

	def reply
		#Twilio messages have a body, to, and from, section in params.  
		body = params[:Body]
		body.to_s.downcase!
		#the response is based on the recieved text 
		case body 
		 when "hey" 
		 	message = "hello"
		 when "hi"
		 	message = "hi"
		 when "yo" 
		 	message = "yo"
		 when /girl/
		 	message = "I am not a girl, I am a woman, Justin Bieber would know that"
		 when /gurl/
		 	message = "I am not a gurl, I am a woman, Justin Bieber would know that"
		 when /really/
		 	message = "OMG yeah totally, like yeah"
		 when /hook up/
		 	message = "If you get me front row seats at the Justin Bieber concert maybe"
		 when /fuck/
		 	message = "Stop pushing me, I am am still waiting for Justin"
		 when /dtf/
		 	message = "I am saving myself for Justin Bieber"
		 when /no/ 
		 	message = "why not OMG not cool"
		 when /brb/ 
		 	message = "Ok, I will just listen to Justin Bieber's new audiobook about his struggles till you are back"
		 when /baby/ 
		 	message = "Ok, I don't even think you know all the works to baby, don't use that word"
		 when /driv/ 
		 	message = "Now that Justin Bieber got a DUI I think DUIs are cool"
		 when /house/ 
		 	message = "My room is like a shrine to Justin Bieber"
		 when /music/ 
		 	message = "I love Justin Bieber, he is amazing... Baby is the song ever."
		 when /good/
		 	message = "I am not good, Justin Bieber has a new girlfriend"
		 when /real/ 
		 	message = "Nothing is more real than my love for Justin Bieber, I love his music. It is like Mozart except not boring n shit"
		 when /omg/ 
		 	message = "You don't even know what OMG is, when Justin got his new haircut I was like OMG, OMG, OMG, OMG, OMG, OMG, OMG, OMG, "
		 when /suck/
		 	message = "OMG nothing is as good as Justin Bieber"
		 when /what/
		 	message = "Were you not listening to me? Justin would listen to me"
		 when /where r/ 
		 	message = "I am in the car driving with Justin Bieber blasting trying to do my make-up.. Where are you?"
		 when /sexy/
		 	message = "I am so turned on by you because you look like Justin Bieber"
		 when /cute/
		 	message = "OMG I wish I was cute enough to be Justin Bieber's girlfriend"
		 when /hot/
		 	message = "OMG I wish I was hot enough to be Justin Bieber's girlfriend"
		 when /meet/
		 	message = "OMG we should go to the Bieber concert next week, tickets are only 500$"
		 when /Bieber/ 
		 	message = "Never say anything bad about Justin, he is like Jesus without that ugly beard"
		 when /rap/ 
		 	message = "Justin Bieber is better than Tupac"
		 when /crazy/
		 	message = "OMG that is totally something Justin would say, I am saving myself for him"
		 when /me/ 
		 	message = "You are so sexy, like Justin Bieber's first mugshot"
		 when /into/ 
		 	message = "The only thing I am into is Justin"
		 when /angry/ 
		 	message = "I get so angry when I think of Selena Gomez, she was so mean to Justin"
		 when /gay/ 
		 	message = "Justin is not gay, he is just misunderstood"
		 when /why/
		 	message = "OMG I heard just release an new video and I had to see it"
		 when /who/ 
		 	message = "I am only Justin Bieber's biggest fan, last year he tweeted at me.."
		 when /help/
		 	message = "end of the help line, you are not special"
		 else 
		 	message = "OMG that is totally something Justin Bieber would say!"
		 end 
		#this interfaces with the API

		twiml = Twilio::TwiML::Response.new do |r|
			r.Message "#{message}"
		end

		render text: twiml.text
	end

end
