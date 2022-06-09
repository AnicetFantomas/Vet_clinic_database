/* Database schema to keep the structure of entire database. */

CREATE TABLE IF NOT EXISTS public.animals
(
    id integer NOT NULL,
    date_of_birth date NOT NULL,
    escapes_attempts integer NOT NULL,
    neutered boolean NOT NULL,
    weight_kg real NOT NULL,
    name character varying(100) COLLATE pg_catalog."default",
    species character(200) COLLATE pg_catalog."default",
    CONSTRAINT animals_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.animals
    OWNER to postgres;
