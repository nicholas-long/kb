# autogenerate headings for source files
{
  file=$1
  gsub(/\.\//, "", file)
  heading=$3
  if (file in headings) headings[file] = headings[file] "\n"
  headings[file] = headings[file] "#" heading
}
END {
  for (file in headings) {
    print headings[file]
    print "~/kb/" file
    print "```" lang
    system("cat " file)
    print "```"
    print ""
    print "~/kb/" file
  }
}
