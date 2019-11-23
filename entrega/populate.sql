INSERT INTO public_location VALUES (latitude, longitude, location_name);

INSERT INTO item VALUES (
    id,
    description_text,
    location_name,
    latitude,
    longitude
);

INSERT INTO anomaly VALUES (
    id,
    area,
    image_path,
    lang,
    tmstmp,
    description_text,
    has_wording_anomaly,
);

INSERT INTO translation_anomaly VALUES (id, area2, lang2);

INSERT INTO duplicate VALUES (item1, item2);

INSERT INTO user_table VALUES (user_email, user_password);

INSERT INTO qualified_user VALUES (user_email);

INSERT INTO regular_user VALUES (user_email);

INSERT INTO incident VALUES (anomaly_id, item_id, user_email);

INSERT INTO correction_proposal VALUES (user_email);

INSERT INTO correction VALUES (user_email, anomaly_id);