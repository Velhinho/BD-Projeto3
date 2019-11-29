BEGIN;

CREATE TABLE public_location (
    latitude numeric(9, 6),
    longitude numeric(8, 6),
    location_name varchar(255) NOT NULL,
    
    PRIMARY KEY (latitude, longitude)
);

CREATE TABLE item (
    id SERIAL,
    description_text text NOT NULL,
    location_name varchar(255) NOT NULL,
    latitude numeric(9, 6),
    longitude numeric (8, 6),
    
    PRIMARY KEY (id),
    FOREIGN KEY (latitude, longitude)
        REFERENCES public_location(latitude, longitude)
);

CREATE TABLE anomaly (
    id SERIAL,
    area varchar(45) NOT NULL,
    image_path varchar(253) NOT NULL,
    lang char(3) NOT NULL,
    tmstmp timestamp NOT NULL,
    description_text text NOT NULL,
    has_wording_anomaly boolean NOT NULL,

    PRIMARY KEY (id)
);

CREATE TABLE translation_anomaly (
    id SERIAL,
    area2 varchar(45) NOT NULL,
    lang2 char(3) NOT NULL,

    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES anomaly(id)
);

CREATE TABLE duplicate (
    item1 SERIAL,
    item2 SERIAL,
    
    PRIMARY KEY (item1, item2),
    FOREIGN KEY (item1) REFERENCES item(id),
    FOREIGN KEY (item2) REFERENCES item(id),
    CONSTRAINT self_duplicate CHECK(item1 < item2)
);

CREATE TABLE user_table (
    user_email varchar(254),
    user_password varchar(254) NOT NULL,

    PRIMARY KEY (user_email)    
);

CREATE TABLE qualified_user (
    user_email varchar(254),

    PRIMARY KEY (user_email),
    FOREIGN KEY (user_email) REFERENCES user_table(user_email)
);

CREATE TABLE regular_user (
    user_email varchar(254),

    PRIMARY KEY (user_email),
    FOREIGN KEY (user_email) REFERENCES user_table(user_email)
);

CREATE TABLE incident (
    anomaly_id SERIAL,
    item_id SERIAL,
    user_email varchar(254),

    PRIMARY KEY (anomaly_id),
    FOREIGN KEY (anomaly_id) REFERENCES anomaly(id),
    FOREIGN KEY (item_id) REFERENCES item(id),
    FOREIGN KEY (user_email) REFERENCES user_table(user_email)
);

CREATE TABLE correction_proposal (
    user_email varchar(254),
    tmstmp timestamp NOT NULL,
    correction_text text NOT NULL,
    nro SERIAL,

    UNIQUE(nro),
    PRIMARY KEY (user_email, nro),
    FOREIGN KEY (user_email) REFERENCES qualified_user(user_email)
);

CREATE TABLE correction (
    user_email varchar(254),
    anomaly_id SERIAL,
    nro SERIAL,

    PRIMARY KEY (user_email, nro, anomaly_id),
    FOREIGN KEY (user_email, nro) REFERENCES correction_proposal(user_email, nro),
    FOREIGN KEY (anomaly_id) REFERENCES incident(anomaly_id)
);

COMMIT;
