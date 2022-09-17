BEGIN { level = 10 }
level > 1 && $2 ~ /^tun/ { iface=$2 ; level=1 }
level > 2 && $2 ~ /^wlan/ { iface=$2 ; level=2 }
level > 3 && $2 ~ /^eth/ { iface=$2 ; level=3 }
END {
  gsub(/:$/,"",iface)
  gsub(/@.*/,"",iface)
  if (level < 10) {
    print iface
  }
}
