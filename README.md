# IPDeny
Bash script for blocking IP blocks owned by countries.

***Note: Currently only works with iptables, new firewalls to come soon.***

### Installation
First, ensure that ***wget*** is installed on your system.<br />
Through the command line terminal on your system, run `cd /opt && wget https://raw.githubusercontent.com/alleck/IPDeny/master/deny.sh --no-check-certificate`<br />
This will download the file and place it in the ***/opt*** directory.<br />

### Usage
To use the script, ensure you are in the ***/opt*** directory. `cd /opt`<br />
Run `sh deny.sh`<br />
This will start the script, and take you to the menu.<br />
Next, enter the country code you wish to block or unblock, (ex. US) Then press enter.<br />
Next, choose whether you want to remove or add the rules for the contry code you used. ([1] will add the rules, [2] will remove the rules.)<br />

#### (If you are on CentOS or Red Hat)
Once you are done, run `service iptables save` to save the rules perminantly to the iptables configuration. 
