{
  file=$1
  gsub(/\.\//, "", file)
  heading=$3
  print "#" heading
  print "~/kb/" file
  print "```bash"
  system("cat " file)
  print "```"
  print ""
}
