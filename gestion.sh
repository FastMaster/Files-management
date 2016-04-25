#!/bin/bash

fmo(){
	#User interactions
	echo "Now we will move a file from one folder to another"
	sleep 1
	echo "Enter the path to the source file:"
	read mo1
	echo "Enter the destination path :"
	read mo2

	#attempt to access a file , the destination folder and saving both error control.
	cat $mo1 > /dev/null
	ErrCat=`echo $?`

	cd $mo2
	ErrCd=`echo $?`

	if [[ $ErrCat -eq 0 && $ErrCd -eq 0 ]]; then
		mv $mo1 $mo2 #comand
	else
		if [[ $ErrCat -ne 0 ]]; then
			echo "No such file"
			echo "Press Enter to continue ..."
			read en #It is expected to doesn't jump directly and can leave whenever you want by pressing any key
		elif [[ $ErrCd -ne 0 ]]; then
				echo "The directory of destination does not exist"
				echo "Press Enter to continue ..."
				read en #It is expected to doesn't jump directly and can leave whenever you want by pressing any key
		else
			echo "No such source directory"
			echo "Press Enter to continue ..."
			read en #It is expected to doesn't jump directly and can leave whenever you want by pressing any key
		
		
		
		fi
	fi
	
}

fco(){
	#User interactions
	echo "Now we will copy a file from one folder to another"
	sleep 1
	echo "Enter the path to the source file:"
	read co1
	echo "Enter the destination path :"
	read co2

	#attempt to access a file , the destination folder and saving both error control.
	cat $co1 > /dev/null
	ErrCat=`echo $?`

	cd $co2
	ErrCd=`echo $?`

	if [[ $ErrCat -eq 0 && $ErrCd -eq 0 ]]; then
		cp $co1 $co2 #comand
	else
		if [[ $ErrCat -ne 0 ]]; then
			echo "No such file"
			echo "Press Enter to continue ..."
			read en #It is expected to doesn't jump directly and can leave whenever you want by pressing any key
		elif [[ $ErrCd -ne 0 ]]; then
				echo "The directory of destination does not exist"
				echo "Press Enter to continue ..."
				read en #It is expected to doesn't jump directly and can leave whenever you want by pressing any key
		else
			echo "No such source directory"
			echo "Press Enter to continue ..."
			read en #It is expected to doesn't jump directly and can leave whenever you want by pressing any key
		
		
		
		fi
	fi
	
}

fde(){
	#User interactions
	echo "Now we will delete a file from one folder"
	sleep 2
	echo "Enter the path to the source file:"
	read de

	#attempt to access a file , the destination folder and saving both error control.
	cat $de > /dev/null
	ErrCat=`echo $?`

	if [[ $ErrCat -eq 0 ]]; then
		rm $de #Comand
	else
		echo "No such file"
		echo "Press Enter to continue ..."
		read en #It is expected to doesn't jump directly and can leave whenever you want by pressing any key
	fi
	
}

fls(){
	#User interactions
	echo "Now we will show the content from one folder"
	sleep 2
	echo "Enter the path to the source file:"
	read le

	#attempt to access a file , the destination folder and saving both error control.
	cd $le
	ErrCd=`echo $?`

	if [[ $ErrCd -eq 0 ]]; then
		ls $le # Comand
		echo "Press Enter to continue ..."
		read en #It is expected to doesn't jump directly and can leave whenever you want by pressing any key
	else
		echo "No such file or folder"
		echo "Press Enter to continue ..."
		read en #It is expected to doesn't jump directly and can leave whenever you want by pressing any key
	fi
	
}

fcr(){
	#User interactions
	echo "Now create many file into a folder"
	sleep 2
	echo "Enter the path to the source folder:"
	read cr
	echo "How many files do you want to create?"
	read num

	#attempt to access a file , the destination folder and saving both error control.
	cd $cr
	ErrCd=`echo $?`

	if [[ $ErrCd -eq 0 ]]; then

		#Bucle para crear tantos archivos como digas.
		for (( i = 0; i < $num; i++ )); do
			echo "Name:"
			read nom
			touch $nom
		done
	else
		echo "No such folder"
		echo "Press Enter to continue ..."
		read en #It is expected to doesn't jump directly and can leave whenever you want by pressing any key
	fi
	
}
clear

menu(){
	#User interactions
echo "Choose any option:"
echo "R) Create"
echo "D) Delete"
echo "M) Move"
echo "C) Copy"
echo "L) List"
echo "Q) Quite"
}

	menu
	read var

until [[ $var == q ]]; do

	#choose the option and redirect to function
	if [[ $var == m ]]; then
		fmo
	elif [[ $var == c ]]; then
		fco
	elif [[ $var == d ]]; then
		fde
	elif [[ $var == l ]]; then
		fls
	elif [[ $var == r ]]; then
		fcr
	else
		clear
		echo "You've got the wrong option"
		sleep 3 
	fi

	clear
	menu
	read var
done
clear
echo "Thanks for using my program"
echo "Author:FastMaster"
sleep 3
clear