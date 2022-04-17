-- Revert flipr:delete_flip from pg

BEGIN;

DROP FUNCTION IF EXISTS flipr.delete_flip(BIGINT);

COMMIT;
