#!/usr/bin/bash

for i in {1..5}
do
  line=$(cat /dev/urandom | tr -dc '[:alpha:]' | fold -w ${1:-5} | head -n 1)
  res=$(echo -n $line | sha1sum | cut -f 1 -d " ")
  echo "Generating '$res' from '$line'." 1>&2
  echo $res
 done

