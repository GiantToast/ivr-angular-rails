xml.instruct!
xml.Response do
	xml.Say "Sorry, the message you are trying to find either doesn't exist or is no longer active. Please try again later"
	xml.Redirect @redirect_to
end