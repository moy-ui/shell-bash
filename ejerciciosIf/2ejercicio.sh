#!/bin/bash 

read -p "Ingresa un numero: " n1
read -p "Ingresa un segundo numero: " n2

rand=$RANDOM

regx="^[0-9]+\.[0-9]+$ | ^[0-9]+$"

if [[ ! $n1 =~ $regx ]]; then
   echo $n1 no es un valor numerico intente... vuelva a ejecutar el scritp 
   exit 1
fi

if [[ ! $n2 =~ $regx ]]; then
   echo $n2 no es un valor numerico intente... vuelva a ejecutar el scritp  
   exit 1
fi

reciduo1=$(($n1%$rand))
reciduo2=$(($n2%$rand))

if [[ ${reciduo1} -eq 0 ]]; then
   echo el numero ${rand} es divisible entre $n1
else
   echo el numero ${rand} no es divisible entre $n1
fi

if [[ ${reciduo2} -eq 0 ]]; then 
   echo el numero ${rand} es divisible entre $n2
else
   echo el numero ${rand} no es divisible entre $n2   
fi

