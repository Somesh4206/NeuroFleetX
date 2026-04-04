-- ============================================================
-- NeuroFleetX — MySQL Initialization Script
-- This runs automatically when the MySQL Docker container
-- first starts (placed in /docker-entrypoint-initdb.d/).
-- Hibernate will handle table creation via ddl-auto=update,
-- so this script just ensures the DB + charset are set up.
-- ============================================================

CREATE DATABASE IF NOT EXISTS neurofleetx
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE neurofleetx;

-- Grant full access to the application user
GRANT ALL PRIVILEGES ON neurofleetx.* TO 'neurofleetx'@'%';
FLUSH PRIVILEGES;
