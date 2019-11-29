-- public locations and anomalies
SELECT public_location.location_name, incident.anomaly_id
    FROM public_location
    INNER JOIN item
        ON item.latitude = public_location.latitude
        AND item.longitude = public_location.longitude
    INNER JOIN incident
        ON incident.item_id = item.id;

-- number of anomalies per location in descending order
SELECT public_location.location_name,
        count(incident.anomaly_id) AS anomaly_count
    FROM public_location
    INNER JOIN item
        ON item.latitude = public_location.latitude
        AND item.longitude = public_location.longitude
    INNER JOIN incident
        ON incident.item_id = item.id
    GROUP BY public_location.location_name
    ORDER BY anomaly_count DESC;

-- Max number of anomalies in a public_location
SELECT max(anomaly_count)
    FROM (
        SELECT public_location.location_name,
                count(incident.anomaly_id) AS anomaly_count
            FROM public_location
            INNER JOIN item
                ON item.latitude = public_location.latitude
                AND item.longitude = public_location.longitude
            INNER JOIN incident
                ON incident.item_id = item.id
            GROUP BY public_location.location_name
    ) AS anomalies_per_location;



-- Translation anomalies in the first semestre of 2019
SELECT anomaly.id, tmstmp
    FROM anomaly
    INNER JOIN translation_anomaly
        ON anomaly.id = translation_anomaly.id
    WHERE tmstmp BETWEEN '2019-01-01' AND '2019-06-01';

-- Regular users that reported
-- Translation anomalies in the first semestre of 2019
SELECT anomaly.id, anomaly.tmstmp, regular_user.user_email
    FROM anomaly
    INNER JOIN translation_anomaly
        ON anomaly.id = translation_anomaly.id
    INNER JOIN incident
        ON incident.anomaly_id = anomaly.id
    INNER JOIN regular_user
        ON incident.user_email = regular_user.user_email
    WHERE tmstmp BETWEEN '2019-01-01' AND '2019-06-01';

-- Number of reported translation anomalies per regular user
SELECT regular_user.user_email, count(anomaly.id) AS anomaly_count
    FROM anomaly
    INNER JOIN translation_anomaly
        ON anomaly.id = translation_anomaly.id
    INNER JOIN incident
        ON incident.anomaly_id = anomaly.id
    INNER JOIN regular_user
        ON incident.user_email = regular_user.user_email
    WHERE tmstmp BETWEEN '2019-01-01' AND '2019-06-01'
    GROUP BY regular_user.user_email;

-- all anomalies per all users
SELECT user_table.user_email, count(anomaly.id) AS anomaly_count
    FROM anomaly
    INNER JOIN incident
        ON incident.anomaly_id = anomaly.id
    INNER JOIN user_table
        ON incident.user_email = user_table.user_email
    WHERE tmstmp BETWEEN '2019-01-01' AND '2019-06-01'
    GROUP BY user_table.user_email;

-- Max number of reported translation anomalies
-- By regular users
SELECT max(anomaly_count)
    FROM (
        SELECT regular_user.user_email, count(anomaly.id) AS anomaly_count
            FROM anomaly
            INNER JOIN translation_anomaly
                ON anomaly.id = translation_anomaly.id
            INNER JOIN incident
                ON incident.anomaly_id = anomaly.id
            INNER JOIN regular_user
                ON incident.user_email = regular_user.user_email
            WHERE tmstmp BETWEEN '2019-01-01' AND '2019-06-01'
            GROUP BY regular_user.user_email
    ) AS anomalies_per_user;

-- Max number of reported all anomalies
-- By all users
SELECT max(anomaly_count)
    FROM (
        SELECT user_table.user_email, count(anomaly.id) AS anomaly_count
            FROM anomaly
            INNER JOIN incident
                ON incident.anomaly_id = anomaly.id
            INNER JOIN user_table
                ON incident.user_email = user_table.user_email
            WHERE tmstmp BETWEEN '2019-01-01' AND '2019-06-01'
            GROUP BY user_table.user_email
    ) AS anomalies_per_user;

-- User with the most reported anomalies
SELECT user_table.user_email, count(anomaly.id) AS anomaly_count
    FROM anomaly
    INNER JOIN incident
        ON incident.anomaly_id = anomaly.id
    INNER JOIN user_table
        ON incident.user_email = user_table.user_email
    WHERE tmstmp BETWEEN '2019-01-01' AND '2019-06-01'
    GROUP BY user_table.user_email
    HAVING count(anomaly.id) = (
        SELECT max(anomaly_count)
            FROM (
                SELECT user_table.user_email, count(anomaly.id) AS anomaly_count
                    FROM anomaly
                    INNER JOIN incident
                        ON incident.anomaly_id = anomaly.id
                    INNER JOIN user_table
                        ON incident.user_email = user_table.user_email
                    WHERE tmstmp BETWEEN '2019-01-01' AND '2019-06-01'
                    GROUP BY user_table.user_email
            ) AS anomalies_per_user
    );


-- Incidents registered above Rio Maior and in the current year
SELECT item.id, incident.user_email
    FROM item
    INNER JOIN incident
        ON incident.item_id = item.id
    INNER JOIN anomaly
        ON incident.anomaly_id = anomaly.id
    WHERE latitude < 39.3
    AND date_part('year', anomaly.tmstmp) = date_part('year', current_date);

-- All users that made a correction to each of their reported incidents
SELECT qualified_user.user_email, correction.anomaly_id
    FROM qualified_user
    INNER JOIN incident
        ON qualified_user.user_email = incident.user_email
    INNER JOIN correction_proposal
        ON qualified_user.user_email = correction_proposal.user_email
    INNER JOIN correction
        ON correction_proposal.user_email = correction.user_email;

SELECT qualified_user.user_email
    FROM qualified_user
    WHERE NOT EXISTS (
        SELECT qualified_user.user_email
            FROM qualified_user
        EXCEPT
        SELECT qualified_user.user_email
            FROM qualified_user
            INNER JOIN incident
                ON qualified_user.user_email = incident.user_email
            INNER JOIN correction_proposal
                ON qualified_user.user_email = correction_proposal.user_email
            INNER JOIN correction
                ON correction_proposal.user_email = correction.user_email
    );
