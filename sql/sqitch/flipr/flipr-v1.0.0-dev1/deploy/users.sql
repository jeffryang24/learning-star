-- Deploy flipr:users to pg
-- requires: appschema

BEGIN;

SET client_min_messages = 'WARNING';

CREATE TABLE IF NOT EXISTS flipr.users (
  nickname    TEXT        PRIMARY KEY,
  password    TEXT        NOT NULL,
  timestamp   TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

COMMIT;
