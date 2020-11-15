#!/bin/bash
#
# TinyURL: (15/11/2020)
#
# Variables y Colores
#
PWD=$(pwd)
verde='\033[32m'
azul='\033[34m'
rosa='\033[38;5;207m'
amarillo='\033[33m'
morado='\033[35m'
cian='\033[1;36m'
magenta='\033[1;35m'
negro='\033[0;30m'
blanco='\033[37m'
rojo='\033[31m'
#
# Banner TinyURL
#
function TinyURL {
	sleep 0.5
	clear
echo -e "${verde}
████████╗██╗███╗   ██╗██╗   ██╗██╗   ██╗██████╗ ██╗
╚══██╔══╝██║████╗  ██║╚██╗ ██╔╝██║   ██║██╔══██╗██║
   ██║   ██║██╔██╗ ██║ ╚████╔╝ ██║   ██║██████╔╝██║
   ██║   ██║██║╚██╗██║  ╚██╔╝  ██║   ██║██╔══██╗██║
   ██║   ██║██║ ╚████║   ██║   ╚██████╔╝██║  ██║███████╗
   ╚═╝   ╚═╝╚═╝  ╚═══╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚══════╝"${blanco}
}
#
# Solicitando URL al Usuario
#
function Input {
echo -e -n "${verde}
┌═══════════════════┐
█ ${blanco}INGRESE UN ENLACE ${verde}█
└═══════════════════┘
┃
└═>>> "${blanco}
read -r Enlace
sleep 0.5
}
#
# Acortando URL Utilizando TinyURL
#
function ShortURL {
echo -e "${verde}
┌═════════════════════┐
█ ${blanco}ACORTANDO ENLACE... ${verde}█
└═════════════════════┘"${blanco}
TinyURL=$(curl -s http://tinyurl.com/api-create.php?url=${Enlace})
sleep 3
echo -e "${verde}
┌════════════════┐
█ ${blanco}ENLACE TINYURL ${verde}█
└════════════════┘
┃
└═>>>${blanco} ${TinyURL}"
sleep 1
}
#
# Guardando Datos del Enlace en un Archivo
#
function Save {
echo -e "${Enlace}  =>  ${TinyURL}" >> url.txt
echo -e "${verde}
┌═══════════════════════════════┐
█ ${blanco}DATOS GUARDADOS EN EL ARCHIVO ${verde}█
└═══════════════════════════════┘
┃
└═>>>${blanco} url.txt
"
sleep 1
cat url.txt
sleep 1
}
#
# Reiniciando el Programa
#
function Restart {
echo -e -n "${verde}
┌═════════════════════════════┐
█ ${blanco}¿DESEA ACORTAR OTRO ENLACE? ${verde}█
└═════════════════════════════┘
┃    ┌═══════════════════┐
└═>>>█ [${blanco}01${verde}] ┃ ${blanco}SI ACORTAR ${verde}█
┃    └═══════════════════┘
┃    ┌═══════════════════┐
└═>>>█ [${blanco}02${verde}] ┃ ${blanco}NO ACORTAR ${verde}█
┃    └═══════════════════┘
┃
└═>>> "${blanco}
read -r Acortar

if [[ "${Acortar}" == "1" || "${Acortar}" == "01" ]]; then
source ${PWD}/tinyurl.sh
elif [[ "${Acortar}" == "2" || "${Acortar}" == "02" ]]; then
exit
else
echo -e "${rojo}
┌═════════════════════┐
█ ${blanco}¡OPCIÓN INCORRECTA! ${rojo}█
└═════════════════════┘
"${blanco}
sleep 1
clear
Restart
fi
}
#
# Declarando Funciones
#
TinyURL
Input
ShortURL
Save
Restart
#
# Creado por: Darkmux
#
# Informatic in Termux ©
