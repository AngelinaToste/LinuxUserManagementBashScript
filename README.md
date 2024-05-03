Angelina Toste

This README file contains format for how to use the user_mgmt.sh file and explains how the file works. It also mentions the use of the logfile.log file.
Files:

The user_mgmt.sh file is the bash script. It contains functions for conducting the actions: create, display, and delete
It includes error handling  for cases when a user name already exists or for when the instruction is inputted in the wrong format.

The following functions are included in the script:
 create_user()
   This function implements the useradd and chpasswd commands to create the user with specified home directory or shell along with the password.
   Error handling exists for attempting to create a user that already exists.
 display_user()
   This function displays information about a specified user which includes uid, gid, group, shell, and home directory.
   Error handling exists for referencing a user that does not exist.
 delete_user()
   This function deletes a specified user using the userdel command.

The following are formats that the user can use to implement the functionalities
To create a user:
./user_mgmt.sh create username password homeDirectory shell

*Note that password, homeDirectory, and shell are optional parameters

To display user information:
./user_mgmt.sh display username

To delete user information:
./user_mgmt.sh delete username


All of the output from the file is contained in the logfile.log
