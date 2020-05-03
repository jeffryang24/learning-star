CREATE TABLE IF NOT EXISTS link  (
  id SERIAL PRIMARY KEY,
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  description VARCHAR(255),
  url VARCHAR(50) NOT NULL,
  posted_by INT,
  FOREIGN KEY (posted_by) REFERENCES member (id)
)

CREATE TABLE IF NOT EXISTS member (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL
)

-- Only for alter
-- ALTER TABLE IF EXISTS link
-- ADD COLUMN IF NOT EXISTS posted_by INT

-- ALTER TABLE IF EXISTS link
-- ADD CONSTRAINT link_posted_by_fkkey FOREIGN KEY (posted_by) REFERENCES member (id)