CREATE EXTENSION IF NOT EXISTS "pgcrypto";
CREATE DATABASE "guava-pay" ENCODING 'UTF8';

CREATE TABLE  IF NOT EXISTS "user" (
    id UUID DEFAULT gen_random_uuid(),
    name VARCHAR(50),
    lastname varchar(50) NOT NULL,
    role UUID NOT NULL,
    phone VARCHAR(20) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    PRIMARY KEY(id));

CREATE OR REPLACE FUNCTION generate_uuid()
    RETURNS TRIGGER AS $$
    BEGIN
        IF NEW.id IS NULL THEN
        NEW.id = gen_random_uuid();
        END IF;
        RETURN NEW;
    END;
$$ language 'plpgsql';

CREATE TRIGGER id_generate_uuid BEFORE INSERT
    ON "user" FOR EACH ROW EXECUTE PROCEDURE
    generate_uuid();

CREATE OR REPLACE FUNCTION update_updated_at_column()
    RETURNS TRIGGER AS $$
    BEGIN
        NEW.updated_at = now();
        RETURN NEW;
    END;
$$ language 'plpgsql';

CREATE TRIGGER updated_at_change_timestamp BEFORE UPDATE
    ON "user" FOR EACH ROW EXECUTE PROCEDURE
    update_updated_at_column();

INSERT INTO "user"(name, lastname, role, phone)
VALUES ('admin', 'admin', '00000000-0000-0000-0000-000000000000', +71112223344);