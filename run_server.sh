#!/bin/bash
echo "=== INICIANDO C.I.P.A.I. LMS ==="

# Activar entorno virtual
source venv/bin/activate

# Verificar dependencias
echo "Verificando dependencias..."
python -c "import jinja2" 2>/dev/null || {
    echo "❌ Jinja2 no encontrado, instalando..."
    pip install jinja2
}

python -c "import fastapi" 2>/dev/null || {
    echo "❌ FastAPI no encontrado, instalando..."
    pip install fastapi uvicorn[standard]
}

# Limpiar caché
find . -type d -name "__pycache__" -exec rm -rf {} + 2>/dev/null

echo "🚀 Iniciando servidor..."
uvicorn app.main:app --reload --host 0.0.0.0 --port 8000
