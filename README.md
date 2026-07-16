# DevOps Linux

This repository contains my notes and practice work for the TechWorld with Nana DevOps Bootcamp Linux module. I am using it to track Linux commands, shell scripting exercises, and small WSL-based practice examples.

## Project Structure

- `shell scripting/setup.sh`: my main practice script for variables, conditions, loops, functions, and script parameters.

## Run In WSL

From the project root:

```bash
cd devops-linux
chmod u+x "shell scripting/setup.sh"
./"shell scripting/setup.sh" config admin
```

Run the interactive score loop example:

```bash
./"shell scripting/setup.sh" config admin --score-loop
```

## What `setup.sh` Covers

- Variables and string interpolation
- Script parameters such as `$1`, `$2`, and `$#`
- Directory checks with `-d`
- File checks with `-f`
- Conditional logic with `if`, `elif`, and `else`
- Looping over parameters with `for`
- Reading user input with `read`
- Reusable functions
- Creating files and setting execute permission for shell scripts

## Basic Linux Commands

### General Operations

- `clear` clears the terminal screen.

### Directory Operations

- `pwd` shows the current directory. In WSL, an example might be `/home/josep`.
- `ls` lists folders and files.
- `cd [dirname]` changes into a directory.
- `mkdir [dirname]` creates a directory.
- `cd ..` moves up one directory.

### File Operations

- `touch [filename]` creates a file.
- `rm [filename]` deletes a file.
- `rm -r [dirname]` deletes a non-empty directory and everything inside it.
- `rm -d [dirname]` or `rmdir [dirname]` deletes an empty directory.

### Navigating The File System

- `cd usr/local/bin` moves through multiple directories using a relative path.
- `cd ../..` moves up two directory levels.
- `cd /usr` jumps directly to `/usr` with an absolute path.
- `cd [absolute path]` moves anywhere when you know the full path.
- `cd /home/josep` goes to your home directory in WSL.
- `cd ~` is the shortcut for your home directory.
- `ls /etc/network` lists the contents of the `network` directory.

### More File And Directory Operations

- `mv [filename] [new_filename]` renames a file.
- `cp -r [dirname] [new_dirname]` copies a directory recursively.
- `cp [filename] [new_filename]` copies a file.

### More Useful Commands

- `ls -R [dirname]` lists files and nested subdirectories.
- `history` shows past commands from the current shell session.
- `history 20` shows the last 20 commands.
- `Ctrl + r` searches command history.
- `Ctrl + c` stops the current command.
- `Ctrl + Shift + v` pastes copied text into the terminal.
- `ls -a` includes hidden files.
- `cat [filename]` prints file contents.
- `cat .bash_history` shows saved shell history.
- `cat README.md` prints the README file contents.

### Display OS Information

- `uname -a` shows kernel and system information.
- `cat /etc/os-release` shows Linux distribution details.
- `lscpu` shows CPU information.
- `lsmem` shows memory information.

### Execute Commands As Superuser

- `sudo [command]` runs a command with elevated privileges.
- `su - admin` switches to the `admin` user.

## Package Managers

### APT Package Manager

- `sudo apt search [package_name]` searches for a package.
- `sudo apt install [package_name]` installs a package.
- `sudo apt install [package_name] [package_name2]` installs multiple packages.
- `sudo apt remove [package_name]` removes an installed package.
- `sudo apt update` refreshes the package index from configured repositories.

### APT-GET Package Manager

- `sudo apt-get install [package_name]` installs a package with `apt-get`.

### SNAP Package Manager

- `sudo snap install [package_name]` installs a Snap package.

## Vim Notes

### Install Vim

- `sudo apt install vim` installs Vim if it is not already available.

### Vim Modes

- Command mode is the default mode.
- Insert mode lets you type text into the file.

### Common Vim Commands

- `vim [filename]` opens a file in Vim.
- Press `i` to enter insert mode.
- Press `Esc` to return to command mode.
- Type `:wq` to save and quit.
- Type `:q!` to quit without saving.
- Type `dd` to delete the current line.
- Type `10dd` to delete 10 lines.
- Type `u` to undo.
- Type `A` to jump to the end of the line and enter insert mode.
- Type `0` to jump to the start of the line.
- Type `$` to jump to the end of the line.
- Type `12G` to jump to line 12.
- Type `16G` to jump to line 16.
- Type `/pattern` to search, for example `/nginx`.
- Type `n` to move to the next match.
- Type `N` to move to the previous match.
- Type `:%s/old/new/g` to replace all matches in the file.

## Linux Accounts And Groups

### Access Control Files

- `/etc/passwd`
- `/etc/shadow`
- `/etc/group`

### User And Group Commands

- `sudo adduser [username]` creates a new user.
- `sudo passwd [username]` changes a user's password.
- `su - [username]` logs in as another user.
- `su -` logs in as root.
- `sudo groupadd [groupname]` creates a new group.
- `sudo usermod [OPTIONS] [username]` modifies a user account.
- `sudo usermod -g devops tom` sets `devops` as Tom's primary group.
- `sudo delgroup tom` removes the group `tom`.
- `groups` shows the groups for the current user.
- `groups [username]` shows the groups for a specific user.
- `sudo useradd -G devops nicole` creates `nicole` and adds her to `devops` as a supplementary group.
- `sudo gpasswd -d nicole devops` removes `nicole` from the `devops` group.

### Interactive Vs Low-Level Commands

- `adduser`, `addgroup`, `deluser`, and `delgroup` are more interactive and user friendly.
- `useradd`, `groupadd`, `userdel`, and `groupdel` are lower-level utilities that are often better for scripting.

## File Ownership And Permissions

### View Permissions

- `ls -l` shows file ownership and permission details.

### Ownership

- `sudo chown [username]:[groupname] [filename]` changes user and group ownership.
- `sudo chown tom:admin test.txt` changes `test.txt` ownership to user `tom` and group `admin`.
- `sudo chown admin test.txt` changes only the file owner.
- `sudo chgrp devops test.txt` changes the group owner.

### Symbolic Permissions

- `r` means read.
- `w` means write.
- `x` means execute.
- `-` means no permission.
- `u` means owner.
- `g` means group.
- `o` means others.

### Change Permissions

- `sudo chmod -x api` removes execute permission for everyone.
- `sudo chmod g-w config.yaml` removes write permission from the group.
- `sudo chmod g+x config.yaml` adds execute permission to the group.
- `sudo chmod u+x script.sh` adds execute permission to the owner.
- `sudo chmod o+x script.sh` adds execute permission to others.
- `sudo chmod g=rwx config.yaml` sets group permissions to read, write, and execute.
- `sudo chmod g=r-- config.yaml` sets group permissions to read only.

### Numeric Permissions

- `0` means no permission.
- `1` means execute.
- `2` means write.
- `3` means write and execute.
- `4` means read.
- `5` means read and execute.
- `6` means read and write.
- `7` means read, write, and execute.
- `sudo chmod 777 script.sh` gives everyone full permissions.
- `sudo chmod 740 script.sh` gives the owner full permissions, the group read permission, and others no permission.

## Pipes And Redirects

### Pipe And Less

- `|` sends the output of one command into another command.
- `less [filename]` opens file or command output page by page.
- `cat /var/log/syslog | less` pages through the system log.
- `ls /usr/bin | less` pages through a long command output.
- `history | less` pages through shell history.

### Pipe And Grep

- `grep [pattern]` searches for matching text.
- `history | grep sudo` filters history for commands containing `sudo`.
- `history | grep "sudo chmod"` filters history for the phrase `sudo chmod`.
- `history | grep sudo | less` filters first and then opens the results in `less`.
- `ls /usr/bin | grep java` filters command output for `java`.
- `cat config.yaml | grep ports` searches a file for `ports`.

### Redirects In Linux

- `>` writes output to a file and overwrites existing content.
- `>>` appends output to a file.
- `history | grep sudo > sudo-commands.txt` writes filtered history into a file.
- `cat sudo-commands.txt > sudo-rm-commands.txt` copies one file's content into another.
- `history | grep rm > sudo-rm-commands.txt` overwrites the target file.
- `history | grep rm >> sudo-rm-commands.txt` appends to the target file.

## Shell Scripting

### Introduction To Shell Scripting

Create and open the script in Vim:

```bash
vim setup.sh
```

Basic starter script:

```bash
#!/bin/bash

echo "Setup and configure server"
```

Save and run it:

```bash
# save in vim
Esc :wq

# make executable
chmod u+x setup.sh

# run the script
./setup.sh
bash setup.sh
```

### Shell Scripting Part 2

#### Variables

```bash
#!/bin/bash

echo "Setup and configure server"

file_name=config.yaml
config_files=$(ls config)

echo "using file $file_name to configure something"
echo "here are all configuration files: $config_files"
```

#### Conditions

```bash
#!/bin/bash

echo "Setup and configure server"

file_name=config.yaml
config_dir=$1

if [ -d "$config_dir" ]
then
 echo "reading config directory contents"
 config_files=$(ls "$config_dir")
else
 echo "config dir not found. creating one"
 mkdir "$config_dir"
 touch "$config_dir/config.sh"
fi

# example conditional for checking file
# if [ -f "config.yaml" ]

# example conditional for checking numbers
# num_files=10
# if [ "$num_files" -eq 10 ]

# example conditional for checking strings
user_group=$2
if [ "$user_group" == "admin" ]
then
 echo "administer the server"
elif [ "$user_group" == "josep" ]
then
 echo "configure the server"
else
 echo "No permission to configure server. wrong user group"
fi

echo "using file $file_name to configure something"
echo "here are all configuration files: $config_files"
```

#### User Input

```bash
#!/bin/bash

echo "Reading user input"

read -p "Please enter your password: " user_pwd
echo "thanks for your password $user_pwd"
```

#### Script Parameters

```bash
#!/bin/bash

echo "all params: $*"
echo "number of params: $#"

echo "user $1"
echo "group $2"
```

Executing with script parameters:

```bash
./example.sh name lastname
./example.sh "name lastname"
bash example.sh name lastname
```

#### Loops

```bash
#!/bin/bash

echo "all params: $*"
echo "number of params: $#"

for param in $*
do
 if [ -d "$param" ]
 then
	echo "executing scripts in the config folder"
	ls -l "$param"
 fi

 echo "$param"
done

sum=0
while true
do
 read -p "enter a score: " score

 if [ "$score" == "q" ]
 then
	break
 fi

 sum=$(($sum + $score))
 echo "total score: $sum"
done
```

### Shell Scripting Part 3

#### Functions

```bash
#!/bin/bash

echo "all params: $*"
echo "number of params: $#"

for param in $*
do
 if [ -d "$param" ]
 then
	echo "executing scripts in the config folder"
	ls -l "$param"
 fi

 echo "$param"
done

function score_sum {
	sum=0
	while true
	do
		read -p "enter a score: " score

		if [ "$score" == "q" ]
		then
			break
		fi

		sum=$(($sum + $score))
		echo "total score: $sum"
	done
}

score_sum

function create_file() {
	file_name=$1
	is_shell_script=$2

	touch "$file_name"
	echo "file $file_name created"

	if [ "$is_shell_script" = true ]
	then
		chmod u+x "$file_name"
		echo "added execute permission"
	fi
}

create_file test.txt
create_file myfile.yaml
create_file myscript.sh true

function sum() {
	total=$(($1 + $2))
	echo "$total"
}

result=$(sum 2 10)
echo "sum of 2 and 10 is $result"
```

### How This Repo Uses `setup.sh`

- The repo version of `setup.sh` is already organized into reusable functions.
- It combines variables, conditions, loops, parameters, and helper functions in one runnable practice script.
- Run it from WSL with `./"shell scripting/setup.sh" config admin`.
- Run the interactive score loop with `./"shell scripting/setup.sh" config admin --score-loop`.

## Environment Variables

Variables store information. Environment variables are available across the current shell environment.

### Existing Environment Variables

- `SHELL=/bin/bash` is the default shell.
- `HOME=/home/josep` is the current user's home directory in WSL.
- `USER=josep` is the currently logged-in user.
- `printenv` lists all environment variables.
- `printenv | less` pages through environment variables.
- `printenv USER` prints the value of `USER`.
- `printenv | grep USER` filters environment variables by name.
- `echo $USER` prints the value of `USER`.

### Create Your Own Environment Variables

- `export DB_USERNAME=dbuser` sets a variable.
- `export DB_PASSWORD=secretpwdvalue` sets a variable.
- `export DB_NAME=mydb` sets a variable.
- `printenv | grep DB` filters environment variables containing `DB`.
- `export DB_NAME=newdbname` updates the variable value.

### Delete Environment Variables

- `unset DB_NAME` removes the variable.

### Persist Environment Variables

Variables set directly in the terminal only exist for the current shell session.

Add them to `~/.bashrc`:

```bash
export DB_USERNAME=dbuser
export DB_PASSWORD=secretvl
export DB_NAME=mydb
```

Load them into the current session:

```bash
source ~/.bashrc
```

Persistence locations:

- `~/.bashrc` is user specific.
- `/etc/environment` is system wide.

### PATH Environment Variable

- `PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin` is the search path for executables.
- `PATH=$PATH:/home/josep` appends another directory to the existing path.

## Networking

### Useful Networking Commands

- `ip` shows and manages network addresses, interfaces, and routes.
- `ifconfig` is an older networking command that has largely been replaced by `ip`.
- `netstat` prints network connections and routing information.
- `ps aux` shows running processes.
- In `ps aux`, `a` means all users, `u` means show owner details, and `x` means include processes without a terminal.
- `nslookup` performs DNS lookups.
- `ping` checks connectivity between two hosts.

## SSH

### Secure Shell Basics

- `ssh username@SSHserver` connects to a remote server over SSH.
- `ssh root@64.225.108.160` connects to that server as `root`.
- `ssh-keygen -t rsa` creates an RSA SSH key pair in `~/.ssh`.
- `ls .ssh/` lists SSH-related files.
- `id_rsa` is the private key.
- `id_rsa.pub` is the public key.
- `ssh -i .ssh/id_rsa root@64.225.108.160` connects using a specific private key.

### Important SSH Files

- `~/.ssh/known_hosts` stores trusted host fingerprints.
- `~/.ssh/authorized_keys` stores public keys allowed to authenticate to the server.

## Notes

- The examples in this repo are for learning and practice.
- I am running the commands in WSL, so Linux paths and commands apply directly.
