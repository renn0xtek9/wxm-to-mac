#!/bin/bash
f="$1"	#the wxmaxima file
fname=`echo "$f" | sed 's%\..*%%' ` # the name without extansion
f2="$fname.mac" #the .mac name

header="/*******************************************************************************************
Converted from $f
using wxm-to-mac tool by renn0xtek9@laposte.net
*******************************************************************************************/"
echo "$header" >"$f2"
sed 's%/\*.*\*/%%g' $f | 
sed 's%.*\*/%\*/%g' | 
sed ':a;N;$!ba;s%/* [wxMaxima: [[:alnum:]]* start ]\n%%g'|
sed ':a;N;$!ba;s%\n\*/%\*/%g' |
sed '/^$/d' >> $f2
