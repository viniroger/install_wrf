#!/bin/bash
# Scripts para verificar os links

export jasper=1.900.1
export zlib=1.2.11
export libpng=1.6.16
export hdf5=1.10.1
export netcdf_c=4.3.3
export netcdf_f=4.4.2
export mpich=3.1.4

get_status(){
	wget -q --spider $data_link
	status=`echo $?`
	echo "Status de" $data_link ":" $status
}

echo "Verificando status dos links (0 - OK)"

data_link=http://www.ece.uvic.ca/~frodo/jasper/software/jasper-$jasper.zip
get_status
data_link=http://zlib.net/zlib-$zlib.tar.gz
get_status
data_link=http://download.sourceforge.net/libpng/libpng-$libpng.tar.gz
get_status
data_link=http://www.hdfgroup.org/ftp/HDF5/current/src/hdf5-$hdf5.tar.gz
get_status
data_link=ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-$netcdf_c.tar.gz
get_status
data_link=ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-fortran-$netcdf_f.tar.gz
get_status
data_link=http://www.mpich.org/static/downloads/$mpich/mpich-$mpich.tar.gz
get_status
