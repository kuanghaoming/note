#!/bin/bash
expect << EOF
spawn clone-vm7 
expect "number:"  {send "$1\r"}
expect "$" {send "exit\r"}
EOF

sudo virsh start  tedu_node$1
sleep 15
expect << EOF
spawn sudo virsh console tedu_node$1
expect "login:" {send  "root\r"}
expect "Password:" {send  "123456\r"}
exprct "#" {send "touch 1.txt\r"}
exprct "#" {send "exit\r"}
EOF
