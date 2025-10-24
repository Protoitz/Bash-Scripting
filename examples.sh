#!/bin/bash


# echo "Protoitz $msg"  --export to ./basics.sh


#converting hex num into normal 
# read -p "Enter hex num: " num
# printf "The decimal value of %s: %d\n" "$num" "0x$num"



# star pattern 
# read -p "Enter number of rows: " row
# for (( i=1;i<=row;i++ ))
# do 
#     for (( j=1;j<=$((row-i));j++ ))
#     do
#         echo -n " "
#     done
#     for (( k=1;k<=$((2*i-1));k++ ))
#     do 
#         echo -n "*"
#     done
#     echo 
# done



#function to check if a file exists
# check_file(){
#     [[ -f "$1" ]] && return 0 || return 1
# }

# check_file "./script.txt"
# if [[ $? == 0 ]]
# then 
#     echo "File exists"
# else
#     echo "File not found"
# fi


#function to check prime
func(){
    if [[ $1 == 0 || $1 == 1 ]]
    then 
        echo "Not Prime "
        return 
    fi
    local flag=0
    for ((i=2;i<$1;i++))
    do 
        if [ $(($1%i)) == 0 ]
        then 
            flag=1
            break
        fi
    done
    if [ $flag -eq 0 ]
    then 
        echo "Prime"
    else
        echo "Not Prime"
    fi
}

func $1 #--form cli or directly value

