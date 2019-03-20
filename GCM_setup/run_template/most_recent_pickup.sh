#!/bin/bash

pmeta=$( ls -t pickup.*.meta |head -1)
plabel=$(echo $pmeta | sed 's/pickup.\(.*\).meta/\1/' )

sed -i.bak -n -e '/pickupSuff/I!p' data

echo ${plabel:0:1}
if [ ${plabel:0:1} == 'c' ]
then
        iter=$( grep timeStepNumber $pmeta | sed -r 's/.*\[\(.*\)\];/\1/')
        extra="\n pickupSuff='$plabel',"
else
        iter=$plabel
fi

#if [[ $plabel -eq 0000000144 ]]
#then 
#       echo "blah"
#fi

#iter=$plabel

sed -i.bak -e "s/nIter0=\(.*\)/nIter0=$iter,$extra/I" data

echo "Updated data: pickup $iter ($plabel)"
