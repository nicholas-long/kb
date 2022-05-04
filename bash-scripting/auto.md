# bash scripting

## use awk to print only unique lines as a stream processor
```bash
#!/bin/bash

# use awk to print only unique lines as a stream processor
function unique_lines {
  awk '!seen[$0] {print} {++seen[$0]}'
}

```

## find alphanumeric base64 using awk script
```bash
#!/bin/bash
# find alphanumeric base64 using awk script
echo "$1" | ~/kb/awk-scripting/space-invader.awk | while read line; do
  echo -n "$line" | base64 -w0
  echo ""
done | grep '^[A-Za-z0-9]*$'
```

## get bash lines from kb snippets
```bash
#!/bin/bash

# get bash lines from kb snippets
grep -A 1 -h -R '^```bash' . | grep -v '^```\|^--'
```

## get random hex unique ID bash
```bash
#!/bin/bash
# get random hex unique ID bash
cat /dev/urandom | head -c 6 | xxd -p
```

## get headings from wikipedia page
```bash
#!/bin/bash

# get headings from wikipedia page
curl https://en.wikipedia.org/wiki/Block_cipher | html2text | grep '^*'
```

## get words from file
```bash
#!/bin/bash
# get words from file
while read line; do
  for word in $line; do
    echo $word
  done
done
```

## clone repo into temp dir
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

## get all tags and start walking their commits
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

## take only unique git hashes and do md5 hashes of those files
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

## define bash array
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

## loop over bash array
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

## parse args with case statement
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

## exit if parameter is missing
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

## lookup unique hosts with shodan api
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

