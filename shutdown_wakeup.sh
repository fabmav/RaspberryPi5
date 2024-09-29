#!/usr/bin/bash

#first you need to set the following parameters to the bootloader : 
# sudo -E rpi-eeprom-config --edit
# add the two following lines : 
# POWER_OFF_ON_HALT=1
# WAKE_ON_GPIO=0
# source : https://www.raspberrypi.com/documentation/computers/raspberry-pi.html#real-time-clock-rtc


#erase current value of wakealarm :
echo 0 | sudo tee /sys/class/rtc/rtc0/wakealarm;

#define for instance next Friday 7:50 am : 
#the date needs to be in Unix Timestamp format with +%s 

NEW_DATE=$(date -d "next friday 7:50" +%s);

#more details on possible input : 
#https://www.gnu.org/software/coreutils/manual/html_node/Date-input-formats.html

#put the variable in the wakealarm :
echo $NEW_DATE | sudo tee /sys/class/rtc/rtc0/wakealarm;