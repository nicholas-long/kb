# use awk to print only unique lines as a stream processor
awk '!seen[$0]++ { print }'
