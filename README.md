# mosquitto-passwd
OpenSSL and Mosquitto password generator based on Alpine Linux.

## Generate password files

The password script will generate a `./passwd` folder including the following password files:

 - `./passwd/mosquitto.plain` - username(s) and plain password(s) using [openssl rand](https://www.openssl.org/docs/man1.0.2/man1/openssl-rand.html)
 - `./passwd/mosquitto.passwd` - username(s) and encrypted password(s) using [mosquitto_passwd](https://mosquitto.org/man/mosquitto_passwd-1.html)
 - `./passwd/<username>_passwd.json` - for each username and plain password

 Note: usernames and passwords will be appended to the _mosquitto.plain_ file. If you want to clear the password files run the following command: `sudo rm -rf ./passwd`

## For single user
The following command generates the password files for the default username: 'user'.

`docker run -v $(pwd)/passwd:/passwd burkhardm/mosquitto-passwd`

## For multiple users
The following command generates the password files for every user passed as command-line argument.

`docker run -v $(pwd)/passwd:/passwd burkhardm/mosquitto-passwd user0 user1 user2`
