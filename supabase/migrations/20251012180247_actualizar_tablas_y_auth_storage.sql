revoke delete on table "public"."clientes" from "anon";

revoke insert on table "public"."clientes" from "anon";

revoke references on table "public"."clientes" from "anon";

revoke select on table "public"."clientes" from "anon";

revoke trigger on table "public"."clientes" from "anon";

revoke truncate on table "public"."clientes" from "anon";

revoke update on table "public"."clientes" from "anon";

revoke delete on table "public"."clientes" from "authenticated";

revoke insert on table "public"."clientes" from "authenticated";

revoke references on table "public"."clientes" from "authenticated";

revoke select on table "public"."clientes" from "authenticated";

revoke trigger on table "public"."clientes" from "authenticated";

revoke truncate on table "public"."clientes" from "authenticated";

revoke update on table "public"."clientes" from "authenticated";

revoke delete on table "public"."clientes" from "service_role";

revoke insert on table "public"."clientes" from "service_role";

revoke references on table "public"."clientes" from "service_role";

revoke select on table "public"."clientes" from "service_role";

revoke trigger on table "public"."clientes" from "service_role";

revoke truncate on table "public"."clientes" from "service_role";

revoke update on table "public"."clientes" from "service_role";

revoke delete on table "public"."mascotas" from "anon";

revoke insert on table "public"."mascotas" from "anon";

revoke references on table "public"."mascotas" from "anon";

revoke select on table "public"."mascotas" from "anon";

revoke trigger on table "public"."mascotas" from "anon";

revoke truncate on table "public"."mascotas" from "anon";

revoke update on table "public"."mascotas" from "anon";

revoke delete on table "public"."mascotas" from "authenticated";

revoke insert on table "public"."mascotas" from "authenticated";

revoke references on table "public"."mascotas" from "authenticated";

revoke select on table "public"."mascotas" from "authenticated";

revoke trigger on table "public"."mascotas" from "authenticated";

revoke truncate on table "public"."mascotas" from "authenticated";

revoke update on table "public"."mascotas" from "authenticated";

revoke delete on table "public"."mascotas" from "service_role";

revoke insert on table "public"."mascotas" from "service_role";

revoke references on table "public"."mascotas" from "service_role";

revoke select on table "public"."mascotas" from "service_role";

revoke trigger on table "public"."mascotas" from "service_role";

revoke truncate on table "public"."mascotas" from "service_role";

revoke update on table "public"."mascotas" from "service_role";

alter table "public"."clientes" drop constraint "clientes_email_key";

alter table "public"."mascotas" drop constraint "mascotas_cliente_id_fkey";

alter table "public"."clientes" drop constraint "clientes_pkey";

alter table "public"."mascotas" drop constraint "mascotas_pkey";

drop index if exists "public"."clientes_email_key";

drop index if exists "public"."clientes_pkey";

drop index if exists "public"."mascotas_pkey";

drop table "public"."clientes";

drop table "public"."mascotas";

drop sequence if exists "public"."clientes_id_seq";

drop sequence if exists "public"."mascotas_id_seq";


CREATE TRIGGER enforce_bucket_name_length_trigger BEFORE INSERT OR UPDATE OF name ON storage.buckets FOR EACH ROW EXECUTE FUNCTION storage.enforce_bucket_name_length();

CREATE TRIGGER objects_delete_delete_prefix AFTER DELETE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.delete_prefix_hierarchy_trigger();

CREATE TRIGGER objects_insert_create_prefix BEFORE INSERT ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.objects_insert_prefix_trigger();

CREATE TRIGGER objects_update_create_prefix BEFORE UPDATE ON storage.objects FOR EACH ROW WHEN (((new.name <> old.name) OR (new.bucket_id <> old.bucket_id))) EXECUTE FUNCTION storage.objects_update_prefix_trigger();

CREATE TRIGGER prefixes_create_hierarchy BEFORE INSERT ON storage.prefixes FOR EACH ROW WHEN ((pg_trigger_depth() < 1)) EXECUTE FUNCTION storage.prefixes_insert_trigger();

CREATE TRIGGER prefixes_delete_hierarchy AFTER DELETE ON storage.prefixes FOR EACH ROW EXECUTE FUNCTION storage.delete_prefix_hierarchy_trigger();


