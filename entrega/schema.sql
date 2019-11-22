BEGIN;

CREATE TABLE public_location (
    latitude numeric(9, 6),
    longitude numeric(8, 6),
    location_name varchar(255) NOT NULL,
    
    PRIMARY KEY (latitude, longitude)
);

CREATE TABLE item (
    id char(36),
    description_text text NOT NULL,
    location_name varchar(255) NOT NULL,
    latitude numeric(9, 6),
    longitude numeric (8, 6),
    
    PRIMARY KEY (id),
    FOREIGN KEY (latitude, longitude)
        REFERENCES public_location(latitude, longitude)
);

CREATE TABLE anomaly (
    id char(36),
    area varchar(45) NOT NULL,
    image_path varchar(253) NOT NULL,
    lang char(3) NOT NULL,
    tmstmp timestamp NOT NULL,
    description_text text NOT NULL,
    has_wording_anomaly boolean NOT NULL,

    PRIMARY KEY (id)
);

CREATE TABLE translation_anomaly (
    id char(36),
    area2 varchar(45) NOT NULL,
    lang2 char(3) NOT NULL,

    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES anomaly(id)
    -- CONSTRAINT overlaping_areas CHECK(area != area2),
    -- CONSTRAINT overlaping_languages CHECK(lang != lang2)
);

CREATE TABLE duplicate (
    item1 char(36),
    item2 char(36),
    
    PRIMARY KEY (item1, item2),
    FOREIGN KEY (item1) REFERENCES item(id),
    FOREIGN KEY (item2) REFERENCES item(id)
    -- CONSTRAINT self_duplicate CHECK(item1 < item2)
);

CREATE TABLE user_table (
    user_email varchar(254),
    user_password varchar(254) NOT NULL,

    PRIMARY KEY (user_email)    
    /*
    CONSTRAINT user_specification 
        CHECK(user_email in qualified_user or in regular_user) 
    */
);

CREATE TABLE qualified_user (
    user_email varchar(254),

    PRIMARY KEY (user_email),
    FOREIGN KEY (user_email) REFERENCES user_table(user_email)
    /*
    CONSTRAINT not_in_regular_user
        CHECK(user_email not in regular_user)
    */
);

CREATE TABLE regular_user (
    user_email varchar(254),

    PRIMARY KEY (user_email),
    FOREIGN KEY (user_email) REFERENCES user_table(user_email)
    /*
    CONSTRAINT not_in_qualified_user
        CHECK(user_email not in qualified_user)
    */
);

CREATE TABLE incident (
    anomaly_id char(36),
    item_id char(36),
    user_email varchar(254),

    PRIMARY KEY (anomaly_id),
    FOREIGN KEY (anomaly_id) REFERENCES anomaly(id),
    FOREIGN KEY (item_id) REFERENCES item(id),
    FOREIGN KEY (user_email) REFERENCES user_table(user_email)
);

CREATE TABLE correction_proposal (
    user_email varchar(254),
    nro char(36),

    UNIQUE(nro),
    PRIMARY KEY (user_email),
    FOREIGN KEY (user_email) REFERENCES qualified_user(user_email)
);

CREATE TABLE correction (
    user_email varchar(254),
    nro char(36),
    anomaly_id char(36),

    PRIMARY KEY (user_email, nro, anomaly_id),
    FOREIGN KEY (user_email) REFERENCES correction_proposal(user_email),
    FOREIGN KEY (nro) REFERENCES correction_proposal(nro),
    FOREIGN KEY (anomaly_id) REFERENCES incident(anomaly_id)
);

COMMIT;