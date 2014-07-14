require 'twilio-ruby' 
class TwilioController < ApplicationController
	def log
		if !session[:current_user]
			redirect_to welcome_index_path
		end 
		# Get your Account Sid and Auth Token from twilio.com/user/account
		@client = Twilio::REST::Client.new ENV["TWILIO_SID"] , ENV["TWILIO_TOKEN"]
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
		 when "hey!" 
		 	message = "hello"
		 when "what is the meaning of life?"
		 	message = "42"
		 when /girl/
		 	message = "I am not a girl, I am a woman, Justin Bieber would know that"
		 when /gurl/
		 	message = "I am not a gurl, I am a woman, Justin Bieber would know that"
		 when /really/
		 	message = "OMG yeah totally, like yeah"
		 when /hook up/
		 	message = "If you get me front row seats at the Justin Bieber concert maybe"
		 when /fuck/ && /justin/
		 	message = "You are a monster, Justin Bieber is the best"
		 when /eat/ && /shit/
		 	message = "I think Justin Bieber is a vegatarian, is that vegatarian?"
		 when /dick/ 
		 	message = "I don't go for the little ones, unless it is Justin Bieber's" 
		 when /cock/ 
		 	message = "Justin Bieber is like 10 inches longer than you"
		 when /dtf/
		 	message = "I am saving myself for Justin Bieber"
		 when /no/ 
		 	message = "why not OMG not cool"
		 when /stfu/ 
		 	message = "OMG no, I will say whatever I feel like."
		 when /jk/ 
		 	message = "JK, my love for Justin Bieber is not something to jk about."
		 when /brb/ 
		 	message = "OMG Ok, I will just listen to Justin Bieber's new audiobook about his struggles till you are back"
		 when /baby/ 
		 	message = "OMG Ok, I don't even think you know all the works to 'Baby', don't use that word"
		 when /driv/ 
		 	message = "Now that Justin Bieber got a DUI I think DUIs are cool"
		 when /house/ 
		 	message = "My room is like a shrine to Justin Bieber"
		 when /music/ 
		 	message = "OMG I love Justin Bieber, he is amazing... Baby is the song ever."
		 when /good/
		 	message = "I am not good, Justin Bieber has a new girlfriend"
		 when /real/ 
		 	message = "Nothing is more real than my love for Justin Bieber, I love his music. It is like Mozart except not boring n shit"
		 when /omg/ 
		 	message = "You don't even know what OMG is, when Justin got his new haircut I was like OMG, OMG, OMG, OMG, OMG, OMG, OMG, OMG, "
		 when /test/ 
		 	message = "Of course is works"
		 when /yay/
		 	message = "I know that is how I feel about Justin Bieber"
		 when /taco/
		 	message = "the only person getting in my taco is Justin Bieber" 
		 when /damn/
		 	message = "Yeah you better not insult Justin Bieber"
		 when /what/
		 	message = "Were you not listening to me? Justin would listen to me"
		 when /where/ 
		 	message = "I am in the car driving with Justin Bieber blasting trying to do my make-up.. Where are you?"
		 when /sexy/
		 	message = "I am so turned on by you because you look like Justin Bieber"
		 when /cute/
		 	message = "OMG I wish I was cute enough to be Justin Bieber's girlfriend"
		 when /hot/
		 	message = "OMG I wish I was hot enough to be Justin Bieber's girlfriend"
		 when /meet/
		 	message = "OMG we should go to the Bieber concert next week, tickets are only 500$"
		 when /rap/ 
		 	message = "OMG Justin Bieber is better than Tupac"
		 when /suck/
		 	message = "OMG nothing is as good as Justin Bieber"
		 when /crazy/
		 	message = "OMG that is totally something Justin would say, I am saving myself for him"
		 when /me/ 
		 	message = "OMG You are so sexy, like Justin Bieber's first mugshot"
		 when /into/ 
		 	message = "OMG The only thing I am into is Justin"
		 when /angry/ 
		 	message = "OMG I get so angry when I think of Selena Gomez, she was so mean to Justin"
		 when /gay/ 
		 	message = "OMG Justin is not gay, he is just misunderstood"
		 when /why/
		 	message = "OMG I heard just release an new video and I had to see it"
		 when /who/ 
		 	message = "OMG I am only Justin Bieber's biggest fan, last year he tweeted at me.."
		 when /fuck/
		 	message = "Stop pushing me, I am am still waiting for Justin"
		 when /bieber/ 
		 	message = "Never say anything bad about Justin, he is like Jesus without that ugly beard"
		 else 
		 	random_responses= ["OMG that is totally something Justin Bieber would say!", "Really? I wonder what Justin would think", "Tell me more, I am not sure what you mean.", "Are you kidding?", "Really, that is all you have to say?", "Just think, What would Justin Bieber do and then text me back"]
		 	message = random_responses.sample 
		 end 
		 # this delays sending the text in order to seem more believable
		 sleep(3)
		#this interfaces with the API
		twiml = Twilio::TwiML::Response.new do |r|
			r.Message "#{message}"
		end
		render text: twiml.text
	end

end
