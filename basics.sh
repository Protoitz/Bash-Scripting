#!/bin/bash


<<'COMMENT'

-----simple strings manipulations-----
str=protoitz      #---no "" needed if without spaces
echo ${#str}          #---length of str  
echo ${str:2:3}       #---slicing start:end
echo ${str^^}         #---to uppercase
echo ${str,,}         #---to lowercase
echo ${str/e/f}       #---replace /old/new
echo ${str^}          #---first letter same for lower ,  
echo "$str concat"


echo "Ich bin bashScript"
cat > script.txt    write 
cat >> script.txt         append 
cat < script.txt          read 
cat << my         prints on screen
varname="Protoitz"
my
:'Hello this 
is multi line commentt'  works if not then choose the below task



---simple reading and multiplication of two numbers---
echo "Enter first num1"
read num1
echo "Enter first num2"
read num2

printf "Hallo"   ---no new line 

result=$((num1*num2))   ---use dollar sign with bracket for arth operation
echo $result


readonly var=45         ---declare a readonly variable 

---conditional statements--- 
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

---switch 

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



---loops---

num=1
while (( $num <= 10 ))  # or [ $num -le 10 ]
do 
    echo "$num"
    ((num+=1))
done


---runs until the condition is false
until (( $num >= 20 ))
do 
    echo "$num"
    ((num+=1))
done



---for loop 
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


---positional arguments and storing them in an array---

# echo $0 $1 $2 --these are positional arguments directly given in cli

arr=("$@") # take multiple values

# echo ${args[0]} ${args[1]} ${args[2]} ---printitng one by one

echo $@  #--all values inside the array 
echo $#  #--length of array 


--- reading  a file ---- Input output redirection 

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



---stdout---
ls -al 1>file1.txt 2>file2.txt  # 1.stores output 2.stores error if any
ls +al >& file1.txt  # same for error and output



--- exporting variable to another script ---


msg="Hallo woher kommst du"
export msg 
./prac.sh 



declare -p                   ---list all variables
declare myvar=22             ---declares a variable
declare -r pwd=/etc/pwd      ---declared a readonly variable 




-------Arrays---------

car=('BMW' 'Toyota' 'Honda')


echo ${car[@]}      ---prints  all values
echo ${#car[@]}      ---length
echo ${!car[@]}       ---prints the indexs in array
echo $car             ---prints first value


echo ${car[1]}         ---indexing
unset car[2]         ---removes value
car[2]="Mercedes"    ---inserts a 2 index
   
---Traversing
num=(1 2 3 4 5 6)
for i in ${num[@]}                  use logic for any other type of traversing
do
echo $i
done 

---another way 
num=(1 2 3 4 5 6)
for ((i=0;i<${#num[@]};i++))               
do
echo ${num[i]}
done 



# ------functions-------

#A basic function 
function func()                                                #---function keyword is not compulsory
{
    func="Das ist mein func"           #---global unless declared variable
    local var="Das ist local variable"
    echo $var
}

func="Das ist nicht func"       #----updates the value as func is global even inside a function 
echo $func

func
echo $func                  #-----the value is now the same of function variable it updates itself
echo $var                   #-----empty bcs its local to function


#add to num
sum(){
    return $(($1+$2))
}                                       #---not used as return only gives  exit code status 0-255
sum 2 6
echo $? #--get return value

sum2(){
    echo $(($1+$2))                     #instead of return use this way 
}
sum2 8 9

# ----- return should used as exit status like 0 and 1 if a file exists or not 
#an example is in examples file 


COMMENT

