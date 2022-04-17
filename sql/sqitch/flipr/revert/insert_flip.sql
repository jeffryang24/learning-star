-- Revert flipr:insert_flip from pg

BEGIN;

DROP FUNCTION IF EXISTS flipr.insert_flip(TEXT, TEXT);

COMMIT;
