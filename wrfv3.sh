#!/bin/bash

export wrfversion=3.9.1
cd $WRF
wget http://www2.mmm.ucar.edu/wrf/src/WRFV$wrfversion.TAR.gz
tar -vzxf WRFV$wrfversion.TAR.gz
cd WRFV3
#./clean -a
./configure
./compile em_real >& compile.log &
