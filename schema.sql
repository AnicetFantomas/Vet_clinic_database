/* Database schema to keep the structure of entire database. */

CREATE TABLE public.animals
(
    id integer NOT NULL,
    name character(100)[] NOT NULL,
    date_of_birth date NOT NULL,
    escapes_attempts integer NOT NULL,
    neutered boolean NOT NULL,
    weight_kg real NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS public.animals
    OWNER to postgres;
