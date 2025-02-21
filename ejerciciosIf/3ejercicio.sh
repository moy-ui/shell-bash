#!/bin/bash 

read -p "Ingresa tu fecha de nacimiento (DDMMAAAA): " fechaNa

diaActual=`date +%d`
mesActual=`date +%m`
anioActual=`date +%Y`
#separamos la fecha
if [[ ! ${fechaNa} =~ ^([0-9]{2}){2}[0-9]{4}$ ]]; then
   echo se ha informado mal la fecha
   echo "use el siguiente formato (DDMMAAAA) - (15011987)"
   exit 1
fi

diaIn=${fechaNa:0:2}
mesIn=${fechaNa:2:2}
anioIn=${fechaNa:4:4}
echo ******${diaActual}/${mesActual}/${anioActual}******
echo 
echo
case ${mesIn} in
  01 | 03 | 05 | 07 | 10 | 12)
    if [[ ${diaIn} > 31  ]]; then 
       echo "El dia: ${diaIn} es incorrecto para el mes ${mesIn}."
       exit 1
    fi 
    diasMes=31
   ;;
   02)
     if [[ ${diaIn} > 28  ]]; then 
       echo "El dia: ${diaIn} es incorrecto para el mes ${mesIn}."
       exit 1
     fi 
     diasMes=28 
   ;;
   04 | 06 | 08 | 09 | 11)
        if [[ ${diaIn} > 30  ]]; then 
       echo "El dia: ${diaIn} es incorrecto para el mes ${mesIn}."
       exit 1
    fi 
    diasMes=30
   ;;
esac

if [[ ${anioIn} -lt ${anioActual} ]]; then
   anioResultado=$((${anioActual}-${anioIn}))
else
   anioResultado=$((${anioIn}-${anioActual}))
   if [[ ${anioResultado} -eq 0 ]]; then
      if [[ ${mesIn} -le ${mesActual} ]]; then
         mesResultado=$((${mesActual}-${mesIn}))
         if [[ ${mesResultado} -eq 0 ]]; then
            if [[ ${diaIn} -le ${diaActual} ]]; then 
               diasResultado=$((${diaActual}-${diaIn}))
               echo Usted tiene ${diasResultado} dias de haber nacido 
            else
               echo el dia no puede ser mayor ${diaActual}, dia actual
            fi
         else
#el mes es anterior - logica para calcular meses y dias
            diasMesToFinMes=$((${diasMes}-${diaIn}))
            echo dias mes ${diasMes}
            if [[ $mesResultado -gt 1 ]]; then
               echo mas de un mes  
            else
               totalDias=$((${diasMesToFinMes}+${diaActual}))
               echo ${diasMesToFinMes}
               echo Usted tiene $totalDias de haber nacido.
            fi 
      	 fi
      else
         echo el mes no puede ser mayor al mes ${mesActual}
      fi
   else
      echo el anio esta mal informado. 
   fi
fi
