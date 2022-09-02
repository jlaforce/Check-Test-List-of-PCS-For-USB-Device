# Check-Text-List-of-PCS-For-USB-Device
This script uses a selected Text file to use CIM to query Multiple PCs in the effort to find a specific usb device that you name. SCCM is not always the most reliable, so I create this quick dirty report to tell me where stuff is. Especially when it "magically" moves around in an environment. You can pair it with other scripts of mine to "get the details". And figure out whom is the one buying lunch today, lol . I can also create a separate script to help you list the names of a specfic computer name. Just feel free to email me if you want want differrent mods for your environment.  Or fill out my contact form on https://jlaforce.me and I'll get back to ya. ::If you ask me, I'll more than likely add it to my blog, I'll remove your details, but be wuuuurned.::

# Requirements - you is admin, or you nicely ask an admin. Also, you need to have your ExecutionPolicy set from "Disabled" to .... something. 

# !NOTE == I also included some scripting for Microsofts Sysinternals PSexec. 

The reason why it's not included is because in some strict environments, you need to make sure to get your permissions and blesssings before use ::i.e. - Good security practice::. The reason for the other two lines is to turn off the firewall. TURNING OFF THE FIREWALL ::had to cap it, just so ya know::, is most enterprise environments, if you are utilizing your Group Policy, as well as better third party firewalling and endpoint management tools, Windows Firewall is not necessary, however in some cases is still enabled. That's why I included the additional lines. You can still leave them commented out, or remove them entirely if they are not necessary. 
If you create a folder and drop this script, as well as the latest psexec, and remove the ##'s in front of the "for each" and final "}", it will forcibly enable PSRemoting so that you can run the script without all the red ERRRRs. ::also you can silence them easy as well:: 

To get the latest psexec:
https://docs.microsoft.com/en-us/sysinternals/downloads/psexec
It's contained in the latest pstools in the link above. 
