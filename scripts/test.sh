#!/bin/bash
set -e
echo "[TEST] Verificando a aplicacao..."
if grep -q "Bootcamp DevOps" ~/meu-projeto-devops/app/index.html; then
	echo "[TESTE] OK - conteudo encontrado."
else
    echo "[TEST] FALHOU - conteudo esperado NAO  encontrado."
    exit 1
fi
