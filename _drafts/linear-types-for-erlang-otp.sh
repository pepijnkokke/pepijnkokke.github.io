#!/bin/bash

TEMPFILE=`mktemp -u -t code.XXXXXX`

cat linear-types-for-erlang-otp.lagda \
    | stack exec unlit                \
    > $TEMPFILE

cpi $TEMPFILE
