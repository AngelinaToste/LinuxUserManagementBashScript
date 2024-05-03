#!/bin/bash

#create a new user
create_user(){
    username=$1
    password=${2:-"password"} #set a defualt password
    homedir=${5:-"/home/$username"} #set a default homedirectory
    shell=${6:-"/bin/bash"} #set a default shell

    
    { 
    #try 
    echo "Input: '$username', '$password'"
    #create user with specified user name
    
    
    #create user
    sudo useradd -d "$homedir" -s "$shell" "$username"

    #setting the password for the user
    echo "$username:$password" | sudo chpasswd

    }||{
    #catch
    echo "There was an error in creating the specified user."

    }
    echo "The user, '$username', has been created."

}

#display information for a user
display_user(){
    username=$1

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

# delete a user
delete_user(){
    username=$1
    sudo userdel $username
    echo "The username '$username' has been deleted."
    echo 

}


if [[ $1 == "create" ]]; then 
    if [[ -n "$3" ]]; then
        create_user $2 $3
    fi
elif [[ $1 == "display" ]]; then 
    display_user $2
elif [[ $1 == "delete" ]]; then 
    delete_user $2
else
    echo "Please specify a command (create, display, delete) and the username. 
Optionally, a password, home directory, and shell can be provided.
Use the format: command username password homedirectory shell"
fi















