# bash scripting
## urlencode and base64 encode lines individually
~/kb/bash-scripting/urlencode-base64-every-line.sh
```bash
#!/bin/bash
# urlencode and base64 encode lines individually
awk ' {
  printf("%s", $0) | "base64"
  close("base64")
} ' "$1" | sed 's/=/%3D/g'
```

~/kb/bash-scripting/urlencode-base64-every-line.sh
## use awk to print only unique lines as a stream processor
~/kb/bash-scripting/awk-print-unique-lines.sh
```bash
# use awk to print only unique lines as a stream processor
awk '!seen[$0]++ { print }'
```

~/kb/bash-scripting/awk-print-unique-lines.sh
## find all git repositories in a directory
## remove git from directory name
~/kb/bash-scripting/enum-git-repos-in-directory.sh
```bash
#!/bin/bash

# find all git repositories in a directory
# remove git from directory name
find "$1" -name .git -type d | awk 'BEGIN {FS = OFS = "/" } { NF--;print }'
```

~/kb/bash-scripting/enum-git-repos-in-directory.sh
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

~/kb/bash-scripting/get-current-ubuntu-distro.sh
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

~/kb/bash-scripting/template.sh
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

~/kb/awk-scripting/nmap-ports.sh
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

~/kb/hacking/scripts/print-all-md5s.sh
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

~/kb/hacking/passwords/generate-common-passwords.sh
## colorize words from stdin with regular expressions
~/kb/bash-scripting/colorize.sh
```bash
#! /bin/bash
# colorize words from stdin with regular expressions

#cas script from https://unix.stackexchange.com/questions/46562/how-do-you-colorize-only-some-keywords-for-a-bash-script
#Requires: tempfile from debian-utils, getopt from util-linux, and supercat

SCRIPTNAME=$(basename $0)
CFGFILE=$(tempfile -p spc)

usage() {
  cat <<__EOF__
Highlight regexp patterns found on stdin or files specified on command
line with specified colours.

Usage: $SCRIPTNAME [ --colour "pattern" ...] [FILE]

Options:

        -k,--black   regexp
        -r,--red     regexp
        -g,--green   regexp
        -y,--yellow  regexp
        -b,--blue    regexp
        -m,--magenta regexp
        -c,--cyan    regexp
        -w,--white   regexp

Example:

    run-script.sh | $SCRIPTNAME --green PASS --red FAIL

__EOF__
  exit 0
}


#Format definition from the spc man page:
#1234567890123456789012345678901234567890123456789012345
#HTML Color Name      Col A N T RE / String / Characters
FMT="%-20s %3s %1s %1s %1s (%s)\n"

add_color_to_config() {
  COLOR="$1"
  PATTERN="$2"

  printf "$FMT" "$COLOR" "$COLOR" - 0 r "$PATTERN" >> "$CFGFILE"
}


#uses the "getopt" program from util-linux, which supports long
#options. The "getopts" built-in to bash does not.
TEMP=$(getopt \
       -o 'hk:r:g:y:b:m:c:w:' \
       -l 'help,black:,red:,green:,yellow:,blue:,magenta:,cyan:,white:' \
       -n "$0" -- "$@")

if [ $? != 0 ] ; then echo "Terminating..." >&2 ; exit 1 ; fi

eval set -- "$TEMP"

while true ; do
    case "$1" in
        -k|--bla*)       add_color_to_config blk "$2" ; shift 2 ;;
        -r|--red)        add_color_to_config red "$2" ; shift 2 ;;
        -g|--gre*)       add_color_to_config grn "$2" ; shift 2 ;;
        -y|--yel*)       add_color_to_config yel "$2" ; shift 2 ;;
        -b|--blu*)       add_color_to_config blu "$2" ; shift 2 ;;
        -m|--mag*)       add_color_to_config mag "$2" ; shift 2 ;;
        -c|--cya*)       add_color_to_config cya "$2" ; shift 2 ;;
        -w|--whi*)       add_color_to_config whi "$2" ; shift 2 ;;

        -h|--hel*)       usage ; exit 0 ;;

        --)         shift ; break ;;

        *)          echo 'Unknown option!' ; exit 1 ;;
    esac
done

spc -R -c "$CFGFILE" "$@"
rm -f "$CFGFILE"
```

~/kb/bash-scripting/colorize.sh
## mount shared folders on VM
~/kb/linux/mount-shared-folders-in-vm.sh
```bash
#!/bin/bash

# mount shared folders on VM
/usr/bin/vmhgfs-fuse .host:/ /home/kali/shares -o subtype=vmhgfs-fuse,allow_other

```

~/kb/linux/mount-shared-folders-in-vm.sh
## run docker image with current directory mounted as working directory
~/kb/bash-scripting/docker-current-directory.sh
```bash
#!/bin/bash
# run docker image with current directory mounted as working directory
sudo docker run --rm -it -v "$(pwd):$(pwd)" -w "$(pwd)" $1
```

~/kb/bash-scripting/docker-current-directory.sh
## get raw HTTP request data from burp saved request
~/kb/hacking/scripts/get-burp-http-saved-request.sh
```bash
#!/bin/bash
# get raw HTTP request data from burp saved request
cat $1 | go run github.com/ericchiang/xpup@latest //request | base64 -d
```

~/kb/hacking/scripts/get-burp-http-saved-request.sh
## get the current user's github colon separated credentials
~/kb/bash-scripting/get-github-credentials.sh
```bash
#!/bin/bash

# get the current user's github colon separated credentials
cat $HOME/.git-credentials | awk -F '[/@]' '/github/ {print $3}' | sed s/%40/@/g
```

~/kb/bash-scripting/get-github-credentials.sh
## parse burpsuite saved request file and convert to python requests script for copying
~/kb/hacking/scripts/copy-burp-request-as-python-script.sh
```bash
#!/bin/bash

xpup="go run github.com/ericchiang/xpup@latest"
file="$1"
http_request=$(mktemp)

# parse burpsuite saved request file and convert to python requests script for copying
cat $file | $xpup '//request' | base64 -d > $http_request
dos2unix $http_request 2>/dev/null

url=$(cat $file | $xpup //url)
ct=$(awk '/^Content-Type/ { print $2 }' $http_request)
method=$(awk 'NR == 1 { print $1 }' $http_request)
getparams=$(echo $url | ~/kb/python/get-url-params.py)
http_headers=$(awk '
  BEGIN {
    FS = ": "
    OFS = "\t"
  }
  /^Cookie/ { next }
  /^Host/ { next }
  /^Content-Length/ { next }
  /^Connection/ { next }
  /^Upgrade-Insecure-Requests/ { next }
  /^Accept/ { next }
  /^Content-Type/ { next }
  NF == 2 { $1 = $1; print }
  /^$/ { exit 0 }
  ' $http_request | ~/kb/python/tsv-to-python-dict.py
)

cookies=$(awk '
/^Cookie/ {
  gsub(/;/,"")
  for (n = 2; n <= NF; n++)
    print $n
}
' $http_request | ~/kb/python/decode-cookies.py)

#--------------------------------------------------------------------------------

cat << HEADER
import requests

url = "$url"
cookies = $cookies

## optional
getparams = $getparams
headers = $http_headers

HEADER

if [ $method == "POST" ]; then
  if [ $ct == "application/x-www-form-urlencoded" ]; then
    postdata=$(~/kb/awk-scripting/get-http-post-content.awk $http_request | ~/kb/python/decode-post-params.py)

    cat << PYTHON
postdata = $postdata
r = requests.post(url, data=postdata, headers=headers, cookies=cookies)
PYTHON
  fi
elif [ $method == "GET" ]; then
    cat << PYTHON
r = requests.get(url, params=getparams, headers=headers, cookies=cookies)
PYTHON
fi

cat << FOOTER
print(r.text)
FOOTER

rm $http_request
```

~/kb/hacking/scripts/copy-burp-request-as-python-script.sh
## pull all the git repos in home directory
~/kb/bash-scripting/pull-all-git-repos.sh
```bash
#!/bin/bash

# pull all the git repos in home directory

~/kb/bash-scripting/enum-git-repos-in-directory.sh $HOME |\
  awk -F / 'NF == 4 {print}' |\
  while read dir; do
    cd $dir
    echo "pulling $dir"
    git pull
  done
```

~/kb/bash-scripting/pull-all-git-repos.sh
## download the current CVE list get as Tab Separated Values
~/kb/hacking/cve/get-tsv.sh
```bash
#!/bin/bash

# download the current CVE list get as Tab Separated Values

zcat <( curl https://cve.mitre.org/data/downloads/allitems.csv.gz ) | \
  sed 's/\t/  /g' | \
  ~/kb/python/convert-csv-to-tsv.py | \
  awk ' # fix quote issues
    BEGIN { OFS = FS = "\t" }
    {
      for (n = 1; n <= NF; n++) {
        if ($n ~ /^ *".*" *$/) {
          gsub(/^ *"/,"",$n)
          gsub(/" *$/,"",$n)
          gsub(/""/,"\"",$n)
        }
      }
    }
    { print } '
```

~/kb/hacking/cve/get-tsv.sh
## shortcut to start tmux session in a working directory with alacritty
~/kb/linux/alacritty-run-tmux.sh
```bash
#!/bin/bash

# shortcut to start tmux session in a working directory with alacritty

cd ~/kb && /home/coyote/.cargo/bin/alacritty -e tmux
```

~/kb/linux/alacritty-run-tmux.sh
## decorate XML with colors for tags, attributes, and content
~/kb/bash-scripting/decorate-xml.sh
```bash
#!/bin/bash
# decorate XML with colors for tags, attributes, and content
~/kb/bash-scripting/colorize.sh -g '>[^<]+<' -c '\[[^]]+' -r CDATA -y '<[^>]+ [^>]*>'
```

~/kb/bash-scripting/decorate-xml.sh
## extract PDF embedded file stream for use with PDF file attach exploits like mpdf
## prepend gzip magic bytes
## extract zlib stream between PDF stream and endstream with quick and dirty awk
~/kb/hacking/tricks/extract-pdf-embedded-file-stream.sh
```bash
#!/bin/bash

# extract PDF embedded file stream for use with PDF file attach exploits like mpdf

TF=$(mktemp)

# prepend gzip magic bytes
printf "\x1f\x8b\x08\x00\x00\x00\x00\x00" > $TF

# extract zlib stream between PDF stream and endstream with quick and dirty awk
cat $1 | awk -v streamindex=$2 '
/endstream/ { pr = 0 }
i == streamindex && pr { print }
/^stream/ { pr = 1; i++ }
' >> $TF

cat $TF | gzip -d 2>/dev/null
```

~/kb/hacking/tricks/extract-pdf-embedded-file-stream.sh
## update all the git repos in home directory and prompt with lazygit
~/kb/bash-scripting/update-all-git-repos.sh
```bash
#!/bin/bash

# update all the git repos in home directory and prompt with lazygit

~/kb/bash-scripting/enum-git-repos-in-directory.sh $HOME |\
  awk -F / 'NF == 4 {print}' |\
  while read dir; do
    cd $dir
    diffcount=$(git status --porcelain | wc -l)
    [ $diffcount -ne 0 ] && lazygit
  done
```

~/kb/bash-scripting/update-all-git-repos.sh
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

~/kb/bash-scripting/find-alphanum-base64.sh
## build and run impacket docker
~/kb/hacking/dockers/impacket.sh
```bash
#!/bin/bash

# build and run impacket docker
repo="https://github.com/SecureAuthCorp/impacket"

source ~/kb/docker/build-github-repo-docker-image.sh
```

~/kb/hacking/dockers/impacket.sh
## decorate and colorize a passwd file piped from stdin
~/kb/bash-scripting/decorate-passwd-file.sh
```bash
#!/bin/bash
# decorate and colorize a passwd file piped from stdin
~/kb/bash-scripting/colorize.sh -y '^.*sh$' -c '^[^:]+' -r root -g '[^:/]+$' -b 'false|nologin'
```

~/kb/bash-scripting/decorate-passwd-file.sh
## run exiftool on all of the images within a directory
~/kb/bash-scripting/exif-all-images.sh
```bash
#!/bin/bash
# run exiftool on all of the images within a directory
{ find . -type f -name '*.png'
find . -type f -name '*.jpg'
find . -type f -name '*.jpeg'
find . -type f -name '*.gif'
} | xargs exiftool
```

~/kb/bash-scripting/exif-all-images.sh
## get the current user's github api key
~/kb/bash-scripting/get-github-api-key.sh
```bash
#!/bin/bash

# get the current user's github api key
cat $HOME/.git-credentials | awk -F '[/:@]' '/github/ {print $5}'
```

~/kb/bash-scripting/get-github-api-key.sh
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

~/kb/bash-scripting/watch-failed-ssh-logins-live-check-shodan.sh
## launch ubuntu build environment docker with current directory mounted as working directory
~/kb/bash-scripting/ubuntu-docker-build-environment.sh
```bash
#!/bin/bash
# launch ubuntu build environment docker with current directory mounted as working directory
tag=$1
if [ -z "$tag" ]; then
  export tag=$(~/kb/docker/get-tags.sh ubuntu | fzf --prompt="select tag")
fi
~/kb/docker/templates/ubuntu-dockerfile-template.sh $tag > Dockerfile 
sudo docker build . -t ubuntubuildenv
sudo docker run --rm -it -v "$(pwd):$(pwd)" -w "$(pwd)" ubuntubuildenv
```

~/kb/bash-scripting/ubuntu-docker-build-environment.sh
## clone github repository and build docker image with its name
~/kb/docker/build-github-repo-docker-image.sh
```bash
#!/bin/bash

# clone github repository and build docker image with its name
name=$(echo $repo | awk -F/ '{print $NF}')
imagename=$(echo $name | tr A-Z a-z)
echo "Building $name as $imagename"
git clone $repo
cd $name/
docker build . -t $imagename
cd -
rm -rf $name

docker run --rm $imagename --help
```

~/kb/docker/build-github-repo-docker-image.sh
## get headings from wikipedia page
~/kb/bash-scripting/get-wikipedia-info.sh
```bash
#!/bin/bash

# get headings from wikipedia page
curl https://en.wikipedia.org/wiki/Block_cipher | html2text | grep '^*'
```

~/kb/bash-scripting/get-wikipedia-info.sh
## copy and read text from PNG image URL arg print with tesseract OCR
~/kb/bash-scripting/copy-text-from-image-url.sh
```bash
#!/bin/bash
# copy and read text from PNG image URL arg print with tesseract OCR

tf=$(mktemp -d)
cd $tf
wget $1
filename=$(ls)
tesseract "$filename" output
ls
cat output.txt
cd - >/dev/null
rm -rf $tf
```

~/kb/bash-scripting/copy-text-from-image-url.sh
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

~/kb/bash-scripting/search-tldr-commands-text.sh
## generate ISO format dates wordlists for the last few years
~/kb/bash-scripting/generate-dates.sh
```bash
#!/bin/bash

# generate ISO format dates wordlists for the last few years

for d in $(seq 2000);
do
  date --date "$d days ago" '+%Y-%m-%d'
done | awk ' BEGIN { FS="-" }
{ print > "days-" $1 } '
```

~/kb/bash-scripting/generate-dates.sh
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

~/kb/bash-scripting/loop-array-pull-git-repositories.sh
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

~/kb/bash-scripting/hash-git-repository.sh
## get random hex unique ID bash
~/kb/bash-scripting/get-random-unique-id.sh
```bash
#!/bin/bash
# get random hex unique ID bash
cat /dev/urandom | head -c 6 | xxd -p
```

~/kb/bash-scripting/get-random-unique-id.sh
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

~/kb/linux/runneo4j.sh
## build and run enum4linux-ng docker
~/kb/hacking/dockers/enum4linux-ng.sh
```bash
#!/bin/bash

# build and run enum4linux-ng docker
repo="https://github.com/cddmp/enum4linux-ng"

source ~/kb/docker/build-github-repo-docker-image.sh
```

~/kb/hacking/dockers/enum4linux-ng.sh
## find the largest N files
## get argument value or default
~/kb/bash-scripting/find-largest-files.sh
```bash
#!/bin/bash
# find the largest N files
# get argument value or default
find . -type f -ls 2>/dev/null |\
  awk '{print $7, $0}' |\
  sort -nr |\
  head -n ${1:-10} # default 10
```

~/kb/bash-scripting/find-largest-files.sh
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

~/kb/hacking/priv-esc/strings-all-memory.sh
## build and run CrackMapExec docker
~/kb/hacking/dockers/crackmapexec.sh
```bash
#!/bin/bash

# build and run CrackMapExec docker
repo="https://github.com/Porchetta-Industries/CrackMapExec"

source ~/kb/docker/build-github-repo-docker-image.sh
```

~/kb/hacking/dockers/crackmapexec.sh
## sort words by length
~/kb/bash-scripting/sort-words-by-length.sh
```bash
#!/bin/bash

# sort words by length
awk '{print length(), $0}' filters.lst | sort -n | awk '{print $2}'
```

~/kb/bash-scripting/sort-words-by-length.sh
## convert string to hex with no newlines
~/kb/bash-scripting/string-to-hex.sh
```bash
#!/bin/bash

# convert string to hex with no newlines
xxd -p -c 9999999999999
```

~/kb/bash-scripting/string-to-hex.sh
## get the date of the last commit to modify a file as epoch timestamp and iso date
~/kb/bash-scripting/git-file-modification-date.sh
```bash
#!/bin/bash
# get the date of the last commit to modify a file as epoch timestamp and iso date
while [[ $# -gt 0 ]]; do
  export filename=$1
  git log --date=unix -- "$1" | awk '
  BEGIN { OFS = "\t" }
  /^Date/ {
    epoch = $2
    "date --date @" epoch " --iso" | getline isodate
    print epoch, isodate, ENVIRON["filename"]
    exit 0
  }'
  shift
done
```

~/kb/bash-scripting/git-file-modification-date.sh
## get library dependency versions from composer.lock json file
~/kb/hacking/tricks/get-versions-from-composer-lock-json.sh
```bash
#!/bin/bash

# get library dependency versions from composer.lock json file
cat composer.lock | jq -r '.packages[] | .name,.version' | paste - -
```

~/kb/hacking/tricks/get-versions-from-composer-lock-json.sh
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

~/kb/linux/install_sublime.sh
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

~/kb/bash-scripting/nmap-get-top-ports.sh
## list public github repositories for user
~/kb/bash-scripting/list-github-repos.sh
```bash
#!/bin/bash

u="$1"
if [ -z "$u" ]; then
  u="nicholas-long"
fi

# list public github repositories for user
curl "https://api.github.com/users/$u/repos?visibility=private" | jq -r '.[].html_url'
```

~/kb/bash-scripting/list-github-repos.sh
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

~/kb/linux/install_vscode.sh
## urlencode a line of text from stdin
~/kb/bash-scripting/urlencode.sh
```bash
#!/bin/bash

# urlencode a line of text from stdin

python3 -c 'from urllib.parse import quote;print(quote(input()))'
```

~/kb/bash-scripting/urlencode.sh
## get bash lines from kb snippets
~/kb/bash-scripting/get-bash-lines-from-kb-snippets.sh
```bash
#!/bin/bash

# get bash lines from kb snippets
grep -A 1 -h -R '^```bash' . | grep -v '^```\|^--'
```

~/kb/bash-scripting/get-bash-lines-from-kb-snippets.sh
