-- =============================================================================
-- SCRIPT DE POBLACIÓN Y ACTUALIZACIONES (12 TABLAS)
-- Ejecutar después de 01_tablas.sql en PostgreSQL
-- =============================================================================


-- =============================================================================
-- 1. MÓDULO SUCURSAL
-- Registro base de 5 sucursales y actualizaciones de dirección y teléfonos.
START TRANSACTION;

INSERT INTO sucursal (nombre, direccion, ciudad, telefono)
VALUES
('Sucursal Central', 'Av. Ejército 420', 'Arequipa', '054-251010'),
('Sucursal Aeropuerto', 'Av. Aviación km 5', 'Arequipa', '054-252020'),
('Sucursal Yanahuara', 'Calle Misti 115', 'Arequipa', '054-253030'),
('Sucursal Miraflores', 'Av. Pardo 810', 'Lima', '01-4451234'),
('Sucursal Cusco Centro', 'Av. El Sol 504', 'Cusco', '084-224466');

-- Actualización de datos de contacto y sedes
UPDATE sucursal
SET telefono = '054-251999'
WHERE sucursal_id = 1;

UPDATE sucursal
SET direccion = 'Av. Aviación km 5.5, Terminal Aéreo'
WHERE sucursal_id = 2;

UPDATE sucursal
SET nombre = 'Sucursal Yanahuara Plaza'
WHERE sucursal_id = 3;

UPDATE sucursal
SET telefono = '01-4459876'
WHERE sucursal_id = 4;

UPDATE sucursal
SET direccion = 'Av. El Sol 510, Int. 2'
WHERE sucursal_id = 5;

COMMIT; -- Confirmación atómica: registro y actualización de sucursales


-- =============================================================================
-- 2. MÓDULO CATEGORIA
-- Registro de 5 categorías de vehículos y ajustes de tarifas diarias.
START TRANSACTION;

INSERT INTO categoria (nombre, descripcion, tarifa_diaria)
VALUES
('Sedán', 'Auto cómodo para ciudad y viajes cortos', 120.00),
('Hatchback', 'Auto compacto y económico en combustible', 95.00),
('SUV', 'Vehículo espacioso ideal para familia y carretera', 210.00),
('Pickup', 'Camioneta 4x4 para carga y terrenos difíciles', 260.00),
('Minivan', 'Vehículo amplio para grupos de hasta 7 pasajeros', 230.00);

-- Actualización de tarifas y descripciones
UPDATE categoria
SET tarifa_diaria = 125.00
WHERE categoria_id = 1;

UPDATE categoria
SET tarifa_diaria = 99.00
WHERE categoria_id = 2;

UPDATE categoria
SET descripcion = 'SUV moderna equipada para familia y viajes largos'
WHERE categoria_id = 3;

UPDATE categoria
SET tarifa_diaria = 275.00
WHERE categoria_id = 4;

UPDATE categoria
SET descripcion = 'Vehículo familiar de gran capacidad con maletera amplia'
WHERE categoria_id = 5;

COMMIT; -- Confirmación atómica: catálogo y tarifas de categorías


-- =============================================================================
-- 3. MÓDULO CLIENTE
-- Registro base de 5 clientes y actualizaciones de datos de contacto y dirección.
START TRANSACTION;

INSERT INTO cliente
(dni, nombre, apellido, telefono, correo, licencia, direccion, fecha_registro)
VALUES
('59945620', 'Tulio', 'Perez', '991234567', 'tulio.perez@gmail.com', 'LIC001', 'Arequipa', '2025-01-15'),
('69645328', 'Luis', 'Quispe', '987654321', 'luis.quispe@gmail.com', 'LIC010', 'Cayma', '2025-01-20'),
('49975626', 'Sergio', 'Lopez', '976543210', 'sergio.lopez@gmail.com', 'LIC003', 'Paucarpata', '2025-02-01'),
('74145223', 'Pablo', 'Torres', '965432109', 'pablo.torres@gmail.com', 'LIC007', 'Hunter', '2025-02-10'),
('90441524', 'Juan', 'Flores', '954321098', 'juan.flores@gmail.com', 'LIC020', 'Arequipa', '2025-02-18');

-- Actualización de dirección, teléfono, apellido y licencia de clientes
UPDATE cliente
SET direccion = 'Miraflores'
WHERE dni = '49975626';

UPDATE cliente
SET telefono = '938294067'
WHERE dni = '59945620';

UPDATE cliente
SET apellido = 'Quispe Mamani'
WHERE licencia = 'LIC010';

UPDATE cliente
SET direccion = 'Sachaca'
WHERE direccion = 'Hunter';

UPDATE cliente
SET licencia = 'LIC015'
WHERE dni = '90441524';

COMMIT; -- Confirmación atómica: inserción y updates de la tabla cliente


-- =============================================================================
-- 4. MÓDULO SEGURO
-- Registro de 5 planes de seguro y ajustes de cobertura y costo diario.
START TRANSACTION;

INSERT INTO seguro (nombre, cobertura, costo_diario)
VALUES
('Seguro Básico', 'Cobertura obligatoria ante daños a terceros', 15.00),
('Seguro Todo Riesgo', 'Daños propios, colisiones y asistencia vial 24h', 45.00),
('Seguro Contra Robo', 'Protección ante robo parcial o total del vehículo', 30.00),
('Seguro de Lunas y Llantas', 'Reposición de parabrisas, lunas y neumáticos', 20.00),
('Seguro Premium Plus', 'Cobertura total sin franquicia y auto de reemplazo', 65.00);

-- Actualización de costos diarios y coberturas
UPDATE seguro
SET costo_diario = 18.00
WHERE seguro_id = 1;

UPDATE seguro
SET costo_diario = 48.00
WHERE seguro_id = 2;

UPDATE seguro
SET cobertura = 'Robo parcial, robo total y cobertura por vandalismo'
WHERE seguro_id = 3;

UPDATE seguro
SET costo_diario = 22.50
WHERE seguro_id = 4;

UPDATE seguro
SET costo_diario = 70.00
WHERE seguro_id = 5;

COMMIT; -- Confirmación atómica: catálogo de seguros vehiculares


-- =============================================================================
-- 5. MÓDULO VENDEDOR
-- Registro de 5 vendedores (primero supervisores) y actualizaciones laborales.
START TRANSACTION;

INSERT INTO vendedor
(dni, nombre, apellido, salario, bono, fecha_registro, correo, supervisor_dni, sucursal_id)
VALUES
('87654321', 'Carlos', 'Ramos', 1800.50, 200.20, '2025-01-10', 'carlos1@gmail.com', NULL, 1),
('76543218', 'Rosa', 'Diaz', 2000.00, 250.00, '2025-02-15', 'rosa2@gmail.com', '87654321', 1),
('65432187', 'Miguel', 'Soto', 1900.50, 100.20, '2025-03-20', 'miguel3@gmail.com', '87654321', 2),
('54321876', 'Elena', 'Vargas', 2100.00, 300.20, '2025-04-05', 'elena4@gmail.com', NULL, 3),
('43218765', 'Jorge', 'Castro', 1850.50, 180.20, '2025-05-12', 'jorge5@gmail.com', NULL, 4);

-- Actualización de datos laborales y jerarquía
UPDATE vendedor
SET apellido = 'Rodriguez'
WHERE dni = '87654321';

UPDATE vendedor
SET salario = 1800.00
WHERE dni = '76543218';

UPDATE vendedor
SET correo = 'miguel@gmail.com'
WHERE dni = '65432187';

UPDATE vendedor
SET supervisor_dni = '87654321'
WHERE dni = '54321876';

UPDATE vendedor
SET fecha_registro = '2025-05-21'
WHERE dni = '43218765';

COMMIT; -- Confirmación atómica: gestión de datos del módulo vendedor


-- =============================================================================
-- 6. MÓDULO CARRO
-- Alta de 5 vehículos y actualizaciones de estado, color y capacidad.
START TRANSACTION;

INSERT INTO carro
(placa, marca, modelo, estado, color, anio, capacidad, kilometraje, categoria_id, sucursal_id)
VALUES
('ABC123', 'Toyota', 'Corolla', 'disponible', 'Blanco', 2022, 5, 15000, 1, 1),
('DEF456', 'Hyundai', 'Accent', 'disponible', 'Negro', 2021, 5, 22000, 1, 1),
('GHI789', 'Kia', 'Rio', 'disponible', 'Rojo', 2023, 5, 12000, 2, 2),
('JKL321', 'Nissan', 'Versa', 'disponible', 'Gris', 2022, 5, 18500, 1, 3),
('MNO654', 'Chevrolet', 'Tracker', 'disponible', 'Azul', 2024, 5, 5400, 3, 4);

-- Actualizaciones en la información del vehículo
UPDATE carro
SET color = 'Plata'
WHERE placa = 'ABC123';

UPDATE carro
SET estado = 'mantenimiento'
WHERE placa = 'DEF456';

UPDATE carro
SET color = 'Negro Metalizado'
WHERE placa = 'JKL321';

UPDATE carro
SET estado = 'alquilado'
WHERE placa = 'JKL321';

UPDATE carro
SET capacidad = 7
WHERE placa = 'MNO654';

COMMIT; -- Confirmación atómica: mantenimiento del inventario vehicular


-- =============================================================================
-- 7. MÓDULO SOLICITUD
-- Registro de 5 solicitudes (conectadas con clientes, vendedores y autos válidos).
START TRANSACTION;

INSERT INTO solicitud
(tiempo_alquiler, precio_total, estado, fecha_solicitud, fecha_inicio, fecha_fin, cliente_dni, placa, vendedor_dni)
VALUES
(3, 350.00, 'pendiente',  '2025-03-05', '2025-03-07', '2025-03-10', '59945620', 'ABC123', '87654321'),
(4, 240.00, 'confirmada', '2025-04-04', '2025-04-06', '2025-04-10', '69645328', 'DEF456', '76543218'),
(2, 560.00, 'confirmada', '2025-05-05', '2025-05-07', '2025-05-09', '49975626', 'GHI789', '65432187'),
(2, 180.00, 'en_curso',   '2025-06-06', '2025-06-08', '2025-06-10', '74145223', 'JKL321', '54321876'),
(2, 700.00, 'finalizada', '2025-07-07', '2025-07-09', '2025-07-11', '90441524', 'MNO654', '43218765');

-- Actualización de estados, precios, fechas y vendedor asignado
UPDATE solicitud
SET estado = 'confirmada'
WHERE solicitud_id = 1;

UPDATE solicitud
SET precio_total = 300.00
WHERE solicitud_id = 2;

UPDATE solicitud
SET fecha_fin = '2025-05-10', tiempo_alquiler = 3
WHERE solicitud_id = 3;

UPDATE solicitud
SET vendedor_dni = '43218765'
WHERE solicitud_id = 4;

UPDATE solicitud
SET precio_total = 740.00
WHERE solicitud_id = 5;

COMMIT; -- Confirmación atómica: procesamiento de solicitudes de alquiler


-- =============================================================================
-- 8. MÓDULO SOLICITUD_SEGURO
-- Asociación de seguros contratados por solicitud y ajustes de subtotal.
START TRANSACTION;

INSERT INTO solicitud_seguro (solicitud_id, seguro_id, subtotal)
VALUES
(1, 1, 54.00),
(2, 2, 192.00),
(3, 3, 90.00),
(4, 4, 45.00),
(5, 5, 140.00);

-- Actualización de subtotales tras descuentos o recalculos
UPDATE solicitud_seguro
SET subtotal = 50.00
WHERE solicitud_id = 1 AND seguro_id = 1;

UPDATE solicitud_seguro
SET subtotal = 180.00
WHERE solicitud_id = 2 AND seguro_id = 2;

UPDATE solicitud_seguro
SET subtotal = 95.00
WHERE solicitud_id = 3 AND seguro_id = 3;

UPDATE solicitud_seguro
SET subtotal = 40.00
WHERE solicitud_id = 4 AND seguro_id = 4;

UPDATE solicitud_seguro
SET subtotal = 130.00
WHERE solicitud_id = 5 AND seguro_id = 5;

COMMIT; -- Confirmación atómica: seguros contratados por solicitud


-- =============================================================================
-- 9. MÓDULO REGISTRO
-- Registro de 5 actas de entrega/devolución vinculadas a las solicitudes 1 a 5.
START TRANSACTION;

INSERT INTO registro
(solicitud_id, vendedor_dni, fecha_entrega, fecha_devolucion, kilometraje_inicial, kilometraje_final, combustible_entrega, observaciones)
VALUES
(1, '87654321', '2025-03-07 09:00:00', '2025-03-10 09:30:00', 15000, 15320, 'lleno', 'Entregado sin novedades.'),
(2, '76543218', '2025-04-06 10:00:00', '2025-04-10 10:15:00', 22000, 22450, 'tres_cuartos', 'Devuelto con desgaste normal.'),
(3, '65432187', '2025-05-07 08:30:00', '2025-05-10 11:00:00', 12000, 12600, 'lleno', 'Entrega con leve retraso.'),
(4, '54321876', '2025-06-08 11:00:00', NULL,                  18500, NULL,  'medio', 'Vehículo actualmente en circulación.'),
(5, '43218765', '2025-07-09 09:15:00', '2025-07-11 18:00:00',  5400,  5950, 'lleno', 'Devuelto en excelentes condiciones.');

-- Actualizaciones de actas, kilometrajes y cierre de devolución
UPDATE registro
SET observaciones = 'Entregado limpio, devuelto con rayón leve en puerta trasera.'
WHERE solicitud_id = 1;

UPDATE registro
SET kilometraje_final = 22480
WHERE solicitud_id = 2;

UPDATE registro
SET combustible_entrega = 'tres_cuartos'
WHERE solicitud_id = 3;

UPDATE registro
SET fecha_devolucion = '2025-06-10 15:00:00',
    kilometraje_final = 18820,
    observaciones = 'Vehículo devuelto conforme.'
WHERE solicitud_id = 4;

UPDATE registro
SET vendedor_dni = '87654321'
WHERE solicitud_id = 5;

COMMIT; -- Confirmación atómica: formalización de actas de entrega y devolución


-- =============================================================================
-- 10. MÓDULO PAGO
-- Registro de 5 pagos vinculados a las solicitudes y actualizaciones de estado.
START TRANSACTION;

INSERT INTO pago
(solicitud_id, monto, metodo_pago, estado, fecha_pago, codigo_operacion)
VALUES
(1, 350.00, 'tarjeta',       'completado', '2025-03-07 08:50:00', 'OP-20250307-001'),
(2, 300.00, 'transferencia', 'pendiente',  '2025-04-06 09:45:00', 'OP-20250406-002'),
(3, 560.00, 'yape_plin',     'completado', '2025-05-07 08:20:00', 'OP-20250507-003'),
(4, 180.00, 'efectivo',      'pendiente',  '2025-06-08 10:50:00', 'OP-20250608-004'),
(5, 740.00, 'tarjeta',       'completado', '2025-07-09 09:00:00', 'OP-20250709-005');

-- Actualización de confirmaciones, montos y métodos de pago
UPDATE pago
SET monto = 400.00
WHERE pago_id = 1;

UPDATE pago
SET estado = 'completado'
WHERE pago_id = 2;

UPDATE pago
SET metodo_pago = 'transferencia'
WHERE pago_id = 3;

UPDATE pago
SET estado = 'completado', codigo_operacion = 'OP-20250608-004-OK'
WHERE pago_id = 4;

UPDATE pago
SET monto = 750.00
WHERE pago_id = 5;

COMMIT; -- Confirmación atómica: control de pagos y conciliación


-- =============================================================================
-- 11. MÓDULO MANTENIMIENTO
-- Registro de 5 servicios de mantenimiento a la flota y actualizaciones de cierre.
START TRANSACTION;

INSERT INTO mantenimiento
(placa, tipo, descripcion, costo, fecha_inicio, fecha_fin)
VALUES
('ABC123', 'preventivo', 'Cambio de aceite y filtro de motor', 280.00, '2025-02-20', '2025-02-21'),
('DEF456', 'correctivo', 'Cambio de pastillas de freno y revisión de suspensión', 850.00, '2025-04-12', NULL),
('GHI789', 'limpieza',   'Lavado profundo de tapicería y desinfección', 120.00, '2025-05-11', '2025-05-11'),
('JKL321', 'inspeccion', 'Revisión técnica general y alineamiento', 190.00, '2025-06-12', '2025-06-12'),
('MNO654', 'preventivo', 'Mantenimiento programado de 5,000 km', 350.00, '2025-07-15', NULL);

-- Actualización de costos, fechas de finalización y detalles
UPDATE mantenimiento
SET costo = 300.00
WHERE mantenimiento_id = 1;

UPDATE mantenimiento
SET fecha_fin = '2025-04-15'
WHERE mantenimiento_id = 2;

UPDATE mantenimiento
SET descripcion = 'Lavado profundo de tapicería, encerado y ozono'
WHERE mantenimiento_id = 3;

UPDATE mantenimiento
SET costo = 210.00
WHERE mantenimiento_id = 4;

UPDATE mantenimiento
SET fecha_fin = '2025-07-16', costo = 370.00
WHERE mantenimiento_id = 5;

COMMIT; -- Confirmación atómica: historial de mantenimientos vehiculares


-- =============================================================================
-- 12. MÓDULO INCIDENTE
-- Registro de 5 incidentes asociados a actas de registro y actualizaciones de pago.
START TRANSACTION;

INSERT INTO incidente
(registro_id, tipo, descripcion, monto_penalidad, fecha_incidente, pagado)
VALUES
(1, 'danio',   'Rayón leve en puerta trasera derecha', 180.00, '2025-03-10', FALSE),
(2, 'multa',   'Papeleta por estacionamiento en zona rígida', 250.00, '2025-04-09', FALSE),
(3, 'retraso', 'Devolución con 2 horas y media de retraso', 75.00, '2025-05-10', TRUE),
(4, 'otro',    'Pérdida de llave de repuesto del vehículo', 120.00, '2025-06-10', FALSE),
(5, 'danio',   'Abolladura menor en parachoques delantero', 310.00, '2025-07-11', FALSE);

-- Actualización de penalidades, descripciones y estado de pago
UPDATE incidente
SET pagado = TRUE
WHERE incidente_id = 1;

UPDATE incidente
SET monto_penalidad = 220.00, pagado = TRUE
WHERE incidente_id = 2;

UPDATE incidente
SET descripcion = 'Devolución fuera del horario acordado (2.5 horas)'
WHERE incidente_id = 3;

UPDATE incidente
SET monto_penalidad = 150.00
WHERE incidente_id = 4;

UPDATE incidente
SET pagado = TRUE
WHERE incidente_id = 5;

COMMIT; -- Confirmación atómica: gestión de incidentes y penalidades
