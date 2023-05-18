#!/bin/sh
cd $1
shift
subwasm $* | tee SUBWASM.out
