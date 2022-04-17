-- Deploy flipr:enable_pgcrypto to pg

BEGIN;

CREATE EXTENSION IF NOT EXISTS pgcrypto;

COMMIT;
