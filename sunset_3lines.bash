#!/bin/bash
# hg 	= 59.066926N 24.849028E
# saue	= 59.319424N 24.553180E

COORDINATES='59.319424N 24.553180E' # decimal longitude + decimal latitude: examples:
	#	'12.12345N 56.78954E' 
	#	'-12.12345N -56.78954E' 
	#	'12.12345S 56.78954W' 
SUN_ANGLE=0.53 # sun angle above/below the horizon. examples: 
	#	  0.5 	sun is visible			Suns lower edge is touching the horizon (the Sun is 0.53ยฐ high in our sky)
	#	  0		twilighty				Suns upper edge is just above the horizon
	#	 -6		civil twilight			Suns lower edge is 6ยฐ below the horizon. 
	#	-12		nautical twilight		Suns lower edge is 12ยฐ below the horizon. 
	#	-18		astronomical twilight	Suns lower edge is 18ยฐ below the horizon. 
	# see: https://en.wikipedia.org/wiki/Dusk#Technical_definitions
	# see: https://upload.wikimedia.org/wikipedia/commons/d/d2/Twilight_subcategories.svg

#############################################################
# ๐ โคโญฑ ๐๐  โผ




# sunrise:
#~ echo "๐`sunwait list 1 rise angle $SUN_ANGLE $COORDINATES`"
echo "๐`sunwait list 1 rise angle -3.33 $COORDINATES`"

if [[ `sunwait poll angle $SUN_ANGLE $COORDINATES` == "DAY" ]]
then # DAY:
	# countdown till sunset โญณ๐:
	date -u -d @$(($(date -d "`sunwait list 1 set 	angle $SUN_ANGLE $COORDINATES`" '+%s') - $(date -d "now" '+%s'))) '+โฉ%-Hh%M'
else # NIGHT:
	# countdown till sunrise โญฑ๐:
	date -u -d @$(($(date -d "`sunwait list 1 rise 	angle $SUN_ANGLE $COORDINATES`" '+%s') - $(date -d "now" '+%s'))) '+โง%-Hh%M'
fi

# sunset:
echo "๐`sunwait list 1 set angle $SUN_ANGLE $COORDINATES`"


#~ # midday:
#~ echo "๐`sunwait report 1 			 $COORDINATES | grep 'Sun directly north/south' | sed 's/   Sun directly north\/south: //' | sed 's/ //'`"

#~ # day length:
#~ echo "โณ`sunwait report 1 			 $COORDINATES | grep Duration | sed 's/ Duration ...    Day length: //' | sed 's/ hours//' | sed 's/:/h/'`"

#~ # civil sunset:
#~ echo "๐ฎ`sunwait list 1 set civil $COORDINATES`"


# 5h from sunset:
#echo "โญ`sunwait list 1 set angle $SUN_ANGLE  offset 5:0:0 $COORDINATES`"



