#!/bin/bash

set -euo pipefail

plain_file=/passwd/mosquitto.plain
passwd_file=/passwd/mosquitto.passwd


add_user_passwd()
{
  username=$1
  echo "Generating password for '$username'."
  passwd=$(openssl rand -base64 32)

  json_file=/passwd/"$username"_passwd.json
  echo "Saving username and plain-text password to '$json_file'."
  echo -e "{\n  \"Username\":\"${username}\",\n  \"Password\":\"${passwd}\"\n}\n" >> "$json_file"

  echo "Appending username and plain-text password to '$plain_file'."
  echo "$username:$passwd" >> "$plain_file"

  unset passwd
  chmod 775 "$json_file"
}

if [ $# -eq 0 ]
  then
    username="user"
    add_user_passwd $username
  else
    echo "Generating passwords for users: $@"
    for username in "$@"
    do
        add_user_passwd "$username"
    done
fi

echo "Encrypting plain-text password using mosquitto_passwd."
cp "$plain_file" "$passwd_file"
mosquitto_passwd -U "$passwd_file"

echo "Contents of '$passwd_file':"
cat "$passwd_file"

chmod 755 "$plain_file"
chmod 755 "$passwd_file"