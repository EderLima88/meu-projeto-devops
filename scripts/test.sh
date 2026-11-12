#!/bin/bash
set -e
echo "[TEST] Verificando a aplicacao..."
if [ ! -f ~/meu-projeto-devops/app/index.html ]; then
    echo "[TEST] FALHOU - conteudo esperado NAO  encontrado."
    exit 1
fi
