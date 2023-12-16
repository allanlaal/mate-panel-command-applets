#!/bin/bash
# hg 	= 59.066926N 24.849028E
# saue	= 59.319424N 24.553180E

COORDINATES='59.319424N 24.553180E' # decimal longitude + decimal latitude: examples:
	#	'12.12345N 56.78954E' 
	#	'-12.12345N -56.78954E' 
	#	'12.12345S 56.78954W' 
SUN_ANGLE=0.53 # sun angle above/below the horizon. examples: 
	#	 3..6	sun over horizon, but not giving warmth that much (Mosquito window)
	#	  0.5 	sun is visible			Suns lower edge is touching the horizon (the Sun is 0.53° high in our sky)
	#	  0		twilighty				Suns upper edge is just above the horizon
	#	 -6		civil twilight			Suns lower edge is 6° below the horizon. 
	#	-12		nautical twilight		Suns lower edge is 12° below the horizon. 
	#	-18		astronomical twilight	Suns lower edge is 18° below the horizon. 
	# see: https://en.wikipedia.org/wiki/Dusk#Technical_definitions
	# see: https://upload.wikimedia.org/wikipedia/commons/d/d2/Twilight_subcategories.svg

#############################################################



if [[ `sunwait poll angle civil $COORDINATES` == "DAY" ]]
then # DAY:
	# countdown till civil sunset ⭳🌇:
	date -u -d @$(($(date -d "`sunwait list 1 set civil $COORDINATES`" '+%s') - $(date -d "now" '+%s'))) '+⇩%-Hh%M'
	echo "🌇`sunwait list 1 set civil $COORDINATES`"
	
# after sunset:
else # alcom sunset (no more sunny)
	# countdown till sunrise ⭱🌅:
	date -u -d @$(($(date -d "`sunwait list 1 rise civil $COORDINATES`" '+%s') - $(date -d "now" '+%s'))) '+⇧%-Hh%M'
	
	# sunrise at:
	echo "🌅`sunwait list 1 rise civil $COORDINATES`"

fi



