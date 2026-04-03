#!/usr/bin/env bash

# Autor: PFPE20
#
# Script para buscar comando en index.txt

separator="^-{3,}"
notes_file="/home/HellHound/myscripts/index.txt"


function search_pkg() {
	
	local lines_up=0
	local lines_down=0
	local term="\"$1\""

	if ! grep -qi "$term" $notes_file ; then
		echo -e "\n\t\e[1;31m[x]\e[0m  No se encontró \"\e[3;36m$1\e[0m\" en el índice\n"
		return 1
	fi


	while true; do
		(( lines_up++ ))
		block=$(grep -B "$lines_up" -i "$term" "$notes_file")
		if echo "$block" | head -n 1 | grep -qP "$separator"; then
			break
		fi
	done

	while true; do
		(( lines_down++ ))
		block=$(grep -A "$lines_down" -i "$term" "$notes_file")
		if echo "$block" | tail -n 1 | grep -qP "$separator"; then
			break
		fi
	done

	block=$(grep --color=always -B "$lines_up" -A "$lines_down" -i "$term" "$notes_file")

	echo "$block"

}

function search_cmd() {

	local lines_up=0
	local lines_down=0

	while true; do
		(( lines_up++ ))
		block=$(grep -B "$lines_up" -i "$1" "$notes_file")
		if echo "$block" | head -n 1 | grep -qP "$separator"; then
			break
		fi
	done

	while true; do
		(( lines_down++ ))
		block=$(grep -A "$lines_down" -i "$1" "$notes_file")
		if echo "$block" | tail -n 1 | grep -qP "$separator"; then
			break
		fi
	done

	block=$(grep --color=never -B "$lines_up" -A "$lines_down" -i "$1" "$notes_file")

	echo "$block" | less

}

function usage() {
	
	echo -e "\n\tUso:"
	echo -e "\n\t\t\e[1;34msearchcommands\e[0m \e[1;37m-c\e[0m \e[3m<command>\e[0m → Encuentra las apariciones en el documento"
	echo -e "\n\t\t\e[1;34msearchcommands\e[0m \e[1;37m-k\e[0m \e[3m<command>\e[0m → Busca un comando por su título\n"

	return 1

}

if [[ -z "$1" ]]; then
	usage; exit 1
fi



while getopts ":c:k:" opt; do
	case $opt in
		k) 
			if ! grep -qi "$OPTARG" "$notes_file"; then
				echo -e "\n\t\e[1;31m[x]\e[0m  No se encontró \"\e[3;36m$1\e[0m\" en el índice\n"
				exit 1
			fi

			search_pkg $OPTARG; exit 0;;
		c) 
			if ! grep -qi "$OPTARG" "$notes_file"; then
				echo -e "\n\t\e[1;31m[x]\e[0m  No se encontró \"\e[3;36m$1\e[0m\" en el índice\n"
				exit 1
			fi
			search_cmd $OPTARG; exit 0;;
		?) usage; exit 0;;
	esac
done



