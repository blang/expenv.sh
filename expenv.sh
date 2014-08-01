#!/bin/sh

while getopts ":if:" opt; do
  case $opt in
    f)
      useFile=$OPTARG
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
    i)
      inPlace=true
      ;;
  esac
done

if [ -n "$inPlace" ] && [ -z "$useFile" ]; then
 echo "Error: Option -i depends on option -f" >&2
fi

if [ -n "$inPlace" ]; then 
  tmpFile=`mktemp`
fi

# Eval each line and redirect to tmpFile if set, otherwise to process stdout
while read -r line; do
  eval "echo $line" >> "${tmpFile:-/proc/${$}/fd/1}"
done < "${useFile:-/proc/${$}/fd/0}"

# Overwrite file
if [ -n "$inPlace" ]; then 
  mv -- $tmpFile $useFile
fi
