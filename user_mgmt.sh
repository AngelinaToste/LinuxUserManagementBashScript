#!/bin/bash

#create a new user


create_user(){
    username=$1
    password=$2
    UID=$3
    GID=$4
    homedir=$5
    shell=$6

    echo "Input: '$username', '$password'"
    #create user with specified user name
    
    if [ -z $password ]; then
        $password="default"
    elif [ -z $UID ]; then
        $UID=1000
    elif [ -z $GID ]; then
        $GID=1000
    elif [ -z $homedir ]; then
        $homedir="/home/${$username}"
    elif [ -z $shell ]; then
        $shell="/bin/bas"
    fi

    #create user
    sudo useradd $username

    #setting the password for the user
    echo "$username:$password" | sudo chpasswd

    #set UID for the user

    echo "The user '$username' has been created with the password '$password'"

}

display_user(){
    username=$1
    #password=$2

    echo "Here is the information for the user '$username'"
    id $username
    echo
    echo "Here is the home directory for the user '$username'"
    eval echo "~$username"
    echo
    echo "Here is the shell for the user '$username'"
    getent passwd $username | grep -oP ':[^:]*$' | grep -oP '[^:]+'
    echo
}

delete_user(){
    username=$1
    sudo userdel $username
    echo "The username '$username' has been deleted."
    echo 

}

create_user bob password123

#this function will allow management of a specified user account 
# the command will require the username, password, and the action (create,  display, delete)

if [[ $1 == "create" ]]; then 
    if [[ -n "$3" ]]; then
        create_user $2 $3
    fi
elif [[ $1 == "display" ]]; then 
    display_user $2
elif [[ $1 == "delete" ]]; then 
    delete_user $2
else
    echo "Please specify a command (create, display, delete)"
fi








