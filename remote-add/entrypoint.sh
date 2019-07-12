#!/bin/sh -l


eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"


i=1
old_ifs=$IFS
IFS=,
for r in $CONAN_REMOTES; do
  name=$(echo "$r" | cut -d@ -f 1)
  : ${name:=env_remote_$i}
  i=$(($i+1))

  verify=$(echo "$r" | cut -d@ -f 2)
  : ${verify:=True}
  if [ "$verify" = True ]; then
    verify=verify_ssl
  else
    verify=
  fi

  uri=$(echo "$r" | cut -d@ -f 3)
  : ${uri=$r}

  conan remote add "$name" "$uri" "$verify"
done
IFS=$old_ifs
