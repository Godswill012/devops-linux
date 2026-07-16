#!/bin/bash

# Intro output so you can tell the script started.
echo "Setup and configure server"

# Core variables used throughout the script.
file_name="config.yaml"
config_dir="${1:-config}"
user_group="$2"
config_files=""

# Function: keep asking for scores until the user enters q.
score_sum() {
  local sum=0

  while true; do
    read -p "enter a score (or q to quit): " score

    if [ "$score" = "q" ]; then
      break
    fi

    sum=$((sum + score))
    echo "total score: $sum"
  done
}

# Function: create a file and optionally make it executable.
create_file() {
  local created_file_name="$1"
  local is_shell_script="$2"

  touch "$created_file_name"
  echo "file $created_file_name created"

  if [ "$is_shell_script" = "true" ]; then
    chmod u+x "$created_file_name"
    echo "added execute permission"
  fi
}

# Script parameters: $* shows all params, $# shows how many were passed.
echo "all params: $*"
echo "number of params: $#"
echo "user group: ${user_group:-not provided}"

# Directory check: use the first argument as the config directory.
if [ -d "$config_dir" ]; then
  echo "reading config directory contents"
  config_files=$(ls "$config_dir")
else
  echo "config dir not found. creating one"
  mkdir -p "$config_dir"
  touch "$config_dir/config.sh"
  config_files=$(ls "$config_dir")
fi

# String condition: decide access based on the second argument.
if [ "$user_group" = "godswill" ]; then
  echo "configure the server"
elif [ "$user_group" = "admin" ]; then
  echo "administer the server"
else
  echo "No permission to configure server. wrong user group"
fi

if [ -f "$file_name" ]; then
  echo "$file_name exists"
else
  echo "$file_name does not exist"
fi

# Show the variable values collected so far.
echo "using file $file_name to configure something"
echo "here are all configuration files: $config_files"

# Loop through every script argument and inspect directory arguments.
for param in "$@"; do
  if [ -d "$param" ]; then
    echo "executing scripts in the config folder"
    ls -l "$param"
  fi

  echo "$param"
done

# Function calls: create a few practice files.
create_file "test.txt"
create_file "myfile.yaml"
create_file "myscript.sh" "true"

# Arithmetic example.
result=$((2 + 10))
echo "sum of 2 and 10 is $result"

# Optional interactive loop, enabled only when the third arg is --score-loop.
if [ "$3" = "--score-loop" ]; then
  score_sum
fi