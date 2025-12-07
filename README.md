Script options:
2a: netstat -tunp | tee "$DirectoryPath/NetworkState/netstat.txt"
2b: arp -a | tee "$DirectoryPath/NetworkState/arp.txt"
2c: route -n | tee "$DirectoryPath/NetworkState/route.txt"
2d:  ifconfig -a | tee "$DirectoryPath/NetworkState/ifconfig.txt"

3a: ps -ef | tee "$DirectoryPath/RunningProcesses/psEf.txt"
3b: lsof | tee "$DirectoryPath/RunningProcesses/lsof.txt"
3c: netstat -tunp | tee "$DirectoryPath/RunningProcesses/netstat.txt"

4a: w | tee "$DirectoryPath/LoggedInUsers/w.txt"
4b: who -T | tee "$DirectoryPath/LoggedInUsers/who.txt"
4c: last | tee "$DirectoryPath/LoggedInUsers/last.txt"

5a: xclip -o | tee "$DirectoryPath/Clipboard/xclip.txt"
5b: xsel --clipboard --output | tee "$DirectoryPath/Clipboard/xsel.txt"

6a: env | tee "$DirectoryPath/EnvironmentalVariables/environment_variables.txt" 
6b: set | tee "$DirectoryPath/EnvironmentalVariables/environment_set.txt"


7a: mount -v | tee "$DirectoryPath/Mounted/mount.txt"
7b: lsblk -f | tee "$DirectoryPath/Mounted/lsblk.txt"
7c: df -h | tee "$DirectoryPath/Mounted/df.txt"

8a: date | tee "$DirectoryPath/Time/date.txt"
8b: uptime -p | tee "$DirectoryPath/Time/uptime.txt"
8c: cat /proc/uptime | tee "$DirectoryPath/Time/catUptime.txt"
8d: who -b | tee "$DirectoryPath/Time/SystemBoot.txt"

How to use:
./toolsscript.sh ...
e.g ./toolscript.sh /saveFileLocation/ 2a 3b 4a 5all
or ./toolsscript.sh /home/username/Downloads all
 
