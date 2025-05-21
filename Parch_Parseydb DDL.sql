-- CREATING ENTITIES/TABLES

CREATE TABLE sales_reps (id SERIAL PRIMARY KEY,
                         name VARCHAR, 
                         region_id CHAR(2));

CREATE TABLE region (id CHAR(2)PRIMARY KEY, name VARCHAR);

CREATE TABLE accounts (id VARCHAR PRIMARY KEY, 
                      name VARCHAR, 
                      website VARCHAR(300),
                      latitude NUMERIC(9,6), 
                      longitude NUMERIC (9,6), 
                      primary_poc VARCHAR,
					  sales_red_id SERIAL);

CREATE TABLE orders (id SERIAL PRIMARY KEY,
                     account_id VARCHAR,
                     standard_qty INT, 
                     postal_qty INT, total INT, 
                     standard_amt_usd INT, 
                     gloss_amt_usd INT, 
                     poster_amt_usd INT, 
                     total_amt_usd INT);

CREATE TABLE web_events (id VARCHAR PRIMARY KEY,account_id VARCHAR,
                         occurred_at_channel BOOLEAN);

-- MAKING CHANGES TO ENTITIES
ALTER TABLE sales_reps ADD FOREIGN KEY (region_id) REFERENCES region(id);
ALTER TABLE region ADD PRIMARY KEY (id);
ALTER TABLE accounts RENAME COLUMN sales_red_id TO sales_rep_id;
ALTER TABLE orders ADD FOREIGN KEY (account_id) REFERENCES accounts(id);
ALTER TABLE web_events ADD FOREIGN KEY (account_id) REFERENCES accounts(id);
ALTER TABLE sales_reps ALTER COLUMN id SET NOT NULL;
ALTER TABLE accounts ADD CONSTRAINT unique_id UNIQUE(id);
ALTER TABLE region ALTER COLUMN id SET NOT NULL;
