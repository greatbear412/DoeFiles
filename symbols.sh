#!/bin/bash

function setSymbolLinks(){
    #set copy back
    mv ~/"$1" ~/"$1.bak"
    #echo $new
    ln -s "$2/$1" ~/"$1"
}

function travFolder(){ 
    flist=$(ls -a "$1")
    cd "$1" || exit
    for f in $flist
    do
        if test -f "$f"
        then
        setSymbolLinks "$f" "$1"
        fi
    done
    cd ../ 
}

travFolder "$(pwd)/rc"
echo "Done"
