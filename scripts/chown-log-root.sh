#!/bin/bash

DIRETORIO=/var/www

cd $DIRETORIO
for f in *;
do
 chown -R root: $f/logs;
 chmod 600 $f/logs/*
done  
