#!/bin/bash
echo "=== INSTALANDO DEPENDENCIAS C.I.P.A.I. ==="

# Activar entorno virtual
if [ ! -d "venv" ]; then
    echo "Creando entorno virtual..."
    python3 -m venv venv
fi

source venv/bin/activate

# Actualizar pip
echo "Actualizando pip..."
pip install --upgrade pip

# Instalar dependencias
echo "Instalando dependencias..."
pip install fastapi==0.109.0
pip install uvicorn[standard]==0.27.0
pip install jinja2==3.1.3
pip install python-multipart==0.0.6
pip install a2wsgi==1.10.0
pip install python-jose[cryptography]==3.3.0
pip install passlib[bcrypt]==1.7.4
pip install pydantic[email]==2.5.3
pip install python-dotenv==1.2.3
pip install markupsafe==2.1.3

echo "✅ Instalación completada"
echo ""
echo "=== PAQUETES INSTALADOS ==="
pip list | grep -E "fastapi|uvicorn|jinja2|jose|passlib|pydantic"

echo ""
echo "🚀 Para ejecutar el servidor:"
echo "source venv/bin/activate && uvicorn app.main:app --reload --host 0.0.0.0 --port 8000"
