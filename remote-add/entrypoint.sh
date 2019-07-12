#!/bin/sh -l


eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"


echo remotes=$remotes

conan remote list

i=1
old_ifs=$IFS
IFS=,
for r in $remotes; do
  name=$(echo "$r" | cut -d@ -f 1)
  : ${name:=env_remote_$i}
  i=$(($i+1))

  verify=$(echo "$r" | cut -d@ -f 2)
  : ${verify:=True}

  uri=$(echo "$r" | cut -d@ -f 3)
  : ${uri=$r}

  echo adding remote $name "($uri)"
  conan remote add "$name" "$uri" "$verify"
done
IFS=$old_ifs
