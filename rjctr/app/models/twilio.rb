class Twilio
		account_sid = 'AC3c076ac9ad764ed233de4624370a8b97'
		auth_token = '{{2b9c570ca4b1fa9e9a68d29f39a08b53}}'
		
		@client = Twilio::REST::Client.new account_sid, auth_token
	
end