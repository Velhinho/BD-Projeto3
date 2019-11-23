-- locais publicos e anomalias
SELECT location_name, anomaly_id 
FROM public_location
    NATURAL JOIN item
    NATURAL JOIN incident;

-- numero de anomalias por local publico
SELECT location_name, count(anomaly_id)
FROM public_location
    NATURAL JOIN item
    NATURAL JOIN incident
GROUP BY location_name;

-- Max number of anomalies in a public place
SELECT max(count)
FROM (
    SELECT location_name, count(anomaly_id)
    FROM public_location
        NATURAL JOIN item
        NATURAL JOIN incident
    GROUP BY location_name
) AS anomalies_per_location;

-- Public place with the most anomalies
SELECT location_name
FROM public_location
    NATURAL JOIN item
    NATURAL JOIN incident
GROUP BY location_name
HAVING count(anomaly_id) = (
    SELECT max(count)
    FROM (
        SELECT location_name, count(anomaly_id)
        FROM public_location
            NATURAL JOIN item
            NATURAL JOIN incident
        GROUP BY location_name
    ) AS anomalies_per_location
);


/*
-- anomalias de traducao no 1 semestre de 2019
SELECT anomaly_id
FROM anomaly NATURAL JOIN translation_anomaly
WHERE tmstmp >= timestamp '2019-01-01'
    AND tmstmp <= timestamp '2019-06-01'

-- regular users that registered anomalies
SELECT user_email
FROM incident NATURAL JOIN regular_user

-- regular users that registered translation anomalies
-- in the first semestre of 2019
SELECT user_email, anomaly_id
FROM anomaly 
    NATURAL JOIN translation_anomaly
    NATURAL JOIN incident
    NATURAL JOIN regular_user
WHERE tmstmp >= timestamp '2019-01-01'
    AND tmstmp <= timestamp '2019-06-01'


-- Number of registed translation anomalies in the first semestre of 2019
-- Done by regular users
SELECT user_email, count(*)
FROM (
    SELECT user_email, anomaly_id
    FROM anomaly 
        NATURAL JOIN translation_anomaly
        NATURAL JOIN incident
        NATURAL JOIN regular_user
    WHERE tmstmp >= timestamp '2019-01-01'
        AND tmstmp <= timestamp '2019-06-01'
)
GROUP BY user_email
*/

SELECT user_email, max(*)
FROM (
    SELECT user_email, count(*)
    FROM (
        SELECT user_email, anomaly_id
        FROM anomaly 
            NATURAL JOIN translation_anomaly
            NATURAL JOIN incident
            NATURAL JOIN regular_user
        WHERE tmstmp >= timestamp '2019-01-01 00:00:00'
            AND tmstmp <= timestamp '2019-06-01 00:00:00'
    )
    GROUP BY user_email
);
