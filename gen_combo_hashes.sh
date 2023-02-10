#!/usr/bin/bash

if [ $# -lt 1 ]; then
	echo "Error: Missing options." 1>&2
	echo "Usage: $0 <path to wordlist>" 1>&2
	exit
fi

wordlist=$1

if [ ! -f "$wordlist" ]; then
	echo "Error: Unable to open $wordlist. Does the file exist? Are permissions correct?"
	echo "Usage: $0 <path to wordlist>" 1>&2
	exit
fi

lines_a=$(shuf -n 5 $wordlist)

for line in $lines_a
do
	second=$(shuf -n 1 $wordlist)
	comboline="$line$second"
	res=$(echo -n $comboline | sha1sum | cut -f 1 -d " ")
	echo "Generating '$res' for '$comboline'" 1>&2
	echo $res
done

