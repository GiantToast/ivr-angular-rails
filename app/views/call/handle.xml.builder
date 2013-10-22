xml.instruct!
xml.Response do
	xml.Gather(:finishOnKey => "#", :action => @post_to) do
		xml.Say "Please enter your message code, and press pound when finished. . . . . . . . . . repeat.", :loop => 0
	end
	xml.Say "I'm sorry, it has been too long. Please call back and try again."
end