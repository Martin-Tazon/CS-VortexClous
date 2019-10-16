#!/bin/bash

#####################
#
#	This script builds list of days to be used in a given run.
#		Selects days as (c4 Convention) 1 day simulation (+0.5 spin up) every 24 days.
#
#####################

mdl=CNRM-CM5
exp=rcp85

run=acciona-mx.v3

if [ $exp == historical ];then
	syear=1981
	period=25
else
	syear=2026
	period=20
fi

sdate=$syear-01-02
edate=`date +%Y-%m-%d -d "$sdate $period year -2 day"` 
ydate=$sdate

echo Inicio: $sdate
echo Fin:    $edate

i="0" # Work count
while [ `echo $ydate | sed 's/-//g'` -lt `echo $edate | sed 's/-//g'` ];do 
xdate=`date +%Y-%m-%d -d "$sdate $((24*$i)) day"`		# Seleccionem dies cada 24 dies
ydate=`date +%Y-%m-%d -d "$xdate 2 day"`				# Agafem el dia mes un de spinoff
if [ `echo $ydate | sed 's/-//g'` -ge `echo $edate | sed 's/-//g'` ];then exit;fi

echo $xdate "--->" $ydate
# Run a script from here

echo $xdate >> days.$run.lst



# Until here
i=$[$i+1]
done


