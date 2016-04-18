#!/bin/bash

dumpFile="$1"
dumpDir="$2"
databaseRootPassword="$3"
dbUser="$4"
dbUserPassword="$5"
dbName="$6"

chmod 644 /etc/mysql/conf.d/my.cnf

if  find /var/lib/mysql -maxdepth 0 -empty | read v; then


	chmod 644 /etc/mysql/conf.d/my.cnf
	cp /etc/mysql/my.cnf /usr/share/mysql/my-default.cnf

	echo 'Initializing MySQL'

	mysql_install_db

	echo 'MySQL Initialized, starting daemon'

	/usr/bin/mysqld_safe &
	sleep 5

	echo 'Mysql daemon started, creating root user'


	mysql -uroot -e "CREATE USER 'root'@'%' IDENTIFIED BY '$databaseRootPassword'"
	mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION"

	echo 'Root user created, creating user and DB'

	mysql -uroot -e "CREATE DATABASE $dbName;"
	mysql -uroot -e  "CREATE USER '$dbUser'@'%' IDENTIFIED BY '$dbUserPassword' ; GRANT ALL ON $dbName.* TO '$dbUser'@'%' ;"
	mysql -uroot -e  "FLUSH PRIVILEGES ;"

	echo 'DB and user created'

	if  [ -n "$dumpFile" ] ; then

		echo "Loading dump file $dumpFile"

		mysql -u root $dbName  < $dumpDir'/'$dumpFile

		echo 'DB dump loaded'

	else

		echo 'No dump file to load'

	fi

	echo 'Init finished'
	
	/usr/bin/mysqld_safe 

else

	echo "Data already loaded, skiping init and dump load"
	/usr/bin/mysqld_safe 
fi


