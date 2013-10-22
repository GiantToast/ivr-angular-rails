xml.instruct!
xml.Response do
	xml.Gather(:numDigits => 1) do
		xml.Say "Press star to end the message, wait for the call to end, or hang up. #{@message.message} . . . . . . . . . repeat.", :loop => 0
	end
end