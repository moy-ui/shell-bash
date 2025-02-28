#!/bin/bash
#programa que determina si el parametro de entrada es una ruta-fichero-noExiste

if [[ $# -gt 0 ]];then
    if [[ -d $1 ]];then
        echo "Es una ruta !!!"
        exit 0
    fi
    if [[ -f $1 ]];then 
        echo "Es un fichero !!"
        exit 0
    fi
    if [ ! -d $1 ] && [ ! -f $1 ] ;then
        echo "no es una ruta y no es un fichero :( "
    fi 
else
    echo 'No ha ingresado ningun parametro :( '
    exit -1
fi
