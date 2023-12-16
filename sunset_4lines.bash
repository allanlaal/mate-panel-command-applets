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
# 🌇 ⤓⭱ 🌅🔅  ☼


# sunrise:
#~ echo "🌅`sunwait list 1 rise angle $SUN_ANGLE $COORDINATES`"
#~ echo "🌅`sunwait list 1 rise angle -3.33 $COORDINATES`"

#~ if [[ `sunwait poll angle $SUN_ANGLE $COORDINATES` == "DAY" ]]
#~ then # DAY:
	#~ # countdown till sunset ⭳🌇:
	#~ date -u -d @$(($(date -d "`sunwait list 1 set 	angle $SUN_ANGLE $COORDINATES`" '+%s') - $(date -d "now" '+%s'))) '+⇩%-Hh%M'
	#~ echo "🔅`sunwait list 1 set angle $SUN_ANGLE $COORDINATES`"
	
	#~ # after sunset:
#~ else if [[ `sunwait poll angle civil $COORDINATES` == "DAY" ]]
	#~ then # alcom sunset (no more sunny)
		#~ # countdown till CIVIL sunset ⭳🌇:
		#~ date -u -d @$(($(date -d "`sunwait list 1 set civil $COORDINATES`" '+%s') - $(date -d "now" '+%s'))) '+🌇%-Hh%M'
		#~ echo "🌇`sunwait list 1 set civil $COORDINATES`"
	#~ else # alcom sunset (no more sunny)
		#~ # countdown till sunrise ⭱🌅:
		#~ date -u -d @$(($(date -d "`sunwait list 1 rise 	angle $SUN_ANGLE $COORDINATES`" '+%s') - $(date -d "now" '+%s'))) '+⇧%-Hh%M'
		#~ echo "🔅`sunwait list 1 set angle $SUN_ANGLE $COORDINATES`"
	#~ fi
#~ fi



if [[ `sunwait poll angle civil $COORDINATES` == "DAY" ]]
then # DAY:
	# countdown till alcom sunset ⭳🌇:
	date -u -d @$(($(date -d "`sunwait list 1 set 	angle $SUN_ANGLE $COORDINATES`" '+%s') - $(date -d "now" '+%s'))) '+⇩%-Hh%M'
	
	echo "🔅`sunwait list 1 set angle $SUN_ANGLE $COORDINATES`"

	# countdown till civil sunset ⭳🌇:
	date -u -d @$(($(date -d "`sunwait list 1 set civil $COORDINATES`" '+%s') - $(date -d "now" '+%s'))) '+⇩%-Hh%M'
	
	echo "🌇`sunwait list 1 set civil $COORDINATES`"
	
# after sunset:
else # alcom sunset (no more sunny)
	# countdown till sunrise ⭱🌅:
	date -u -d @$(($(date -d "`sunwait list 1 rise 	angle $SUN_ANGLE $COORDINATES`" '+%s') - $(date -d "now" '+%s'))) '+⇧%-Hh%M'
	
	echo "🔅`sunwait list 1 set angle $SUN_ANGLE $COORDINATES`"
	
	# sunrise at:
	echo "🌅`sunwait list 1 rise angle -3.33 $COORDINATES`"


fi


# sunset:




#~ # midday:
#~ echo "🔅`sunwait report 1 			 $COORDINATES | grep 'Sun directly north/south' | sed 's/   Sun directly north\/south: //' | sed 's/ //'`"

#~ # day length:
#~ echo "⏳`sunwait report 1 			 $COORDINATES | grep Duration | sed 's/ Duration ...    Day length: //' | sed 's/ hours//' | sed 's/:/h/'`"

#~ # civil sunset:
#~ echo "🕮`sunwait list 1 set civil $COORDINATES`"


# 5h from sunset:
#echo "☭`sunwait list 1 set angle $SUN_ANGLE  offset 5:0:0 $COORDINATES`"




# switch between different content:
# example:
#   I set my panel applet to run this script every 3sec
#~ if [ "$(( `date '+%S'` % 2 ))" -eq 0 ] #A:
#~ then

	#~ # sunrise:
	# echo "🌅`sunwait list 1 rise angle $SUN_ANGLE $COORDINATES`"
	#~ echo "🌅`sunwait list 1 rise angle -3.33 $COORDINATES`"

	#~ if [[ `sunwait poll angle $SUN_ANGLE $COORDINATES` == "DAY" ]]
	#~ then # DAY:
		#~ # countdown till sunset ⭳🌇:
		#~ date -u -d @$(($(date -d "`sunwait list 1 set 	angle $SUN_ANGLE $COORDINATES`" '+%s') - $(date -d "now" '+%s'))) '+⇩%-Hh%M'
	#~ else # NIGHT:
		#~ # countdown till sunrise ⭱🌅:
		#~ date -u -d @$(($(date -d "`sunwait list 1 rise 	angle $SUN_ANGLE $COORDINATES`" '+%s') - $(date -d "now" '+%s'))) '+⇧%-Hh%M'
	#~ fi

	#~ # sunset:
	#~ echo "🌇`sunwait list 1 set angle $SUN_ANGLE $COORDINATES`"
#~ else # B:


	#~ # midday:
	#~ echo "🔅`sunwait report 1 			 $COORDINATES | grep 'Sun directly north/south' | sed 's/   Sun directly north\/south: //' | sed 's/ //'`"
	
	#~ # day length:
	#~ echo "⏳`sunwait report 1 			 $COORDINATES | grep Duration | sed 's/ Duration ...    Day length: //' | sed 's/ hours//' | sed 's/:/h/'`"

	#~ # civil sunset:
	#~ echo "🕮`sunwait list 1 set civil $COORDINATES`"
	

	#~ # 5h from sunset:
	#~ #echo "☭`sunwait list 1 set angle $SUN_ANGLE  offset 5:0:0 $COORDINATES`"
#~ fi

# day length civil:
	echo "⏳`sunwait report 1 $COORDINATES | grep Duration | sed 's/ Duration ...    Day length: //' | sed 's/ hours//' | sed 's/:/h/'`"


