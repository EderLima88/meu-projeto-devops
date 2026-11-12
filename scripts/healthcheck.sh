#!/bin/bash
# healthcheck.sh - verifica a saude basica da maquina
#set -e interrompe o script ao encontra erro
set -e
echo "=== Health Check - $(hostname) - $(date '+%d/%m/%Y %H:%M') ==="

# 1) Internet: o ping respondeu?
if ping -c 1 ubuntu.com > /dev/null 2>&1; then
    echo "[OK] Internet"
else
    echo "[FALHA] Internet"
fi

# 2) Disco: acima de 80% de uso, alerta
USO_DISCO=$(df / --output=pcent | tail -1 | tr -d ' %')
if [ "$USO_DISCO" -lt 80 ]; then
    echo "[OK] Disco: ${USO_DISCO}% usado"
else
    echo "[FALHA] Disco: ${USO_DISCO}% usado (acima de 80%!)"
fi

# 3) Teste da quantidade de memoria disponivel
if [ "$USO_DISCO" -lt 80 ]; then
echo "[OK] Memoria Disponivel $(free -m | grep Mem | awk '{print $7}')MB"
fi

# 4) Contegem de processos
echo "[ INFO ] O numero de processos atual: $(ps aux | wc -l)"

SITE="$1"
if [ "$1" != "" ]; then
echo "$(ping -c 1 $SITE)"
else
echo "[ ALERT ] Nenhum parametro url para analisar ping (Adicone apos a chamada do pipeline.sh)"
fi

#echo "$(ping -c 1 $1)"

echo "=== Fim do health check ==="
