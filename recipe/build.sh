#!/bin/bash

export LDFLAGS="-L$PREFIX/lib $LDFLAGS"
export CPPFLAGS="-I$PREFIX/include $CPPFLAGS"

autoreconf --force --install

bash configure --prefix=$PREFIX \
               --with-xml2=$PREFIX \
               --with-curl=$PREFIX \
               --enable-threads=pth

make
# Check fails on OS X for some reason.
# if [ $(uname) == Linux ]; then
#   make check
# fi
make install
