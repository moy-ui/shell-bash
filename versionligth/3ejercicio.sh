#!/bin/bash 

read -p "Ingresa el anio en que naciste: " anioNa

anioActual=`date +%Y`
#separamos la fecha
if [[ ! ${anioNa} =~ ^[0-9]{4}$ ]]; then
   echo se ha informado mal la fecha
   echo "use el siguiente formato (AAAA) - (1987)"
   exit 1
fi

if [[ ${anioNa} -le ${anioActual} ]]; then
    edad=$((${anioActual}-${anioNa}))
    case ${edad} in 
        0)
        echo 'Ha nacido este mismo anio !!'
        ;;
        1)
        echo "Tiene ${edad} anio !!"
        ;;
        *)
        echo "Tiene ${edad} anios !!"
        ;;
    esac
else
    echo "El anio que ha ingresado ( ${anioNa} ) no puede ser mayor a ( ${anioActual} )"
fi