CREATE TABLE public_location (
    latitude numeric(9, 6),
    longitude numeric(8, 6),
    name varchar(255) NOT NULL,
    
    PRIMARY KEY (latitude, longitude)
)

CREATE TABLE item (
    id char(36),
    description text NOT NULL,
    location varchar(255) NOT NULL,
    latitude numeric(9, 6),
    longitude numeric (8, 6),
    
    PRIMARY KEY(id),
    FOREIGN KEY(latitude, longitude)
        REFERENCES public_location(latitude, longitude)
)

CREATE TABLE anomaly (
    id char(36),
    area varchar(45) NOT NULL,
    image_path varchar(253) NOT NULL,
    language char(3) NOT NULL,
    tmstmp timestamp NOT NULL,
    description text NOT NULL,
    has_wording_anomaly boolean NOT NULL,

    PRIMARY KEY(id)
)

CREATE TABLE translation_anomaly (
    id char(36),
    area2 varchar(45) NOT NULL,
    language2 char(3) NOT NULL,

    FOREIGN KEY(id)
        REFERENCES anomaly(id)
)