#!/usr/bin/awk -f

function fzf_file_menu(location) {
  choices = "cd " location " && fzf"
  choices | getline choice # run command
  close(choices) # close to "prevent wrong output"
  return choice
}

function fzf_opt_menu(options) {
  sep="!"
  interface_choices = "printf '" # create command
  for (i in options) {
    gsub(/'/, " QUOTE ", options[i]) # never let options list escape
    interface_choices = interface_choices i sep options[i] "\n"
  }
  interface_choices = interface_choices "' | fzf --with-nth=2 -d '" sep "'"
  interface_choices | getline choice # run command
  close(interface_choices) # close to "prevent wrong output"
  split(choice, arr, sep)
  return arr[1]
}

BEGIN {
  options["active"] = "ACTIVE MODE"
  options["passive"] = "PASSIVE MODE"
  options["file"] = "File mode"
  result = fzf_opt_menu(options)

  print "You picked " result "!"
  switch (result) {
    case "file":
      print fzf_file_menu("/")
      break
    case "active":
      print "active option here"
      break
    case "passive":
      print "passive option here"
      break
  }
}
