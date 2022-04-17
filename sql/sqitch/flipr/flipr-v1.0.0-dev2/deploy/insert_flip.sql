-- Deploy flipr:insert_flip to pg
-- requires: users
-- requires: appschema
-- requires: flips

BEGIN;

CREATE OR REPLACE FUNCTION flipr.insert_flip(
  nickname TEXT,
  body     TEXT
)
  RETURNS BIGINT
  LANGUAGE sql
  SECURITY DEFINER
AS $$
  INSERT INTO flipr.flips (nickname, body)
  VALUES ($1, $2)
  RETURNING id;
$$;

COMMIT;
