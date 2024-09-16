on run {input, parameters}
	tell application "System Events"
		set theCode to "-1"
		tell application "Safari"
			set theCode to do JavaScript "document.getElementsByClassName('displaySign')[0]?.innerHTML ?? '-1'" in document 1
		end tell
	
		if theCode is "-1" then
			error "Couldn't find code on page."
			return 0
		end if
		
		tell application "iPhone Mirroring" to activate
		repeat while not frontmost of application "iPhone Mirroring"
			delay 0.3
		end repeat
		
		delay 0.3

		repeat while entire contents of group 1 of window 1 of application process "iPhone Mirroring" is not {}
			delay 0.3
		end repeat
		
		delay 0.3

		keystroke "3" using {command down}
		delay 1
		keystroke "Authenticator"
		delay 1
		keystroke return
		delay 2
		keystroke theCode
		keystroke return

		delay 1

		repeat while not (text field "Enter password" of group 1 of sheet 1 of window "iPhone Mirroring" of application process "iPhone Mirroring" exists)
			delay 0.3
		end repeat
		
		repeat while text field "Enter password" of group 1 of sheet 1 of window "iPhone Mirroring" of application process "iPhone Mirroring" exists
			delay 0.3
		end repeat

		delay 2
		
		tell application "Safari"
			activate
			set theCode to do JavaScript "document.getElementById('KmsiCheckboxField').checked = true" in document 1
			do JavaScript "document.getElementById('idSIButton9').click()" in document 1
		end tell
	end tell
end run
