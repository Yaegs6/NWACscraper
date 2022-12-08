# NWACscraper
Short script to scrape NWAC for snow forecast

This is a short powershell script that checks the NWAC site every two minutes until the site updates with the snow forecast. 
It currently scrapes for Mt Hood Meadows but choose whichever mountain forecast you'd like. It sends an update via 
gmail after the update has been confirmed. You will need to add your gmail credentials and recipient emails to the script. I suggest creating an app 
password as opposed to using your own personal or company email password. This was created in powershell for ease of running from task manager in windows
10 on an automated schedule. 
