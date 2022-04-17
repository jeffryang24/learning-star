-- Revert flipr:insert_user from pg

BEGIN;

DROP FUNCTION IF EXISTS flipr.insert_user(TEXT, TEXT);

COMMIT;
