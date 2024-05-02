#!/bin/bash

#create a new user


create_user(){
    username=$1
    password=$2
    UID=$3
    GID=$4
    homedir=$5
    shell=$6

    #create user with specified user name
    
    sudo useradd -m -s /bin/bash $username

    #setting the password for the user
    echo "$username:$password" | sudo chpasswd

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

manage_user(){
    action=$1
    username=$2
    password=$3
    
    
    
    #this function will allow management of a specified user account 
    # the command will require the username, password, and the action (create,  display, delete)

    if [[ $action == "create" ]]; then 
        if [[ -n "$password" ]]; then
            create_user $username $password
        fi
    elif [[ $action == "display" ]]; then 
        display_user $username
    elif [[ $action == "delete" ]]; then 
        delete_user $username
    else
        echo "Please specify a command (create, display, delete)"
    fi
}







