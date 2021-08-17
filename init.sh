#! /bin/bash

usage() {
  cat << TEXT
*******************************************************************************************
This makes rails environment on docker.
versions:
  ruby: 2.6.3
  bundler: 2.2.0

you can try run codes fetched from hosting services for git.
*******************************************************************************************

USEGE: $ bash init.sh <git-repogitory-url> <branch-name>

hint: ssh and https are both available for git repogitory url.
hint: branch name isn't essential, running on main.
TEXT

 exit 1
}

srcExist() {
  cat << TEXT
SrcExistError: directory named Src existing in this repogitory now is invalid using this script.

Local:                Docker:
******************    ******************
*                *    *                *
*                *    *                *
*     ./Src      * => *    var/src     *
*                *    *                *
*                *    *                *
******************    ******************

cause: directory fetchd from hosting services for git should be renamed to Src.
if you wanna try codes in Src now, run following command next time.
Now, this scripts will done these :)

          $ make restart

TEXT

  make restart && make app
  exit 0
}

inValidError() {
  if [ -z $2 ]; then
    cat << TEXT
InvalidError: git repository $1 does not exist
TEXT
  else
    cat << TEXT
InvalidError: git repository $1 or branch $2 does not exist
TEXT
  fi

 exit 1
}

run() {
  if [ -z $2 ]; then
    (
      git clone $1 Src > /dev/null 2>&1 || inValidError $1
    )
  else
    (
      git clone $1 -b $2 Src > /dev/null 2>&1 || inValidError $@
    )
  fi
}

[ -d ./Src ] && srcExist

([ -z $1 ] || [ ! -z $3 ]) && usage
([ $1 == "--help" ] || [ $1 == "-h" ]) && usage

run $@ && \
make restart && \
make app
