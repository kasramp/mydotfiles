import time
import commands
is_muted = False
while(1):
	status = commands.getstatusoutput('playerctl metadata')
	is_ad = "spotify:ad" in status[1]
	if(is_ad):
		if(not is_muted):
			commands.getstatusoutput('amixer -D pulse set Master 1+ toggle')
			is_muted = True
		print "Spotify ad is playing..."
	else:
		if(is_muted):
			commands.getstatusoutput('amixer -D pulse set Master 1+ toggle')
			is_muted = False
	time.sleep(1)
