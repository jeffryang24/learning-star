-- Verify flipr:change_pass on pg

BEGIN;

SELECT has_function_privilege('flipr.change_pass(text, text, text)', 'execute');

SELECT 1/COUNT(*)
  FROM pg_catalog.pg_proc
WHERE proname = 'change_pass'
  AND pg_get_functiondef(oid) LIKE $$%CRYPT($3, GEN_SALT('md5'))%$$;

ROLLBACK;
