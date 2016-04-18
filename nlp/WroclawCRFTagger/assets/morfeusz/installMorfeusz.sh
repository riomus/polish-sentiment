#!/bin/bash


SCRIPT=`realpath -s $0`
SCRIPTPATH=`dirname $SCRIPT`

mv $SCRIPTPATH'/morfeusz-sgjp/libmorfeusz.so' '/usr/local/lib'
mv $SCRIPTPATH'/morfeusz-sgjp/libmorfeusz.so.0' '/usr/local/lib'
mv $SCRIPTPATH'/morfeusz-sgjp/libmorfeuszSGJP.so.0.7' '/usr/local/lib'

mv $SCRIPTPATH'/morfeusz-sgjp/morfeusz.h' '/usr/local/include'


ldconfig -n /usr/local/lib


