create type "public"."pet_type" as enum ('dog', 'cat', 'bird', 'other');

create type "public"."specialty" as enum ('general', 'surgery', 'dentistry', 'exotics', 'dermatology');

create table "public"."Centros" (
    "id" uuid not null default gen_random_uuid(),
    "name" text not null,
    "address" text not null,
    "phone" text,
    "email" text,
    "created_at" timestamp without time zone default now()
);


create table "public"."Citas" (
    "id" uuid not null default gen_random_uuid(),
    "client_id" uuid,
    "pet_id" uuid,
    "staff_id" uuid,
    "time_slot_id" uuid,
    "reason" text,
    "status" text default 'scheduled'::text,
    "created_at" timestamp without time zone default now()
);


create table "public"."Clientes" (
    "id" uuid not null default gen_random_uuid(),
    "center_id" uuid,
    "full_name" text not null,
    "email" text,
    "phone" text,
    "created_at" timestamp without time zone default now()
);


create table "public"."Mascotas" (
    "id" uuid not null default gen_random_uuid(),
    "client_id" uuid,
    "name" text not null,
    "type" pet_type not null,
    "breed" text,
    "age" integer,
    "weight" numeric(5,2),
    "created_at" timestamp without time zone default now()
);


create table "public"."Perfil del personal" (
    "id" uuid not null default gen_random_uuid(),
    "center_id" uuid,
    "full_name" text not null,
    "role" text not null,
    "specialty" specialty default 'general'::specialty,
    "email" text,
    "phone" text,
    "created_at" timestamp without time zone default now()
);


create table "public"."Tiempo de cita" (
    "id" uuid not null default gen_random_uuid(),
    "staff_id" uuid,
    "date" date not null,
    "start_time" time without time zone not null,
    "end_time" time without time zone not null,
    "available" boolean default true
);


CREATE UNIQUE INDEX appointments_pkey ON public."Citas" USING btree (id);

CREATE UNIQUE INDEX centers_pkey ON public."Centros" USING btree (id);

CREATE UNIQUE INDEX clients_email_key ON public."Clientes" USING btree (email);

CREATE UNIQUE INDEX clients_pkey ON public."Clientes" USING btree (id);

CREATE UNIQUE INDEX pets_pkey ON public."Mascotas" USING btree (id);

CREATE UNIQUE INDEX staff_profiles_email_key ON public."Perfil del personal" USING btree (email);

CREATE UNIQUE INDEX staff_profiles_pkey ON public."Perfil del personal" USING btree (id);

CREATE UNIQUE INDEX time_slots_pkey ON public."Tiempo de cita" USING btree (id);

alter table "public"."Centros" add constraint "centers_pkey" PRIMARY KEY using index "centers_pkey";

alter table "public"."Citas" add constraint "appointments_pkey" PRIMARY KEY using index "appointments_pkey";

alter table "public"."Clientes" add constraint "clients_pkey" PRIMARY KEY using index "clients_pkey";

alter table "public"."Mascotas" add constraint "pets_pkey" PRIMARY KEY using index "pets_pkey";

alter table "public"."Perfil del personal" add constraint "staff_profiles_pkey" PRIMARY KEY using index "staff_profiles_pkey";

alter table "public"."Tiempo de cita" add constraint "time_slots_pkey" PRIMARY KEY using index "time_slots_pkey";

alter table "public"."Citas" add constraint "appointments_client_id_fkey" FOREIGN KEY (client_id) REFERENCES "Clientes"(id) not valid;

alter table "public"."Citas" validate constraint "appointments_client_id_fkey";

alter table "public"."Citas" add constraint "appointments_pet_id_fkey" FOREIGN KEY (pet_id) REFERENCES "Mascotas"(id) not valid;

alter table "public"."Citas" validate constraint "appointments_pet_id_fkey";

alter table "public"."Citas" add constraint "appointments_staff_id_fkey" FOREIGN KEY (staff_id) REFERENCES "Perfil del personal"(id) not valid;

alter table "public"."Citas" validate constraint "appointments_staff_id_fkey";

alter table "public"."Citas" add constraint "appointments_time_slot_id_fkey" FOREIGN KEY (time_slot_id) REFERENCES "Tiempo de cita"(id) not valid;

alter table "public"."Citas" validate constraint "appointments_time_slot_id_fkey";

alter table "public"."Clientes" add constraint "clients_center_id_fkey" FOREIGN KEY (center_id) REFERENCES "Centros"(id) ON DELETE CASCADE not valid;

alter table "public"."Clientes" validate constraint "clients_center_id_fkey";

alter table "public"."Clientes" add constraint "clients_email_key" UNIQUE using index "clients_email_key";

alter table "public"."Mascotas" add constraint "pets_client_id_fkey" FOREIGN KEY (client_id) REFERENCES "Clientes"(id) ON DELETE CASCADE not valid;

alter table "public"."Mascotas" validate constraint "pets_client_id_fkey";

alter table "public"."Perfil del personal" add constraint "staff_profiles_center_id_fkey" FOREIGN KEY (center_id) REFERENCES "Centros"(id) ON DELETE CASCADE not valid;

alter table "public"."Perfil del personal" validate constraint "staff_profiles_center_id_fkey";

alter table "public"."Perfil del personal" add constraint "staff_profiles_email_key" UNIQUE using index "staff_profiles_email_key";

alter table "public"."Tiempo de cita" add constraint "time_slots_staff_id_fkey" FOREIGN KEY (staff_id) REFERENCES "Perfil del personal"(id) ON DELETE CASCADE not valid;

alter table "public"."Tiempo de cita" validate constraint "time_slots_staff_id_fkey";



