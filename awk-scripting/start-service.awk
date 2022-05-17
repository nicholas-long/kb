#!/usr/bin/awk -f

#systemctl list-unit-files | fzf | awk '{print $1}' | xargs sudo systemctl status | ../awk-scripting/start-service.awk
#systemctl list-unit-files
#| fzf
#| awk '{print $1}'
#| xargs sudo systemctl status
#| ../awk-scripting/start-service.awk

/Active/ {
  active=$2
}
/Loaded/ {
  gsub(/.*\(/, "")
  gsub(/;.*$/, "")
  gsub(/.*\//, "")
  name=$1
}
/CGroup/ {
  name=$2
  gsub(/.*\//, "", name)
}
END {
  print "Parse: "
  print name
  print active
  if (active == "active") {
    command = "sudo systemctl stop " name
  } else {
    command = "sudo systemctl start " name
  }
  print command
  system(command)
}
