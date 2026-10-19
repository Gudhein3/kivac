#!/bin/sh
set -xe
./kiva kiva.k kivac.new
./kivac.new kiva.k kivac.new.new.ir
cmp kivac.new.ir kivac.new.new.ir || echo Well, the new compiler must be producing different code # If the new compiler produces the same output as the old one does, under the assumption the old one is correct, the new one must be correct too.
