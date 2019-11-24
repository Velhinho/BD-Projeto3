-- Public location with the most anomalies
SELECT public_location.location_name,
        count(incident.anomaly_id) AS anomaly_count
    FROM public_location
    NATURAL JOIN item
    INNER JOIN incident
        ON incident.item_id = item.id
    GROUP BY public_location.location_name
    HAVING count(incident.anomaly_id) = (
        SELECT max(anomaly_count)
            FROM (
                SELECT public_location.location_name,
                        count(incident.anomaly_id) AS anomaly_count
                    FROM public_location
                    NATURAL JOIN item
                    INNER JOIN incident
                        ON incident.item_id = item.id
                    GROUP BY public_location.location_name
            ) AS anomalies_per_location
    );

-- Regular User with the most reported anomalies
SELECT user_table.user_email, count(anomaly.id) AS anomaly_count
    FROM anomaly
    INNER JOIN incident
        ON incident.anomaly_id = anomaly.id
    INNER JOIN user_table
        ON incident.user_email = user_table.user_email
    WHERE tmstmp <= timestamp '2019-06-01'
    GROUP BY user_table.user_email
    HAVING count(anomaly.id) = (
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
                    WHERE tmstmp <= timestamp '2019-06-01'
                    GROUP BY regular_user.user_email
            ) AS anomalies_per_user
    );
