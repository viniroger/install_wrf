#!/bin/bash

export jasper=1.900.1
export zlib=1.2.11
export libpng=1.6.16
export hdf5=1.10.1
export netcdf_c=4.3.3
export netcdf_f=4.4.2
export mpich=3.1.4

#JasPer
inst_jasper(){
	cd $DOWNLOADS
	wget http://www.ece.uvic.ca/~frodo/jasper/software/jasper-$jasper.zip
	unzip jasper-$jasper.zip
	cd jasper-$jasper
	./configure --prefix=$JASPER
	make
	make install
}

# zlib
inst_zlib(){
	cd $DOWNLOADS
	wget http://zlib.net/zlib-$zlib.tar.gz
	tar -vzxf zlib-$zlib.tar.gz
	cd zlib-$zlib
	./configure --prefix=$ZLIB
	make
	make install
}

#libpng
inst_libpng(){
	cd $DOWNLOADS
	wget http://download.sourceforge.net/libpng/libpng-$libpng.tar.gz
	tar -vzxf libpng-$libpng.tar.gz
	cd libpng-$libpng
	./configure --prefix=$LIBPNG LDFLAGS="-L$ZLIB/lib" CPPFLAGS="-I$ZLIB/include"
	make
	make install
}

#hdf5
inst_hdf5(){
	cd $DOWNLOADS
	wget http://www.hdfgroup.org/ftp/HDF5/current/src/hdf5-$hdf5.tar.gz
	tar -vzxf hdf5-$hdf5.tar.gz
	cd hdf5-$hdf5
	./configure --prefix=$HDF5 --enable-fortran --enable-cxx --with-szlib=$ZLIB
	make
	make install
}

#NetCDF-C
inst_netcdfc(){
	cd $DOWNLOADS
	wget ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-$netcdf_c.tar.gz
	tar -vzxf netcdf-$netcdf_c.tar.gz
	cd netcdf-$netcdf_c
	./configure --prefix=$NETCDF           \
	  LDFLAGS="-L$ZLIB/lib -L$HDF5/lib"    \
	  CPPFLAGS="-I$ZLIB/include -I$HDF5/include"
	make
	make install
}

#Interface NetCDF-fortran
inst_netcdff(){
	cd $DOWNLOADS
	wget ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-fortran-$netcdf_f.tar.gz
	tar -vzxf netcdf-fortran-$netcdf_f.tar.gz
	cd netcdf-fortran-$netcdf_f
	./configure --prefix=$NETCDF      \
	  LDFLAGS="-L$ZLIB/lib -L$HDF5/lib -L$NETCDF/lib" \
	  CPPFLAGS="-I$ZLIB/include -I$HDF5/include -I$NETCDF/include"
	make
	make install
}

#mpich
inst_mpich(){
	cd $DOWNLOADS
	wget http://www.mpich.org/static/downloads/$mpich/mpich-$mpich.tar.gz
	tar -vzxf mpich-$mpich.tar.gz
	cd mpich-$mpich
	./configure --prefix=$MPICH
	make
	make install
}

inst_jasper
#inst_zlib
#inst_libpng
#inst_hdf5
#inst_netcdfc
#inst_netcdff
#inst_mpich
