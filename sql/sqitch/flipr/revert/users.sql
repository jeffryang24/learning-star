-- Revert flipr:users from pg

BEGIN;

DROP TABLE IF EXISTS flipr.users;

COMMIT;
