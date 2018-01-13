#!/bin/bash

export wrfversion=3.9.1
cd $WRF
wget http://www2.mmm.ucar.edu/wrf/src/WPSV$wrfversion.TAR.gz
tar -vzxf WPSV$wrfversion.TAR.gz
cd WPS
#./clean -a
./configure # include "-lgomp" at end of WRF_LIB variable before compile!
#./compile >& compile.log &
