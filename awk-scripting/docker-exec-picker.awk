#!/usr/bin/awk -f

function fzf_docker_menu(options) {
  interface_choices = "docker ps | fzf | awk '{print $1}'"
  interface_choices | getline choice # run command
  close(interface_choices) # close to "prevent wrong output"
  split(choice, arr, "\t")
  return arr[1]
}

function fzf_opt_menu(options) {
  interface_choices = "printf '" # create command
  for (i in options) {
    gsub(/'/, " QUOTE ", options[i]) # never let options list escape
    interface_choices = interface_choices i "!" options[i] "\n"
  }
  interface_choices = interface_choices "' | fzf --with-nth=2 -d '!'"
  interface_choices | getline choice # run command
  close(interface_choices) # close to "prevent wrong output"
  split(choice, arr, "!")
  return arr[1]
}

BEGIN {
  container = fzf_docker_menu(options)

  options["exec"] = "exec into the docker"
  options["rmf"] = "kill with extreme prejudice"
  result = fzf_opt_menu(options)

  switch (result) {

    case "exec":
      system("docker exec -it " container " sh")
      break

    case "rmf":
      system("docker rm -f " container)
      break

  }
}
