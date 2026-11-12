#!/bin/bash

if [ ! -d  "/home/eder-devops/meu-projeto-devops/criador/rascunho-$(date +%d-%m)" ]; then
echo "Este diretorio não existe. Será criado"
mkdir /home/eder-devops/meu-projeto-devops/criador/rascunho-$(date +%d-%m)
else
echo "Este disretório já existe com a data de hoje"
fi


figlet BOA NOITE
