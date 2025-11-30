-- Create schema
CREATE SCHEMA IF NOT EXISTS raw;

-- listing
CREATE TABLE raw.listing (
    id INTEGER,
    outlet_id INTEGER,
    platform_id INTEGER,
    timestamp TIMESTAMP
);

-- orders
CREATE TABLE raw.orders (
    listing_id INTEGER,
    order_id INTEGER,
    placed_at TIMESTAMP,
    status TEXT
);

-- orders_daily
CREATE TABLE raw.orders_daily (
    date DATE,
    listing_id INTEGER,
    orders INTEGER,
    timestamp TIMESTAMP
);

-- org
CREATE TABLE raw.org (
    id INTEGER,
    name TEXT,
    timestamp TIMESTAMP
);

-- outlet
CREATE TABLE raw.outlet (
    id INTEGER,
    org_id INTEGER,
    name TEXT,
    latitude DOUBLE PRECISION,
    longitude DOUBLE PRECISION,
    timestamp TIMESTAMP
);

-- platform
CREATE TABLE raw.platform (
    id INTEGER,
    group TEXT,
    name TEXT,
    country TEXT
);

-- rank
CREATE TABLE raw.rank (
    listing_id INTEGER,
    date DATE,
    timestamp TIMESTAMP,
    is_online BOOLEAN,
    rank INTEGER
);

-- ratings_agg
CREATE TABLE raw.ratings_agg (
    date DATE,
    listing_id INTEGER,
    cnt_ratings INTEGER,
    avg_rating DOUBLE PRECISION
);

