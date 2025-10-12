-- Tabla de clientes de una clínica veterinaria
create table clientes (
    id serial primary key,          -- ID único del cliente
    nombre varchar(100) not null,   -- Nombre del cliente
    apellido varchar(100) not null, -- Apellido
    telefono varchar(20),           -- Teléfono de contacto
    email varchar(100) unique,      -- Correo electrónico
    direccion varchar(200),         -- Dirección del cliente
    creado_en timestamp default current_timestamp -- Fecha de registro
);
