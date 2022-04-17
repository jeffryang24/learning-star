-- Revert flipr:enable_pgcrypto from pg

BEGIN;

DROP EXTENSION IF EXISTS pgcrypto;

COMMIT;
