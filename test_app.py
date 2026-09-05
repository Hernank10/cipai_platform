from fastapi import FastAPI
from fastapi.responses import HTMLResponse

app = FastAPI()

@app.get("/")
async def home():
    return HTMLResponse("""
    <html>
        <head>
            <title>C.I.P.A.I. - Prueba</title>
            <style>
                body { font-family: Arial; text-align: center; padding: 50px; }
                h1 { color: #0d6efd; }
                .container { max-width: 600px; margin: auto; }
                .success { color: green; font-size: 24px; }
            </style>
        </head>
        <body>
            <div class="container">
                <h1>🎓 C.I.P.A.I.</h1>
                <h2>Centro de Innovación Pedagógica</h2>
                <p class="success">✅ Servidor funcionando correctamente</p>
                <p>📍 Floridablanca, Santander</p>
                <p><a href="/docs">📚 Ver documentación API</a></p>
            </div>
        </body>
    </html>
    """)

@app.get("/health")
async def health():
    return {"status": "healthy", "message": "C.I.P.A.I. está funcionando"}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)
