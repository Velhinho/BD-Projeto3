CREATE TABLE public_location (
    latitude numeric(9, 6),
    longitude numeric(8, 6),
    name varchar(255) NOT NULL,
    
    PRIMARY KEY (latitude, longitude)
);

CREATE TABLE item (
    id char(36),
    description_text text NOT NULL,
    location_name varchar(255) NOT NULL,
    latitude numeric(9, 6),
    longitude numeric (8, 6),
    
    PRIMARY KEY(id),
    FOREIGN KEY(latitude, longitude)
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

    PRIMARY KEY(id)
);

CREATE TABLE translation_anomaly (
    id char(36),
    area varchar(45) NOT NULL REFERENCES anomaly(area)
    area2 varchar(45) NOT NULL,
    lang char(3) NOT NULL REFERENCES anomaly(lang),
    lang2 char(3) NOT NULL,

    FOREIGN KEY(id)
        REFERENCES anomaly(id)
    CONSTRAINT overlaping_areas
        CHECK(area != area2),   
    CONSTRAINT overlaping_languages
        CHECK(lang != lang2)
);

CREATE TABLE duplicate (
    item1 char(36),
    item2 char(36),

    FOREIGN KEY(item1, item2)
        REFERENCES item(id)
    CONSTRAINT self_duplicate
        CHECK(item1 < item2)
);