# mosquitto-passwd
OpenSSL and Mosquitto password generator based on Alpine Linux.

## Generate password files

The password script will generate the following password files into the mounted volume `./passwd`:

 - `./passwd/mosquitto.plain` - username(s) and plain password(s) using [openssl rand](https://www.openssl.org/docs/man1.0.2/man1/openssl-rand.html)
 - `./passwd/mosquitto.passwd` - username(s) and encrypted password(s) using [mosquitto_passwd](https://mosquitto.org/man/mosquitto_passwd-1.html)
 - `./passwd/<username>_passwd.json` - for each username and plain password

 Note: usernames and passwords will be appended to the _mosquitto.plain_ file. If you want to clear the password files run the following command: 
   - Linux: `sudo rm -rf ./passwd`
   - Windows PS: `rm passwd`

## Prerequistes

1. Create the `passwd` directory, if it doesn't exist:

   `mkdir -p passwd`

   Note: while Linux will create the _passwd_ folder automatically, Windows needs an existing _passwd_ directory, before mounting the volume.
   
2. Ensure that you use the latest docker image:

   `docker pull burkhardm/mosquitto-passwd:latest`

## For single user
The following command generates the password files for the default username: 'user'.

`docker run -v ${pwd}/passwd:/passwd burkhardm/mosquitto-passwd:latest`

## For multiple users
The following command generates the password files for every user passed as command-line argument.

`docker run -v ${pwd}/passwd:/passwd burkhardm/mosquitto-passwd:latest user0 user1 user2`
