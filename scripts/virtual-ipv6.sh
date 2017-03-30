#!/bin/bash

DIRETORIO=/etc/apache2/sites-available/

cd $DIRETORIO

for f in *;
do 
 sed -i '1 c <VirtualHost [2801:80:240:8200::5e31:91]:80 200.239.64.91:80>' $f
done
