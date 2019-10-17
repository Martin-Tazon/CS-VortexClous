#!/bin/bash

######################################
#
#	Executes precook for all days in days.$RUN.lst for the selected model and experiment (and run)
#
######################################

run=acciona-mx.v3
exp=historical

mdl=CNRM-CM5

for date in `cat days.$run.$exp.lst`;do

	./precook.$mdl.sh $exp $date

done
