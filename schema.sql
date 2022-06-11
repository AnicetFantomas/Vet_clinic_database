/* Database schema to keep the structure of entire database. */

-- Table: public.animals

-- DROP TABLE IF EXISTS public.animals;

CREATE TABLE IF NOT EXISTS public.animals
(
    date_of_birth date NOT NULL,
    escapes_attempts integer NOT NULL,
    neutered boolean NOT NULL,
    weight_kg real NOT NULL,
    name character varying(100) COLLATE pg_catalog."default",
    id bigint NOT NULL DEFAULT nextval('animals_id_seq'::regclass),
    species_id integer,
    owners_id integer,
    CONSTRAINT animals_pkey PRIMARY KEY (id),
    CONSTRAINT animals_owners_id_fkey FOREIGN KEY (owners_id)
        REFERENCES public.owners (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT animals_species_id_fkey FOREIGN KEY (species_id)
        REFERENCES public.species (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.animals
    OWNER to postgres;c.animals
    OWNER to postgres;



-- Table: public.owners

-- DROP TABLE IF EXISTS public.owners;

CREATE TABLE IF NOT EXISTS public.owners
(
    full_name character(200) COLLATE pg_catalog."default" NOT NULL,
    age integer NOT NULL,
    id bigint NOT NULL DEFAULT nextval('owners_id_seq'::regclass),
    CONSTRAINT owners_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.owners
    OWNER to postgres;

-- Table: public.species

-- DROP TABLE IF EXISTS public.species;

CREATE TABLE IF NOT EXISTS public.species
(
    id bigint NOT NULL DEFAULT nextval('species_id_seq'::regclass),
    name character(100) COLLATE pg_catalog."default",
    CONSTRAINT species_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.species
    OWNER to postgres;


-- Table: public.vets

-- DROP TABLE IF EXISTS public.vets;

CREATE TABLE IF NOT EXISTS public.vets
(
    id bigint NOT NULL DEFAULT nextval('vets_id_seq'::regclass),
    name character(1) COLLATE pg_catalog."default" NOT NULL,
    "Age" integer NOT NULL,
    date_of_graduation date NOT NULL,
    CONSTRAINT vets_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.vets
    OWNER to postgres;

-- Make sure that id is set as autoincremented PRIMARY KEY
ALTER TABLE your_table ADD COLUMN key_column BIGSERIAL PRIMARY KEY;
-- Remove column species
ALTER TABLE animals DROP COLUMN species;
-- Add column species_id which is a foreign key referencing species table
ALTER TABLE animals ADD FOREIGN KEY (species_id) REFERENCES species(id);
-- Add column owner_id which is a foreign key referencing the owners table
ALTER TABLE animals ADD FOREIGN KEY (owners_id) REFERENCES owners(id);
