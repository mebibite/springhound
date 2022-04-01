#!/bin/bash

echo "
                     .__               .__                             .___
  ___________________|__| ____    ____ |  |__   ____  __ __  ____    __| _/
 /  ___/\____ \_  __ \  |/    \  / ___\|  |  \ /  _ \|  |  \/    \  / __ | 
 \___ \ |  |_> >  | \/  |   |  \/ /_/  >   Y  (  <_> )  |  /   |  \/ /_/ | 
/____  >|   __/|__|  |__|___|  /\___  /|___|  /\____/|____/|___|  /\____ | 
     \/ |__|                 \//_____/      \/                  \/      \/ 
		   
v1.00                           Tomas Beaujean <https://linktr.ee/mebibite>


Usage: ./springhound.sh root_directory



Unpacking and analyzing JAR files...

"

for jarfile in $(find $1 -iname '*.jar')
do	
	jarfilescan=$(unzip -p $jarfile META-INF/MANIFEST.MF | grep springframework)
	if [ -n "$jarfilescan" ]; then
		echo "File: $jarfile
"
		jarfilecontents=$(unzip -p $jarfile META-INF/MANIFEST.MF)
		echo "${jarfilecontents}

---------------

"
	fi
done
