-- Revert flipr:change_pass from pg

BEGIN;

DROP FUNCTION IF EXISTS flipr.change_pass(TEXT, TEXT, TEXT);

COMMIT;
