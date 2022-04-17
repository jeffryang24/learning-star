-- Verify flipr:insert_user on pg

BEGIN;

SELECT has_function_privilege('flipr.insert_user(text, text)', 'execute');

SELECT 1/COUNT(*)
  FROM pg_catalog.pg_proc
WHERE proname = 'insert_user'
  AND pg_get_functiondef(oid) LIKE $$%CRYPT($2, GEN_SALT('md5'))%$$;

ROLLBACK;
