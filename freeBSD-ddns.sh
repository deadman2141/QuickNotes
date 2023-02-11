#!/bin/sh
# Modified by DeadMan2141 on 11 February 2023
# Massive thanks to all those that developed this before myself!
# This script has been run though https://www.shellcheck.net/
# Updating to the new Linode API https://www.linode.com/docs/api/domains/#domain-record-update
# RTFM Linode docs before deploying

# Adjusting to be run with sh in FreeBSD.
# For this to work, you must already have a record populated in linode.
# This script is only to update records, not create new ones.

# You first must find out the domain ID and resource ID numbers. In order to do this follow the steps below.
# 1. Create a Linode API Key through your account profile at https://cloud.linode.com/dashboard. Give it rights to read/write to domains only.
# 2. From a shell run the following command: LINODE_API_KEY=[insert API key from step 1 here]
# 3. Run the following command to get the domain ID number for the domain you want to manage: curl -H "Authorization: Bearer $LINODE_API_KEY" https://api.linode.com/v4/domains/
# 4. From a shell run the following command: DOMAIN_ID=[insert domain ID number from step 3 here]
# 5. Run the following command to get the resource ID number for the subdomain you want to manage: curl -H "Authorization: Bearer $LINODE_API_KEY" https://api.linode.com/v4/domains/$DOMAIN_ID/records/
# 6. From a shell run the following command: RESOURCE_ID=[insert resource ID number from step 5 here]
# NOTE: Make sure you use the Resource ID from the A record, (Or what record you want to adjust)
# 7. Run the following command to verify the current settings for this resource: curl -H "Authorization: Bearer $LINODE_API_KEY" https://api.linode.com/v4/domains/$DOMAIN_ID/records/$RESOURCE_ID
# 8. Use the information collected from these commands to complete the variables below in this script.

LINODE_API_KEY=
DOMAIN_ID=
RESOURCE_ID=
NAME=

resource_update() {
curl -H "Content-Type: application/json" \
	-H "Authorization: Bearer $LINODE_API_KEY" \
	-X PUT -d '{
		"name": "'$NAME'",
		"target": "'$WAN_IP'",
		"priority": 50,
		"weight": 50,
		"port": 80,
		"service": null,
		"protocol": null,
		"ttl_sec": 0,
		"tag": null
	}' \
	https://api.linode.com/v4/domains/"$DOMAIN_ID"/records/"$RESOURCE_ID"
}

WAN_IP=$(curl -s ifconfig.me/ip)
if [ -f "$HOME"/.wan_ip.txt ]; then
	OLD_WAN_IP=$(cat "$HOME"/.wan_ip.txt)
else
	echo "No file, need IP"
	OLD_WAN_IP=""
fi

if [ "$WAN_IP" = "$OLD_WAN_IP" ]; then
	echo "IP Unchanged"
else
	echo "$WAN_IP" > "$HOME"/.wan_ip.txt
	echo "Updating DNS to $WAN_IP. Results from Linode are displayed below."
	resource_update
fi
