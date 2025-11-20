#!/bin/bash

DirectoryPath="$1"
shift

CommandsRan=("$@")
########
# No.1 RAM Dump
########

########
# No.2 Capture Network State
########
mkdir "$DirectoryPath/NetworkState/"


_2a() {
    netstat -tunp | tee "$DirectoryPath/NetworkState/netstat.txt"
}

_2b() {
    arp -a | tee "$DirectoryPath/NetworkState/arp.txt"
}

_2c() {
    route -n | tee "$DirectoryPath/NetworkState/route.txt"
}

_2d() {
    ifconfig -a | tee "$DirectoryPath/NetworkState/ifconfig.txt"
}

_2all() {
    _2a
    _2b
    _2c
    _2d
}



########
# No.3 Running Processes & Open Files
########

mkdir "$DirectoryPath/RunningProcesses/"

_3a() {
    ps -ef | tee "$DirectoryPath/RunningProcesses/psEf.txt"
}

_3b() {
    lsof | tee "$DirectoryPath/RunningProcesses/lsof.txt"
}


_3c() {
    netstat -tunp | tee "$DirectoryPath/RunningProcesses/netstat.txt"
}

_3all() {
    _3a
    _3b
    _3c
}

########
# No.4 Loggedin Users & Active Sessions
########

mkdir "$DirectoryPath/LoggedInUsers/"

_4a() {
    w | tee "$DirectoryPath/LoggedInUsers/w.txt"
}

_4b() {
    who -T | tee "$DirectoryPath/LoggedInUsers/who.txt"
}

_4c() {
    last | tee "$DirectoryPath/LoggedInUsers/last.txt"
}

_4all() {
    _4a
    _4b
    _4c
}


########
# No.5 Clipboard capture
########

mkdir "$DirectoryPath/Clipboard/"

_5a() {
    xclip -o | tee "$DirectoryPath/Clipboard/xclip.txt"
}

_5b() {
    xsel --clipboard --output | tee "$DirectoryPath/Clipboard/xsel.txt"
}

_5all() {
    _5a
    _5b
}



########
# No.6 Environmental Variables
########

mkdir "$DirectoryPath/Clipboard/"


_6a() {
   env | tee "$DirectoryPath/Clipboard/environment_variables.txt" 
}

_6b() {
    set | tee "$DirectoryPath/Clipboard/environment_set.txt"
}

_6all() {
    _6a
    _6b
}

########
# No.7 Mounted Devices & Network Shares 
########

mkdir "$DirectoryPath/Mounted"

_7a() {
    mount -v | tee "$DirectoryPath/Mounted/mount.txt"
}

_7b() {
    lsblk -f | tee "$DirectoryPath/Mounted/lsblk.txt"
}

_7c() {
    df -h | tee "$DirectoryPath/Mounted/df.txt"
}

########
# No.8 System Time & Uptime 
########

mkdir "$DirectoryPath/Time"

_8a() {
    date | tee "$DirectoryPath/Time/date.txt"
}

_8b() {
    uptime -p | tee "$DirectoryPath/Time/uptime.txt"
}

_8c() {
    cat /proc/uptime | tee "$DirectoryPath/Time/catUptime.txt"
}

_8d() {
    who -b | tee "$DirectoryPath/Time/SystemBoot.txt"
}

_8all() {
    _8a
    _8b
    _8c
    _8d
}

########
# Misc
########

all() {
    _2all
    _3all
    _4all
    _5all
    _6all
    _7all
    _8all
}


for mod in "${CommandsRan[@]}"; do
    func="_${mod}"

    if declare -f "$func" >/dev/null; then
        $func
    fi
done
