# QuickNotes
So I don't have to re-research the solutions.

SSH Quick Reference
mkdir ~/.ssh/authorized_keys

Graylog time issue
Graylog dashboard will show no logs, even if there are logs ingesting.
Reason is mismatch on graylog server.conf time zone, and server,
They must match.... Duh

Installing All The Mods  MC Server
X11 error, requires --installServer at the end of the command
java -jar forge-1.19.2-43.1.27-installer.jar --installServer

Also, openjdk-XX-jdk, 

For Plex Pass on truenas scale:
app pool settings > uncheck the safety bull****
install plex, selecting data mount to the correct folder
continue, but dont add libraries
after installation, go into the container shell, run "id plex"
create group with name of plex and the group id #
create user with name of plex and the user id #
Restart plex app, map libraries
