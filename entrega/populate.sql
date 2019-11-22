INSERT INTO public_location value (latitude, longitude, location_name);

INSERT INTO item value (
    id,
    description_text,
    location_name,
    latitude,
    longitude
);

INSERT INTO anomaly value (
    id,
    area,
    image_path,
    lang,
    tmstmp,
    description_text,
    has_wording_anomaly,
);

INSERT INTO translation_anomaly value (id, area2, lang2);

INSERT INTO duplicate value (item1, item2);

INSERT INTO user_table value (user_email, user_password);

INSERT INTO qualified_user value (user_email);

INSERT INTO regular_user value (user_email);

INSERT INTO incident value (anomaly_id, item_id, user_email);

INSERT INTO correction_proposal value (user_email, nro);

INSERT INTO correction value (user_email, nro, anomaly_id);