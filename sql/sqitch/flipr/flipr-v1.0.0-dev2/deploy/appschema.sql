-- Deploy flipr:appschema to pg

BEGIN;

CREATE SCHEMA IF NOT EXISTS flipr;

COMMIT;
