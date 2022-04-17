-- Deploy flipr:change_pass to pg
-- requires: users
-- requires: appschema
-- requires: enable_pgcrypto


BEGIN;

CREATE OR REPLACE FUNCTION flipr.change_pass(
  nick    TEXT,
  oldpass TEXT,
  newpass TEXT
)
  RETURNS BOOLEAN
  LANGUAGE plpgsql
  SECURITY DEFINER
AS $$
BEGIN
  UPDATE flipr.users
  SET password = CRYPT($3, GEN_SALT('md5'))
  WHERE nickname = $1
    AND password = CRYPT($2, password);
  RETURN FOUND;
END;
$$;

COMMIT;
