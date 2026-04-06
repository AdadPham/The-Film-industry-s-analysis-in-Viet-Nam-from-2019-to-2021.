-- CREATE TABLE --

CREATE TABLE device_detail (
    device_number INTEGER PRIMARY KEY,
    model TEXT,
    platform TEXT CHECK (platform IN ('website','mobile'))
);

CREATE TABLE status_detail (
    status_id INTEGER PRIMARY KEY,
    description TEXT,
    error_group TEXT
);

CREATE TABLE customer (
    customer_id INTEGER PRIMARY KEY,
    usergender TEXT CHECK (usergender IN ('Female','Male')),
    dob DATE
);

CREATE TABLE campaign (
    campaign_id INTEGER PRIMARY KEY,
    campaign_type TEXT CHECK (
        campaign_type IN ('direct discount','reward point','voucher')
    )
);

CREATE TABLE ticket_history (
    ticket_id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    paying_method TEXT,
    theater_name TEXT,
    device_number INTEGER,
    original_price REAL,
    discount_value REAL,
    final_price REAL,
    time DATETIME,
    status_id INTEGER,
    campaign_id INTEGER,
    movie_name TEXT,

    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (device_number) REFERENCES device_detail(device_number),
    FOREIGN KEY (status_id) REFERENCES status_detail(status_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(campaign_id),

    CHECK (original_price >= 0),
    CHECK (discount_value >= 0),
    CHECK (final_price >= 0)
);

# DROP TABLE IF EXISTS ticket_history;
# DROP TABLE IF EXISTS campaign;
# DROP TABLE IF EXISTS customer;
# DROP TABLE IF EXISTS status_detail;
# DROP TABLE IF EXISTS device_detail;