-- Revert flipr:appschema from pg

BEGIN;

DROP SCHEMA IF EXISTS flipr;

COMMIT;
