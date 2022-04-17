-- Revert flipr:flips from pg

BEGIN;

DROP TABLE IF EXISTS flipr.flips;

COMMIT;
