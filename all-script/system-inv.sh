#OS Inventory
#2- one time I was staffed with a company and they wanted me to help write a script that can be used for a full server #inventory. ( maybe server needs to be decommissioned, maybe server is out of lice , or server needs to be replaced)
#the script I put together was checking:
#-Os running and version
#- Size of memory
#-Size of harddrive
#-Cpu speed
#-Kernel version
#- system bits ( 32 or 64 )
#- the hostname
#- the ip address
#- all opened ports
#- dns
#- the manufacturer
#- is the system virtual or physical
#- the mac address
#######################################

#!/bin/bash
#
#Author: Nestor
#Date: November 2021
#Description: Script use to inventory a server
#
function disk_space {
        clear
        df -k
}
function whose_on {
        clear
        who
}
function mem_usage {
        clear
        cat /proc/meminfo
}
function os_version {
        clear
        cat /etc/*release | head -2
}
function cpu_speed {
        clear
        lscpu | grep MHz
}
function kernel_version {
        clear
        uname -r | awk -F. '{ print $1 "." $2 }'
}
function sys_bit {
        clear
        arch
}
function host_name {
        clear
        hostname
}
function ip_address {
        clear
        ip -4 address | head -6 | grep inet | tail -1 | awk '{print $2}'
}

function opened_port {
        clear
        netstat | head -4 | tail -2 | awk '{ print $1 }'
}
function dns {
        clear
        nmcli | tail -8 | grep server | sed 's/servers/DNS/'
}
function mac {
        clear
        nmcli | grep ethernet | awk '{print $3}' | sed 's/,/ /'
}
function hypervisor {
        clear
        lscpu | grep Hypervisor
}
function manufacturer {
        clear
        dmidecode | grep -A3 '^System Information'
}
function menu {
        clear
        echo
        echo -e "\t\t\tSys Admin Menu\n"
        echo -e "\t01. Display Disk space"
        echo -e "\t02. Display Logged on users"
        echo -e "\t03. Display Memory usage"
        echo -e "\t04. Display Os/Version"
        echo -e "\t05. Display CPU speed"
        echo -e "\t06. Display Kernel version"
        echo -e "\t07. Display System bit"
        echo -e "\t08. Display Hostname"
        echo -e "\t09. Display IP adress"
        echo -e "\t10. Display Open ports"
        echo -e "\t11. Display DNS"
        echo -e "\t12. Display Mac address"
        echo -e "\t13. Display Hypervisor"
        echo -e "\t14. Display Manufacturer"
        echo -e "\t00. Exit program\n\n"
        echo -en "\t\tEnter option: "
        read -n 2 option
}
while [ 1 ]
do
        menu
        case $option in
                00)
                        break ;;
                01)
                        disk_space ;;
                02)
                        whose_on ;;
                03)
                        mem_usage ;;
                04)
                        os_version ;;
                05)
                        cpu_speed ;;
                06)
                        kernel_version ;;
                07)
                        sys_bit ;;
                08)
                        host_name ;;
                09)
                        ip_address ;;
                10)
                        opened_port ;;
                11)
                        dns ;;
                12)
                        mac ;;
                13)
                        hypervisor ;;
                14)
                        manufacturer ;;
                *)
                        clear
                echo "Sorry, wrong selection";;
        esac
        echo -en "\n\n\t\t\tHit any key to continue"
        read -n 1 line
done
clear
