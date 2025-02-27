#!/bin/bash

read -p "Ingresa la ruta: " ruta
echo ''
echo '***********************************************************************'
read -p " Se lecciona que quieres hacer con la ruta que haz ingresado
        a) Comprobar si es un directorio
        b) Crear el directorio
        c) Listar su contenido
      
    Respuesta: " opcion
echo '***********************************************************************'

case ${opcion} in 
    a)
     if [[ -d ${ruta} ]];then
        echo "La ruta (${ruta}) existe"
     else
        echo "La ruta (${ruta}) no existe"
     fi
    ;;
    b)
      if [[ -d $ruta ]]; then 
        echo "La ruta (${ruta}) ya existe"
      else
        mkdir $ruta
        if [[ $? -eq 0 ]]; then
          echo "La ruta (${ruta}) se ha creado con exito !!!"
        else
          echo "Algo a salido mal al crear la ruta: ${ruta}"
        fi
      fi
    ;;
    c)
      if [[ -d ${ruta} ]]; then
        ls ${ruta}
      else
        echo "No se puede lisar el contenido de \"${ruta}\" porque no existe :("
      fi
    ;;
    *)
    echo "opcion invalida."
    ;;
esac