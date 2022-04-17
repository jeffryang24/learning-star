-- Deploy flipr:insert_user to pg
-- requires: users
-- requires: appschema
-- requires: enable_pgcrypto

BEGIN;

CREATE OR REPLACE FUNCTION flipr.insert_user(
  nickname TEXT,
  password TEXT
)
  RETURNS VOID
  LANGUAGE SQL
  SECURITY DEFINER
AS $$
  INSERT INTO flipr.users
  VALUES ($1, CRYPT($2, GEN_SALT('md5')));
$$;

COMMIT;
