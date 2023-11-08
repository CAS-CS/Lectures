#!/bin/sh

# npm init -y
# npm i --save-dev parcel
# "dev":"parcel ./index.html",
# "build":"parcel build ./index.html"
NIXPKGS_ALLOW_UNFREE=1

nix-shell --sandbox --pure -p vscodium --run "codium . "
