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
