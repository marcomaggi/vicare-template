# configure.sh --
#
# Run this to configure.

set -xe

prefix=/usr/local
if test -d /lib64
then libdir=${prefix}/lib64
else libdir=${prefix}/lib
fi

../configure \
    --enable-maintainer-mode                    \
    --config-cache                              \
    --cache-file=../config.cache                \
    --prefix="${prefix}"                        \
    --libdir="${libdir}"			\
    --enable-debug                              \
    --enable-time-tests				\
    --with-nausicaa				\
    CFLAGS='-O3'				\
    VFLAGS='-O3'				\
    "$@"

### end of file
