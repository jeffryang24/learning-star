-- Deploy flipr:change_pass to pg
-- requires: users
-- requires: appschema

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
  SET password = MD5($3)
  WHERE nickname = $1
    AND password = MD5($2);
  RETURN FOUND;
END;
$$;

COMMIT;
