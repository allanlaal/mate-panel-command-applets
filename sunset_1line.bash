#!/bin/bash
# hg 	= 59.066926N 24.849028E
# saue	= 59.319424N 24.553180E

COORDINATES='59.319424N 24.553180E' # decimal longitude + decimal latitude: examples:
	#	'12.12345N 56.78954E' 
	#	'-12.12345N -56.78954E' 
	#	'12.12345S 56.78954W' 
SUN_ANGLE=0.53 # sun angle above/below the horizon. examples: 
	#	  0.5 	sun is visible			Suns lower edge is touching the horizon (the Sun is 0.53° high in our sky)
	#	  0		twilighty				Suns upper edge is just above the horizon
	#	 -6		civil twilight			Suns lower edge is 6° below the horizon. 
	#	-12		nautical twilight		Suns lower edge is 12° below the horizon. 
	#	-18		astronomical twilight	Suns lower edge is 18° below the horizon. 
	# see: https://en.wikipedia.org/wiki/Dusk#Technical_definitions
	# see: https://upload.wikimedia.org/wikipedia/commons/d/d2/Twilight_subcategories.svg

#############################################################
# 🌇 ⤓⭱ 🌅🔅  ☼



#~ # midday:
#~ echo -n "🔅`sunwait report 1 			 $COORDINATES | grep 'Sun directly north/south' | sed 's/   Sun directly north\/south: //' | sed 's/ //'`"

# day length:
echo -n "⏳`sunwait report 1 			 $COORDINATES | grep Duration | sed 's/ Duration ...    Day length: //' | sed 's/ hours//' | sed 's/:/h/'`"
echo -n " "

# sunrise:
echo -n  "🌅`sunwait list 1 rise angle $SUN_ANGLE $COORDINATES`"
echo -n " "

# sunset:
echo -n "🌇`sunwait list 1 set angle $SUN_ANGLE $COORDINATES`"
echo -n " "

#~ # civil sunset:
#~ echo -n "🕮`sunwait list 1 set civil $COORDINATES`"
#~ echo -n " "

#~ # 5h from sunset:
#~ echo -n  "☭`sunwait list 1 set angle $SUN_ANGLE  offset 5:0:0 $COORDINATES`"



if [[ "$(( `sunwait poll angle $SUN_ANGLE $COORDINATES`))" == "DAY" ]]
then # DAY:
	# countdown till sunset ⭳🌇:
	date -u -d @$(($(date -d "`sunwait list 1 set 	angle $SUN_ANGLE $COORDINATES`" '+%s') - $(date -d "now" '+%s'))) '+⇩%-Hh%M'
else # NIGHT:
	# countdown till sunrise ⭱🌅:
	date -u -d @$(($(date -d "`sunwait list 1 rise 	angle $SUN_ANGLE $COORDINATES`" '+%s') - $(date -d "now" '+%s'))) '+⇧%-Hh%M'
fi



