on run {input, parameters}
	tell application "System Events"
		-- Find the authentication code on the open Safari tab
		set theCode to "-1"
		tell application "Safari"
			set theCode to do JavaScript "document.getElementsByClassName('displaySign')[0]?.innerHTML ?? '-1'" in document 1
		end tell
	
		-- Abort if the website was not the Microsoft login page
		if theCode is "-1" then
			error "Couldn't find code on page."
			return 0
		end if
		
		-- Open iPhone Mirroring
		tell application "iPhone Mirroring" to activate
		repeat while not frontmost of application "iPhone Mirroring"
			delay 0.3
		end repeat
		
		delay 0.3

		-- The contents of iPhone Mirroring is {} when in normal operation. When
		-- there is modal views such as authentication requests or waiting to
		-- connect messages, there is contents in the accessibility inspector.
		repeat while entire contents of group 1 of window 1 of application process "iPhone Mirroring" is not {}
			delay 0.3
		end repeat
		
		delay 0.3

		-- Open Spotlight
		keystroke "3" using {command down}
		delay 1
		keystroke "Authenticator"
		delay 1
		keystroke return
		delay 2
		-- Enter the code
		keystroke theCode
		keystroke return

		delay 1

		-- Wait for the user to authenticate
		repeat while not (text field "Enter password" of group 1 of sheet 1 of window "iPhone Mirroring" of application process "iPhone Mirroring" exists)
			delay 0.3
		end repeat
		
		repeat while text field "Enter password" of group 1 of sheet 1 of window "iPhone Mirroring" of application process "iPhone Mirroring" exists
			delay 0.3
		end repeat

		delay 2
		
		-- Click past the "Do not ask me again" page
		tell application "Safari"
			activate
			do JavaScript "document.getElementById('KmsiCheckboxField').checked = true" in document 1
			do JavaScript "document.getElementById('idSIButton9').click()" in document 1
		end tell
	end tell
end run
