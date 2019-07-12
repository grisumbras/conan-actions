#!/bin/sh -l


set -e
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"


i=1
old_ifs=$IFS
IFS=,
for r in $CONAN_REMOTES; do
  name=$(echo "$r" | cut -s -d@ -f 1)
  : ${name:=env_remote_$i}
  i=$(($i+1))

  verify=$(echo "$r" | cut -s -d@ -f 2)
  : ${verify:=True}

  uri=$(echo "$r" | cut -s -d@ -f 3)
  : ${uri:=$r}

  echo adding remote $name "($uri; verify=$verify)"
  conan remote add "$name" "$uri" "$verify"
done
IFS=$old_ifs
