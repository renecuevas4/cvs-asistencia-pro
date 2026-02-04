# ⚡ CVS Electric - Control de Asistencia PRO v3.0

![CVS Electric](https://img.shields.io/badge/CVS-Electric%20Mobility-0066FF?style=for-the-badge)
![Version](https://img.shields.io/badge/Version-3.0.0%20PRO-10B981?style=for-the-badge)
![DT Chile](https://img.shields.io/badge/Cumple-Res.%201140%2F2021%20DT-34C759?style=for-the-badge)

Sistema profesional de control de asistencia laboral que cumple con la **Resolución Exenta N° 1140/2021** de la Dirección del Trabajo de Chile.

## 🚀 Características

- ✅ **Identificación inequívoca** — RUT + PIN + GPS + Verificación Facial
- ✅ **Registro inalterable** — Hash SHA-256 encadenado
- ✅ **Geolocalización** — Geocírculos con fórmula Haversine
- ✅ **QR Dinámico** — Código anti-fraude que cambia cada 30 segundos
- ✅ **4 tipos de marcaje** — Entrada, Salida, Inicio/Fin Colación
- ✅ **3 vistas** — Trabajador, Administrador, Inspector DT
- ✅ **Exportación** — Excel (.xlsx) y PDF profesional con logo
- ✅ **Log de Auditoría** — Registro completo de operaciones
- ✅ **Verificación de Integridad** — Validación de cadena de hash
- ✅ **Modo Claro/Oscuro** — Toggle de tema
- ✅ **Progressive Web App** — Funciona offline

## 📋 Requisitos DT Cumplidos

| Requisito | Estado | Implementación |
|-----------|--------|---------------|
| Identificación inequívoca | ✅ | RUT + PIN + GPS + Selfie |
| Registro automático hora | ✅ | Timestamp UTC |
| Registro inalterable | ✅ | SHA-256 encadenado |
| Historial auditoría | ✅ | Log completo |
| Respaldo información | ✅ | LocalStorage + Supabase |
| Acceso trabajador | ✅ | App web/móvil |
| Geolocalización | ✅ | GPS + geocírculos |
| Exportación inmediata | ✅ | Excel/PDF |

## 🔐 Credenciales Demo

| Rol | RUT | Contraseña |
|-----|-----|------------|
| Trabajador | 12.345.678-9 | 1234 |
| Administrador | 98.765.432-1 | admin |
| Inspector DT | 11.111.111-1 | inspector |

## 🛠️ Instalación

### GitHub Pages (Recomendado)

1. Fork este repositorio
2. Ve a Settings → Pages
3. Selecciona branch `main`, folder `/ (root)`
4. Tu app estará en `https://tu-usuario.github.io/cvs-asistencia-pro/`

### Local

```bash
git clone https://github.com/tu-usuario/cvs-asistencia-pro.git
cd cvs-asistencia-pro
# Abrir index.html en el navegador
```

## 🏗️ Tecnologías

- HTML5 / CSS3 / JavaScript (Vanilla)
- SHA-256 (Web Crypto API)
- QRCode.js
- jsPDF + AutoTable
- SheetJS (XLSX)
- Geolocation API
- MediaDevices API (Cámara)

## 📄 Licencia

Desarrollado para **CVS Electric Mobility Services SPA** — Todos los derechos reservados.

---

*Sistema desarrollado cumpliendo la Resolución Exenta N° 1140/2021 de la Dirección del Trabajo de Chile.*
