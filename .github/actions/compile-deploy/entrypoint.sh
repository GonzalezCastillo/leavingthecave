#!/bin/bash

host="$1"
user="$2"
export SSHPASS="$3"

cp dotfiles/latexmkrc ~/.latexmkrc
cp -r dotfiles/tex/texmf ~/texmf

latexmk --quiet ltc*.tex

sshpass -e sftp -o StrictHostKeyChecking=no $user@$host:/ <<< "put ltc*.pdf"
