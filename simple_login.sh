# Simple Login Program-- taking the password silently

read -p "Enter username: " user
read -s -p "Enter password: " passw
echo 

if [[ $user == "protoitz" && $passw == "4545" ]]
then 
    echo "Logged in successfully!"
else
    if [[ ${#passw} > 4 ]]
        then 
            echo "Incorrect password length"
    fi
    echo "Wrong Credentials"
fi