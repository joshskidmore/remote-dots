#!/usr/bin/env bash

ANSI_HEADER_OPTS="--newline --bold --bg-white-intense --black-intense"


get_network() {
  ansi $ANSI_HEADER_OPTS " local network "

  local dr=$(ip route get 1 | head -1)
  local dr_ip=$(echo $dr | awk '{ print $3 }')
  local dr_interface=$(echo $dr | awk '{ print $5 }')

  ip addr | awk p'
  /^[0-9]+:/ {
    sub(/:/,"",$2); iface=$2 }
  /^[[:space:]]*inet / {
    split($2, a, "/")
    print iface": "a[1]
  }' | grep -v lo

  echo -e "--> ${dr_ip} (${dr_interface})\n"
}


get_wireless() {
  local iwconfig=/sbin/iwconfig
  local interface=$(${iwconfig} 2> /dev/null  | grep ESSID | awk '{ print $1 }')

  if [ -n "$interface" ]; then
    ansi $ANSI_HEADER_OPTS " wireless "

    local essid=$(${iwconfig}  ${interface} | awk -F '"' '/ESSID/ { print $2 }')
    local strength=$(${iwconfig} ${interface} | awk -F '=' '/Quality/ { print $2 }' | cut -d ' ' -f 1)
    local bitrate=$(${iwconfig} ${interface} | awk -F '=' '/Bit Rate/ { print $2 }' | cut -d ' ' -f 1)

    echo -e "$(ansi --bold $essid) | $strength | $bitrate Mb/s\n"
  fi
}


get_geoip() {
  local ip_data=$(curl -s --connect-timeout 0.65 http://pry.sh?josh-cli)
  local parsed=$(echo "$ip_data" | JSON.sh -l)

  extract() {
    local q=$1
    echo "$parsed" | grep "$q" | awk -F '\t' '{ print $2 }' | sed -e 's/"//g'
  }

  if [ ! -z "$ip_data" ]; then
    ansi $ANSI_HEADER_OPTS " remote network "

    local hostname=$(extract hostnames)
    local region=$(extract region)

    ([ -n "$region" ]) && region=", ${region}"
    ([ -n "$hostname" ]) && hostname="/ ${hostname}"

    echo -e "$(ansi --green --bold $(extract 'ipv4\"]')) $hostname  ($(extract organization))"
    echo -e "$(extract city)${region} $(extract postalCode) ($(extract country))\n"
  fi
}


([ -z "$(command -v ansi)" ]) && exit

get_network
([ -x "/sbin/iwconfig" ]) && get_wireless
([ -n "$(command -v JSON.sh)" ] && [ -n "$(command -v curl)" ]) && get_geoip
