#!/bin/bash

cd $WRF
wget http://www2.mmm.ucar.edu/wrf/src/ARWpost_V3.tar.gz
tar -vzxf ARWpost_V3.tar.gz
cd ARWpost
#./clean -a
./configure # include "-lnetcdff" at end of "ARWpost.exe" on "src/Makefile"
# include "-cpp" at end of "FC = gfortran" on "configure.arwp"
#./compile >& compile.log &
