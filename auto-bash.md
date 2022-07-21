# bash scripting
## return the most recently updated ubuntu distro
~/kb/bash-scripting/get-current-ubuntu-distro.sh
```bash
#!/bin/bash

# return the most recently updated ubuntu distro
curl http://archive.ubuntu.com/ubuntu/dists/ 2>/dev/null | \
  awk 'BEGIN { FS="<td[^>]*>"; OFS="\t" } /a href/ && /folder.gif/ {print $3, $4}' | \
  sed -e 's/.*a href="//' -e 's/<[^>]*>//g' -e 's/\/".*\t/\t/' | \
  awk 'BEGIN {OFS=FS="\t"} $1 !~ /-/ { print $2, $1}' | \
  sort | \
  tail -n 1 | \
  awk 'BEGIN { FS="\t"} { print $2}'
```

## get random hex unique ID bash
~/kb/bash-scripting/get-random-unique-id.sh
```bash
#!/bin/bash
# get random hex unique ID bash
cat /dev/urandom | head -c 6 | xxd -p
```

## use awk to print only unique lines as a stream processor
~/kb/bash-scripting/awk-print-unique-lines.sh
```bash
# use awk to print only unique lines as a stream processor
awk '!seen[$0]++ { print }'
```

## run neo4j in a docker
## mount host neo4j data into docker
~/kb/linux/runneo4j.sh
```bash
#!/bin/bash

# run neo4j in a docker

docker run --rm \
    -p7474:7474 -p7687:7687 \
    --env NEO4J_AUTH=neo4j/test \
    neo4j:latest

# mount host neo4j data into docker
##    -v $HOME/neo4j/data:/data \
##    -v $HOME/neo4j/logs:/logs \
##    -v $HOME/neo4j/import:/var/lib/neo4j/import \
##    -v $HOME/neo4j/plugins:/plugins \
```

## mount shared folders on VM
~/kb/linux/mount-shared-folders-in-vm.sh
```bash
#!/bin/bash

# mount shared folders on VM
/usr/bin/vmhgfs-fuse .host:/ /home/kali/shares -o subtype=vmhgfs-fuse,allow_other

```

## define bash array
## loop over bash array
~/kb/bash-scripting/loop-array-pull-git-repositories.sh
```bash
#!/bin/bash

function updatepull {
  cd "$1" && git pull
}

# define bash array
places=(~/kb ~/pen-test-environ)

# loop over bash array
for p in ${places[@]}; do
  echo Pulling $p
  updatepull $p
done
```

## find alphanumeric base64 using awk script
~/kb/bash-scripting/find-alphanum-base64.sh
```bash
#!/bin/bash
# find alphanumeric base64 using awk script
echo "$1" | ~/kb/awk-scripting/space-invader.awk | while read line; do
  echo -n "$line" | base64 -w0
  echo ""
done | grep '^[A-Za-z0-9]*$'
```

## query nmap ports and service description definitions
~/kb/awk-scripting/nmap-ports.sh
```bash
#!/bin/bash
# query nmap ports and service description definitions

awk '
BEGIN { OFS = "\t" }
/^#/ { next }
$1 == "unknown" { next }
{
  split($2,arr,"/")
  port=arr[1]
  proto=arr[2]
  print port, proto, $1
}
' /usr/share/nmap/nmap-services
```

## print the md5 hashes of all lines in a wordlist file
~/kb/hacking/scripts/print-all-md5s.sh
```bash
#!/bin/bash

# print the md5 hashes of all lines in a wordlist file
function hashing {
  while read line; do
    echo -n "$line" | md5sum | awk "{print \$1, \"$line\"}"
  done
}
cat $1 | hashing
```

## get headings from wikipedia page
~/kb/bash-scripting/get-wikipedia-info.sh
```bash
#!/bin/bash

# get headings from wikipedia page
curl https://en.wikipedia.org/wiki/Block_cipher | html2text | grep '^*'
```

## get bash lines from kb snippets
~/kb/bash-scripting/get-bash-lines-from-kb-snippets.sh
```bash
#!/bin/bash

# get bash lines from kb snippets
grep -A 1 -h -R '^```bash' . | grep -v '^```\|^--'
```

## install sublimetext
~/kb/linux/install_sublime.sh
```bash
#!/bin/bash

# install sublimetext
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text

```

## generate common passwords
~/kb/hacking/passwords/generate-common-passwords.sh
```bash
#!/bin/bash

# generate common passwords

function awkuniq {
  awk '!seen[$0]++ {print}'
}

function years {
  year=$(date -I | cut -d '-' -f 1)
  echo $year
  for i in $(seq 1 5); do
    year=$(( $year - 1 ))
    echo $year
  done
}

function seasonyears {
  seasons="Spring Summer Autumn Fall Winter"
  lower=$(echo $seasons | tr '[:upper:]' '[:lower:]')
  seasons=$(echo "$seasons $lower")
  for y in $(years); do
    for s in $seasons; do
      echo "$s$y"
    done
  done
}

function iterations {
  awk '
  {
    print
    print $0 "!"
  }
  '
}

function passwordlists {
  cat /usr/share/wordlists/fasttrack.txt /usr/share/seclists/Passwords/Leaked-Databases/rockyou-05.txt | \
    awk '!seen[$0]++ {print}' # print unique
}

( seasonyears | iterations ; passwordlists ) | awkuniq
```

## run strings on memory dumps for every readable process
~/kb/hacking/priv-esc/strings-all-memory.sh
```bash
#!/bin/bash

# run strings on memory dumps for every readable process

#https://serverfault.com/questions/173999/dump-a-linux-processs-memory-to-file
procdump()
(
    cat /proc/$1/maps | grep "rw-p" | awk '{print $1}' | ( IFS="-"
    while read a b; do
        dd if=/proc/$1/mem bs=$( getconf PAGESIZE ) iflag=skip_bytes,count_bytes \
           skip=$(( 0x$a )) count=$(( 0x$b - 0x$a )) of="$1_mem_$a.bin"
    done )
)

tf=$(mktemp)
rm $tf
mkdir $tf
cd $tf

find /proc -type f -readable 2>/dev/null \
  | grep '/proc/[[:digit:]]\+/mem' \
  | cut -d '/' -f 3 \
  | while read proc; do
      procdump $proc 2>/dev/null
    done

for f in $(ls); do
  strings $tf/$f
done

rm -rf $tf

```

## parse args with case statement
## exit if parameter is missing
~/kb/bash-scripting/template.sh
```bash
#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# parse args with case statement
VERBOSE=0
PAGING="no"
while [[ $# -gt 0 ]]; do
  case $1 in
    -p|--paging)
      PAGING=1
      ;;
    -o|--optional)
      shift # pop arg
      OPTIONAL="$1"
      ;;
    -v|--verbose)
      VERBOSE=1
      ;;
    -h|--help)
      echo "Usage: $0 [ options ] directory"
      echo "Options:"
      cat "$0" | grep '^\s\+-.|--.*'
      exit 1
      ;;
    *)
      KB_DIR="$1"
      ;;
  esac
  shift
done

if [ $VERBOSE -ne 0 ]; then
  echo "Paging $PAGING"
  [ -n "$OPTIONAL" ] && echo "Optional param $OPTIONAL"
  echo "Positional parameter $KB_DIR"
fi

# exit if parameter is missing
[ -z "$KB_DIR" ] && echo "Missing parameter" && exit 1

exit 0
```

## watch failed ssh login attempts as a live stream
## lookup unique hosts with shodan api
~/kb/bash-scripting/watch-failed-ssh-logins-live-check-shodan.sh
```bash
#!/bin/bash

# watch failed ssh login attempts as a live stream
# lookup unique hosts with shodan api

#cat /var/log/auth.log | \
tail -f /var/log/auth.log | \
  awk 'match($0, /[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}/) {
    ip = substr($0, RSTART, RLENGTH)
    if (seen[ip]) {
      if (last != ip) print "Already saw " ip
      last = ip
    } else {
      print ip
      ip = substr($0, RSTART, RLENGTH)
      seen[ip] = 1
      system("shodan host " ip)
    }
  }
  match($0, /[Ii]nvalid user (.+)/) {
    print substr($0, RSTART, RLENGTH)
  }'
```

## search through tldr command descriptions with fzf and display file with bat
~/kb/bash-scripting/search-tldr-commands-text.sh
```bash
#!/bin/bash

# search through tldr command descriptions with fzf and display file with bat

find ~/.local/share/tldr/tldr/pages -type f -name '*.md' | \
  xargs awk 'BEGIN { OFS="\t" } /^# / { h = $2 } /^- / || /^> / { print FILENAME,FNR,h,$0 }' | \
  fzf | \
  awk -F $'\t' '{system("bat " $1) }'
```

## get top N most common ports from nmap list pass argument
~/kb/bash-scripting/nmap-get-top-ports.sh
```bash
#!/bin/bash

# get top N most common ports from nmap list pass argument

nmap -vvv --top $1 -oG - 2>/dev/null | awk '
/Ports scanned:/ {
  split($4, arr, ";")
  csv=arr[2]
  gsub(/\)/, "", csv)
  gsub(/,/, "\n", csv)
  print csv
}
' | awk '
BEGIN {
  FS="-"
  OFS="\t"
}
{ $1=$1 }
!$2 { print } # print number
$2 { # print range
  for (n = $1; n <= $2; n++) print n
}
'
```

## clone repo into temp dir
## get all tags and start walking their commits
## take only unique git hashes and do md5 hashes of those files
~/kb/bash-scripting/hash-git-repository.sh
```bash
#!/bin/bash

function walk_tree {
  tag=$2
  path=$3
  git cat-file -p $1 | \
    while read asdf tp hash file; do
      [ $tp = "tree" ] && walk_tree $hash $tag "$path/$file" # recursion
      [ $tp = "blob" ] && printf "$hash\t$tag\t$path/$file\r\n"
    done
}

function walk_commit {
  tag=$2
  git cat-file -p $1 | head -n 2 | grep tree | awk '{print $2}' | while read tree; do walk_tree $tree $tag ""; done
}

function walk_commits_tags {
  while read commit tag; do
    walk_commit $commit $tag
  done
}

# clone repo into temp dir
tf=$(mktemp)
rm $tf && mkdir $tf
git clone --mirror https://github.com/facebook/folly $tf
rm /tmp/hash_list 2>/dev/null
cd $tf

# get all tags and start walking their commits
cat packed-refs | grep refs/tags/ | walk_commits_tags > /tmp/hash_list

# take only unique git hashes and do md5 hashes of those files
cat /tmp/hash_list | awk -F "\t" '{print $1}' | sort -u | \
  while read githash; do
    echo $githash
    git cat-file -p $githash | md5sum | awk '{print $1}'
  done | paste - -

rm -rf $tf
```

## install vscode
~/kb/linux/install_vscode.sh
```bash
#!/bin/bash

# install vscode
cd ~/
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt install apt-transport-https
sudo apt update
sudo apt install code # or code-insiders
```

