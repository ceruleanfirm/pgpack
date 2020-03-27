#!/bin/bash
# pgpack.sh
# files in dir, tar this dir, gpg the tarball

[[ $UID != 0 ]] && echo "Run me as root" && exit 11
[[ "$#" = 0 || "$1" = "--help" ]] && echo "Usage : $0 -c (enCrypt) | -d (Decrypt)  <file(s)>" && exit 1
 
[[ $LANG == "fr_FR.UTF-8" || \
$LANG == "fr_BE.UTF-8" || \
$LANG == "fr_CH.UTF-8" || \
$LANG == "fr_CA.UTF-8" ]] && LANGAGE=fr
case $LANGAGE in
	fr)
	IND="Veuillez indiquer le(s) fichier(s) à chiffrer en paramètre ..."
	USAGE="Usage : $0 -c (Chiffrer) | -d (Déchiffrer) fichier(s)"
	WHAT="Création d'une archive chiffrée"
	NAME="Veuillez indiquer son nom : " 
	DECR="Nom de l'archive à déchiffrer : " 
	;;
	*)
	IND="File(s) to encrypt in argument ..."
	USAGE="Usage : $0 -c (enCrypt) | -d (Decrypt)  <file(s)>"
	WHAT="Creation of an encrypted archive"
	NAME="Name of this archive : "
	DECR="Archive to decrypt : "
	;;
esac
[[ $# = 0 ]] && echo $USAGE
while getopts "cdh" opt ; do
	case $opt in
		case $opt in
	h) echo $USAGE && exit
	;;
	c)
	[[ $# < 2 ]] && echo $IND  && exit 2
	mkdir TARDIRECTORY 2>/dev/null
	while [[ $# > 1 ]] ; do
		mv $2 TARDIRECTORY 2>/dev/null
		shift
	done
	echo $WHAT
	while [[ $arc == "" ]] ; do
		read -p "$NAME" arc
	done
	tar czf $arc TARDIRECTORY
	gpg -c $arc
	if [[ $? != 0 ]] ; then
		tar xzf $arc
		rm $arc
		mv  TARDIRECTORY/* .
		rm -r TARDIRECTORY/
		exit 1
	fi
	cd TARDIRECTORY
	for i in * ; do
		shred -zun2 $i
	done 2>/dev/null
	cd ..  
	shred -zun2 $arc
	rm -rf $arc TARDIRECTORY
	readlink -f $arc.gpg
	file $arc.gpg
	;;
	d)
	[[ $# < 2 ]] && {
		while [[ $arc == "" ]] ; do
			read -p "$DECR" arc 
		done } || arc=$2
	gpg $arc
	if [ $? = 0 ] ; then
		nex=${arc%.*}   # sans le .gpg
		tar xzf $nex
		mv TARDIRECTORY/* . 2>/dev/null || {
			echo "Not crypted with pgpack ..."
			echo "decrypting anyway"
			exit
		}
		rm -r $nex $arc TARDIRECTORY
	else
		exit 2
	fi
	echo "$arc decrypted"
	;;
	*) 
	echo -e "\"$1\" : option not supported\n$USAGE"
	exit 1
	;;
	esac
done
exit 0

# Écrit par cerulean  <ceruleanfirm@gmail.com>  0x71F86DC1B12845E9
# Dec. 2016
# Free For All
