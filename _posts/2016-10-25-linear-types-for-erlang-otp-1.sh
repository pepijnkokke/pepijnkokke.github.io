#!/bin/bash

TEMPFILE=`mktemp -u -t code.XXXXXX`

# Build `unlit` script
cd unlit/
stack build

# Strip literate text from Erlang OTP post
cat ../*-linear-types-for-erlang-otp.lagda \
    | stack exec unlit > $TEMPFILE

# Typecheck the resulting code
cpi $TEMPFILE
