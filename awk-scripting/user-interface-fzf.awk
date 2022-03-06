#!/usr/bin/awk -f

function fzf_opt_menu(options) {
  interface_choices = "printf '" # create command
  for (i in options) {
    gsub(/'/, " QUOTE ", options[i]) # never let options list escape
    interface_choices = interface_choices i "\\" options[i] "\n"
  }
  interface_choices = interface_choices "' | fzf --with-nth=2 -d '\\'"
  interface_choices | getline choice # run command
  close(interface_choices) # close to "prevent wrong output"
  split(choice, arr, "\\")
  return arr[1]
}

BEGIN {
  options["active"] = "ACTIVE MODE"
  options["passive"] = "PASSIVE MODE"
  options["quotes"] = "TEST QUOTES'\";id MODE"
  options["quotes2"] = "TEST QUOTES\"';id MODE"
  result = fzf_opt_menu(options)

  switch (result) {
    case "active":
      print "active option here"
      break
    case "passive":
      print "passive option here"
      break
  }
}
