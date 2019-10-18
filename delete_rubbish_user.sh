#!/bin/sh

function delete_rubbish_user() {
      echo Delete rubbish users ......
      echo

      userdel cuiyanliang
      userdel huangfei
      userdel gaojin
      userdel chenpeng
      userdel luolanlan
      userdel chenjie
      userdel junda
      userdel humingke
      userdel chendong
      userdel changyu

      echo
      echo Delete complete
  }

function main() {
    delete_rubbish_user
}

main
