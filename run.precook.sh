#!/bin/bash

######################################
#
#	Executes precook for all days in days.$RUN.lst for the selected model and experiment (and run)
#
######################################


mdl=CNRM-CM5
exp=historical

for date in `cat days.$mdl.lst`;do

	./precook.$mdl.sh $exp $date

done
