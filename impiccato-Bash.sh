#!/bin/bash

#DIZIONARO

dizionario_ita=( "Bacino" "Ciao" "Papera" "sigarette" "amnesia" "suola" "sauna" "vipera" "treccia" "sforzo" "registrazione" "carcere" "verticale" "militare" "molti" "dita" "preoccuparsi" "collina" "respirare" "copilota" "musicista" "pedale" "libro" "piscina" "molla" "strada" "giovane" "orologio" "fama" "collana" "cuscino" "sabbia" "autobus" "indicazioni" "paletta" "nipote" "motel" "hotel" "intercettare" "buco" "telefono" "casse" "tastiera" "tavolo" "manipolazione" "guai" "fontana" "prato" "aspirapolvere" "binocolo" "pazzo" "vista" "fuoco" "casco" "stop" "venezia" "sughero" "tappeto" "provetta" "tagliare" "ananas" "canile" "mosaico" "regole" "Monologo" "Batteria" "Valuta" "Gomma" "Tovaglia" "Hawaiano" "Insetto" "Versare" "Slacciare" "Esecuzione" "Architetto" "Francobollo" "Tricheco" "Invitare" "Spray" "Brutto" "Dolore" "Spiedo" "Duplicare" "Forgiare" "Laser" "Randagi" "Stadio" "Iniettare" "Stretto" "Faccia" "Vapore" "Continente" "Codice" "Frittura" "Venere" "Piume" "Massa" "Nuovo" "Cartuccia" "Minigonna" "Tavoletta" "Natica" "odore" )

function banner_Ale {
    echo	"           _       ______   _____  _____           _   _  _____   _____    ____  "
    echo	"    /\    | |     |  ____| / ____|/ ____|   /\    | \ | ||  __ \ |  __ \  / __ \ "
    echo	"   /  \   | |     | |__   | (___ | (___    /  \   |  \| || |  | || |__) || |  | |"
    echo	"  / /\ \  | |     |  __|   \___ \ \___ \  / /\ \  | . \` || |  | ||  _  / | |  | |"
    echo	" / ____ \ | |____ | |____  ____) |____) |/ ____ \ | |\  || |__| || | \ \ | |__| |"
    echo	"/_/    \_\|______||______||_____/|_____//_/    \_\|_| \_||_____/ |_|  \_\ \____/ "
                                                                                 
}


function omino_vuoto {
	echo "				  +---+  "
	echo "				  |   |  "
	echo "				      |  "
	echo "				      |  "
	echo "				      |  "
	echo "				      |  "
	echo "				========="
}

function omino_testa {
	echo "				  +---+  "
	echo "				  |   |  "
	echo "				  0   |  "
	echo "				      |  "
	echo "				      |  "
	echo "				      |  "
	echo "				========="
}

function omino_corpo {
	echo "				  +---+  "
	echo "				  |   |  "
	echo "				  0   |  "
	echo "				  |   |  "
	echo "				      |  "
	echo "				      |  "
	echo "				========="
}

function omino_1braccio {
	echo "                            +---+  "
	echo "                            |   |  "
	echo "                            0   |  "
	echo "                           /|   |  "
	echo "                                |  "
	echo "                                |  "
	echo "                          ========="
}

function omino_2braccio {
	echo "  			  +---+  "
	echo "  			  |   |  "
	echo "  			  0   |  "
	echo "  			 /|\  |  "
	echo "  			      |  "
	echo "  			      |  "
	echo "  			========="
}

function omino_1gamba {
	echo "				  +---+  "
	echo "				  |   |  "
	echo "				  0   |  "
	echo "				 /|\  |  "
	echo "				 /    |  "
	echo "				      |  "
	echo "				========="
}

function omino_2gamba {
	echo " 				  +---+  "
	echo " 				  |   |  "
	echo " 				  0   |  "
	echo " 				 /|\  |  "
	echo " 				 / \  |  "
	echo " 				      |  "
	echo " 				========="
}

#BANNER GIOCO

function banner_gioco {
echo ""
echo '  __     ___      ___    _______   __     ______    ______        __  ___________  ______   '
sleep 0.1
echo ' |" \   |"  \    /"  |  |   __ "\ |" \   /" _  "\  /" _  "\      /""\("     _   ")/    " \  '  
sleep 0.1
echo ' ||  |   \   \  //   |  (. |__) :)||  | (: ( \___)(: ( \___)    /    \)__/  \\__/// ____  \ ' 
sleep 0.1
echo " |:  |   /\   \/.    |  |:  ____/ |:  |  \/ \      \/ \        /' /\  \  \ _ /  /  /    ) :)"
sleep 0.1
echo " |.  |  |: \.        |  (|  /     |.  |  //  \ _   //  \ _    //  __'  \ |.  | (: (____/ // " 
sleep 0.1
echo ' /\  |\ |.  \    /:  | /|__/ \    /\  |\(:   _) \ (:   _) \  /   /  \\  \\:  |  \        /  '
sleep 0.1
echo '(__\_|_)|___|\__/|___|(_______)  (__\_|_)\_______) \_______)(___/    \___)\__|   \"_____/   ' 
echo ""
}

#__________________________________________________________________________________________________

banner_gioco

omino_vuoto

echo ""
a=1
errori=0
while [[ "1" == "1" ]];
do
	array_errati=( "_" "_" "_" "_" "_" "_" )
	parole_sbagliate=()
	a=$((a-1))
	if [[ $a -lt 0 ]]; then
		banner_gioco
		omino_vuoto
		echo

	fi
	echo
	echo " '1' per giocare			 NON PERDERE, FIDATI"
	echo " '2' per uscire "
	echo " '3' per i riconoscimenti"
	if [[ $errori != 0 ]]; then
		echo 
		echo " Errori: $errori"
	fi
	echo ""

	read scelta

	clear
	vittoria=0
	trattini=0
	parole_indovinate=()
	errori_tot=0
	errori_lettera=0
	errori_parole=0
	errori_posizione=0
	parole_sbagliate=()
	if [[ $scelta == 1 ]]; then
		gioco=1
		posizione_parola=$((RANDOM % 104))	#generatore casuale per scegliere la parola nel dizionario con l'indice
		
		parola=${dizionario_ita[$posizione_parola]}	
		parola_minuscola=${parola,,}	#trasforma parola in minuscolo
		prova=1
		array_parola=()

		for ((i=0; i<${#parola_minuscola}; i++)); 
		do
		
		    array_parola+=(${parola_minuscola:i:1})
		
		done

		for ((i=0;i<${#parola_minuscola};i++));
		do
			parole_indovinate[$i]+="_"
		done

		while [[ $gioco == 1 ]];
		do
			if [[ $errori_tot == 0 ]]; then
				omino_vuoto
				echo ""
			fi
			if [[ $errori_tot == 1 ]]; then
				omino_testa
				echo ""
			fi
			if [[ $errori_tot == 2 ]]; then
				omino_corpo
				echo ""
			fi
			if [[ $errori_tot == 3 ]]; then
				omino_1braccio
				echo ""
			fi
			if [[ $errori_tot == 4 ]]; then
				omino_2braccio
				echo ""
			fi
			if [[ $errori_tot == 5 ]]; then
				omino_1gamba
				echo ""
			fi
			if [[ $errori_tot == 6 ]]; then
				omino_2gamba
				echo ""
				gioco=0
				prova=0
			fi

			for (( i=0; i<${#parola_minuscola} ; i++ ));
			do
				if [[ ${parole_indovinate[$i]} == "_" ]]; then

					printf "_ "
					sleep 0.08
				else
					printf "%s " ${parole_indovinate[$i]}

					sleep 0.08
				
				fi
			done

			echo 
			echo

			echo "Lettere sbagliate:"
			echo 
			echo ${array_errati[*]}
			echo
			echo "Parole sbagliate:"
			echo 
			for word in "${parole_sbagliate[@]}";
			do
				echo " $word"
				echo
			done
			while [[ $prova == 1 ]];
			do
				trattini=0
				for ((i=0;i<${#parola_minuscola};i++));
					do
						if [[ ${parole_indovinate[$i]} == "_" ]]; then
							trattini=$((trattini+1))
						fi
					done
				
					if [[ $trattini == 0 ]]; then
						vittoria=1
						prova=0
						gioco=0
						break
					fi
				echo "1 per una lettera, 2 per una parola: "
				read seconda_selezione
				if [[ $seconda_selezione == 1 ]]; then

					echo "Prova con una lettera:"
					read lettera
					lettera_minuscola=${lettera,,}

					if [[ $lettera_minuscola != "a" &&  $lettera_minuscola != "b" && $lettera_minuscola != "c" && $lettera_minuscola != "d"  &&  $lettera_minuscola != "e"  &&  $lettera_minuscola != "f"  &&  $lettera_minuscola != "g"  &&  $lettera_minuscola != "h"  &&  $lettera_minuscola != "i"  &&  $lettera_minuscola != "j"  &&  $lettera_minuscola != "k"  &&  $lettera_minuscola != "l"  &&  $lettera_minuscola != "m"  &&  $lettera_minuscola != "n"  &&  $lettera_minuscola != "o"  &&  $lettera_minuscola != "p"  &&  $lettera_minuscola != "q"  &&  $lettera_minuscola != "r"  &&  $lettera_minuscola != "s"  &&  $lettera_minuscola != "t"  &&  $lettera_minuscola != "u"  &&  $lettera_minuscola != "v"  &&  $lettera_minuscola != "w"  &&  $lettera_minuscola != "x"  &&  $lettera_minuscola != "y"  &&  $lettera_minuscola != "z" ]]; then
						
						echo "INSERISCI UNA LETTERA!"
					
					else
						
						if [[ "$parola_minuscola" == *"$lettera_minuscola"* ]];then 
							
							echo "la lettera $lettera_minuscola nella parola"
							
							for ((i=0;i<${#parola_minuscola};i++));
							do
								if [[ ${array_parola[$i]} ==  $lettera_minuscola ]]; then
									
									parole_indovinate[$i]=$lettera_minuscola
									
								fi

							done
						else
							echo 
							echo "Ritenta"
							echo 
							if [[ "${array_errati[@]}" != *"$lettera_minuscola"* ]]; then
								errori_lettera=$((errori_lettera+1))
								errori_posizione=$((errori_posizione+1))
							else
								echo "Lettera giÃ  usata!"
								sleep 0.1
							fi

							for((i=$errori_posizione-1;i<$errori_posizione;i++));
							do
								if [[ $lettera_minuscola != "_" && "${array_errati[@]}" != *"$lettera_minuscola"* ]]; then

									array_errati[$i]=$lettera_minuscola
								
								fi
							done
						fi
	
						sleep 1
						clear
						break
						echo ""		#TO DO STAMPA MEGLIO
						
					fi

				fi

				if [[ $seconda_selezione == 2 ]]; then

					echo "Prova con una parola: "
					read prova_parola_maiuscola
					prova_parola=${prova_parola_maiuscola,,}
	
					if [[ "${parole_sbagliate[@]}" != *"$prova_parola"* ]]; then 

						if [[ $prova_parola == $parola_minuscola ]]; then

							vittoria=1
							gioco=0
							prova=0
							break
							clear
					 	
					 	else
					 	
					 		echo "Parola errata, ritenta"
					 		errori_parole=$((errori_parole+1))
					 		parole_sbagliate[$errori_parole]=$prova_parola
					 		clear
					 		break

					 	fi

					 else
				 	
					 	echo "parola giÃ  usata, ritenta"

				 	fi

				fi

			done
			errori_tot=$((errori_lettera+errori_parole))
		done
	fi

	echo 

	if [[ $vittoria == 1 ]]; then 					#controllo finale vittoria
		clear
		echo "Hai vinto" #TODO DA SCRIVERE MEGLIO
		sleep 2.2
		clear
	fi
	
	if [[ $errori_tot == 6 ]]; then
		echo "hai perso, la parola era $parola_minuscola"	#controllo sconfitta e stampa parola
		errori=$((errori+1))
		sleep 6
		echo
		clear
	fi

	#SECONDA SCELTA CON USCITA

	if [[ $scelta == 2 ]]; then

		echo '  ______    ______   ___      ___   _______      ___      ___  ____  ____    ______    __    '
		echo ' /" _  "\  /    " \ |"  \    /"  | /"     "|    |"  \    /"  |("  _||_ " |  /    " \  |" \   '
		sleep 0.1
		echo '(: ( \___)// ____  \ \   \  //   |(: ______)     \   \  //  / |   (  ) : | // ____  \ ||  |  ' 
		sleep 0.1
		echo ' \/ \    /  /    ) :)/\\  \/.    | \/    |        \\  \/. ./  (:  |  | . )/  /    ) :)|:  |  '
		sleep 0.1
		echo ' //  \ _(: (____/ //|: \.        | // ___)_        \.    //    \\ \__/ //(: (____/ // |.  |  '
		sleep 0.1
		echo '(:   _) \\        / |.  \    /:  |(:      "|        \\   /     /\\ __ //\ \        /  /\  |\ '
		sleep 0.1
		echo ' \_______)\"_____/  |___|\__/|___| \_______)         \__/     (__________) \"_____/  (__\_|_)'
		sleep 2
		exit
	fi

	     

	if [[ $scelta == 3 ]]; then 
		#DEVELOPER
		banner_Ale
		sleep 4
		clear
	fi

done
