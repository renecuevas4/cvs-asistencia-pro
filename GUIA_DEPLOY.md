# 🚀 Guía de Deploy - CVS Asistencia PRO

## Paso 1: GitHub

### Crear repositorio
1. Ve a [github.com/new](https://github.com/new)
2. Nombre: `cvs-asistencia-pro`
3. Público o Privado
4. Click **Create repository**

### Subir archivos
```bash
git init
git add .
git commit -m "CVS Asistencia PRO v3.0"
git branch -M main
git remote add origin https://github.com/TU-USUARIO/cvs-asistencia-pro.git
git push -u origin main
```

**O más fácil:** En GitHub, click "uploading an existing file" y arrastra todos los archivos.

### Activar GitHub Pages
1. Settings → Pages
2. Source: **Deploy from a branch**
3. Branch: `main` / `/ (root)`
4. Click **Save**
5. Espera 1-2 minutos
6. Tu app estará en: `https://TU-USUARIO.github.io/cvs-asistencia-pro/`

---

## Paso 2: Supabase

### Crear proyecto
1. Ve a [supabase.com](https://supabase.com)
2. Click **New Project**
3. Nombre: `cvs-asistencia`
4. Password: (anota esto)
5. Región: South America (São Paulo)

### Ejecutar SQL
1. En Supabase, ve a **SQL Editor**
2. Click **New Query**
3. Copia todo el contenido de `supabase_setup.sql`
4. Click **Run**
5. Debe decir "Success"

### Obtener credenciales
1. Ve a **Settings** → **API**
2. Copia:
   - **Project URL**: `https://xxxx.supabase.co`
   - **anon public key**: `eyJ...`

### Actualizar la app
En `index.html`, busca la sección `CONFIG` y actualiza:
```javascript
SUPABASE: {
    URL: 'TU_PROJECT_URL',
    KEY: 'TU_ANON_KEY'
}
```

---

## Paso 3: Probar

1. Abre `https://TU-USUARIO.github.io/cvs-asistencia-pro/`
2. En el celular, la cámara funcionará (HTTPS)
3. El QR dinámico funcionará
4. Los marcajes se guardarán en Supabase

---

## 🔧 Modo Producción

Para pasar a producción, en `index.html` cambia:
```javascript
MODO_PRUEBA: false  // Cambiar de true a false
```

Esto activará:
- Validación real de geocírculos
- GPS obligatorio (no simulado)
- Registro solo dentro del radio

---

## 📱 Acceso desde celular

Comparte el link de GitHub Pages con tus trabajadores.
En iPhone/Android pueden agregar la app a la pantalla de inicio.
