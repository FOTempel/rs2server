#!/bin/bash

./steamcmd.sh +runscript ~/rs2server.txt
cd /RS2/server
wine ./Binaries/Win64/VNGame.exe VNSK-Firebase
