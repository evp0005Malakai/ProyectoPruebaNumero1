-- Tabla de mascotas de clientes
create table mascotas (
    id serial primary key,              -- ID único de la mascota
    nombre varchar(100) not null,       -- Nombre de la mascota
    especie varchar(50) not null,       -- Ej: perro, gato
    raza varchar(50),                    -- Raza de la mascota
    fecha_nacimiento date,              -- Fecha de nacimiento
    cliente_id int not null references clientes(id) on delete cascade, -- Relación con clientes
    creado_en timestamp default current_timestamp
);
