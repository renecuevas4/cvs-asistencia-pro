-- ============================================================
-- CVS ELECTRIC - SCHEMA SUPABASE
-- Control de Asistencia PRO v3.0
-- Ejecutar en Supabase SQL Editor
-- ============================================================

-- Tabla principal de marcajes
CREATE TABLE IF NOT EXISTS marcajes (
    id BIGSERIAL PRIMARY KEY,
    trabajador_rut TEXT NOT NULL,
    trabajador_nombre TEXT NOT NULL,
    sucursal_codigo TEXT NOT NULL,
    sucursal_nombre TEXT NOT NULL,
    tipo TEXT NOT NULL CHECK (tipo IN ('ENTRADA', 'SALIDA', 'INICIO_COLACION', 'FIN_COLACION')),
    timestamp_utc TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    hora TEXT NOT NULL,
    fecha TEXT NOT NULL,
    latitud DOUBLE PRECISION,
    longitud DOUBLE PRECISION,
    distancia_geocirculo INTEGER DEFAULT 0,
    dentro_geocirculo BOOLEAN DEFAULT TRUE,
    foto_verificacion BOOLEAN DEFAULT FALSE,
    metodo_verificacion TEXT DEFAULT 'GPS+PIN',
    hash_anterior TEXT,
    hash_actual TEXT NOT NULL,
    modo_prueba BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Tabla de empresas
CREATE TABLE IF NOT EXISTS empresas (
    id SERIAL PRIMARY KEY,
    rut TEXT UNIQUE NOT NULL,
    razon_social TEXT NOT NULL,
    direccion TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Tabla de trabajadores
CREATE TABLE IF NOT EXISTS trabajadores (
    id SERIAL PRIMARY KEY,
    rut TEXT UNIQUE NOT NULL,
    nombres TEXT NOT NULL,
    apellido_paterno TEXT NOT NULL,
    apellido_materno TEXT,
    cargo TEXT,
    rol TEXT DEFAULT 'TRABAJADOR' CHECK (rol IN ('TRABAJADOR', 'ADMINISTRADOR', 'INSPECTOR_DT')),
    estado TEXT DEFAULT 'ACTIVO',
    password_hash TEXT NOT NULL,
    empresa_rut TEXT REFERENCES empresas(rut),
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Tabla de auditoría
CREATE TABLE IF NOT EXISTS audit_log (
    id BIGSERIAL PRIMARY KEY,
    timestamp_utc TIMESTAMPTZ DEFAULT NOW(),
    usuario_rut TEXT,
    accion TEXT NOT NULL,
    detalle TEXT,
    ip_address TEXT,
    user_agent TEXT
);

-- Indices para performance
CREATE INDEX IF NOT EXISTS idx_marcajes_rut ON marcajes(trabajador_rut);
CREATE INDEX IF NOT EXISTS idx_marcajes_fecha ON marcajes(fecha);
CREATE INDEX IF NOT EXISTS idx_marcajes_tipo ON marcajes(tipo);
CREATE INDEX IF NOT EXISTS idx_marcajes_timestamp ON marcajes(timestamp_utc);
CREATE INDEX IF NOT EXISTS idx_audit_timestamp ON audit_log(timestamp_utc);

-- Habilitar RLS
ALTER TABLE marcajes ENABLE ROW LEVEL SECURITY;
ALTER TABLE empresas ENABLE ROW LEVEL SECURITY;
ALTER TABLE trabajadores ENABLE ROW LEVEL SECURITY;
ALTER TABLE audit_log ENABLE ROW LEVEL SECURITY;

-- Políticas públicas (para demo - en producción usar auth)
CREATE POLICY "Permitir insert marcajes" ON marcajes FOR INSERT TO anon WITH CHECK (true);
CREATE POLICY "Permitir select marcajes" ON marcajes FOR SELECT TO anon USING (true);
CREATE POLICY "Permitir insert audit" ON audit_log FOR INSERT TO anon WITH CHECK (true);
CREATE POLICY "Permitir select audit" ON audit_log FOR SELECT TO anon USING (true);
CREATE POLICY "Permitir select empresas" ON empresas FOR SELECT TO anon USING (true);
CREATE POLICY "Permitir select trabajadores" ON trabajadores FOR SELECT TO anon USING (true);

-- Datos iniciales
INSERT INTO empresas (rut, razon_social, direccion) VALUES
    ('77.123.456-7', 'CVS Electric Mobility Services SPA', 'Eusebio Lillo 1267, Rancagua')
ON CONFLICT (rut) DO NOTHING;

INSERT INTO trabajadores (rut, nombres, apellido_paterno, cargo, rol, password_hash, empresa_rut) VALUES
    ('16.019.325-5', 'René Ignacio', 'Cuevas Soto', 'Administrador General', 'ADMINISTRADOR', 'rene123', '77.123.456-7'),
    ('21.305.018-4', 'Javier Matías', 'Quintanilla Aldea', 'Técnico Eléctrico', 'TRABAJADOR', 'javier123', '77.123.456-7'),
    ('14.010.676-3', 'José Osvaldo', 'Aldea Aldea', 'Técnico Eléctrico', 'TRABAJADOR', 'jose123', '77.123.456-7'),
    ('17.507.784-7', 'Víctor Manuel', 'Campos Aguilera', 'Técnico Eléctrico', 'TRABAJADOR', 'victor123', '77.123.456-7'),
    ('11.111.111-1', 'Inspector', 'DT', 'Fiscalizador', 'INSPECTOR_DT', 'inspector', '77.123.456-7')
ON CONFLICT (rut) DO NOTHING;

-- Verificar
SELECT 'Setup completado OK' AS status, 
       (SELECT COUNT(*) FROM empresas) AS empresas,
       (SELECT COUNT(*) FROM trabajadores) AS trabajadores;
