#!/bin/bash

# echo "Ich bin bashScript"
# cat > script.txt    write 
# cat >> script.txt         append
# cat < script.txt          read 
# cat << my         prints on screen
# varname="Protoitz"
# my
# :'Hello this 
# is multi line commentt'  works if not then choose the below task



<<COMMENT
#conditional statements 
:'
cnt=1

if [ $cnt -eq 10  -o  $cnt -gt 20 ]  #[[$cnt -eq 10 && $cnt -gt 20]] ;  [ $cnt -eq 10 ] && [ $cnt -gt 20 ]  three ways to write this 
then 
    echo "True bhai"
elif (($cnt>9)) #comparing in terms of numbers 
then
    echo "Haan bhai bada hai"
elif (($cnt==1))
then
    echo "Sahi likh na "
else 
    echo "Na bhaii"
fi

#switch 

day="Tuesday"

case $day in 
    "Monday")
        echo "Start of the week";;
    "Tuesday")
        echo "Second day";;
    "Wednesday"|"Thursday")
        echo "Midweek";;
    *)
        echo "Other day";;
esac
'


#loops
num=1
while (( $num <= 10 ))  # or [ $num -le 10 ]
do 
    echo "$num"
    ((num+=1))
done


#runs until the condition is false
until (( $num >= 20 ))
do 
    echo "$num"
    ((num+=1))
done



#for loop 
for i in {1..10}
do 
    echo $i
done

for i in "a" "b" "c" # or 1 2 3 4
do 
    echo $i
done

for ((i=10;i<=20;i++)) #remember to use brackets 
do 
    echo $i 
done 
COMMENT



# echo $0 $1 $2 --these are positional arguments directly given in cli

arr=("$@") # take multiple values

# echo ${args[0]} ${args[1]} ${args[2]} ---printitng one by one

echo $@  #--all values inside the array 
echo $#  #--length of array 

while read line 
do 
    echo "Line:$line"
done < script.txt

while read line 
do 
    echo "Line:$line"
done < {"1:-/dev/stdin"}  #from command line standard input

cat script.txt | while read line  #using cat
do 
    echo $line
done 



#stdout
ls -al 1>file1.txt 2>file2.txt  # 1.stores output 2.stores error if any
ls +al >& file1.txt  # same for error and output