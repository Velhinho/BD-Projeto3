-- Public location with the most anomalies
SELECT public_location.location_name,
        count(incident.anomaly_id) AS anomaly_count
    FROM public_location
    INNER JOIN item
        ON item.latitude = public_location.latitude
        AND item.longitude = public_location.longitude
    INNER JOIN incident
        ON incident.item_id = item.id
    GROUP BY public_location.location_name
    HAVING count(incident.anomaly_id) >= all (
        SELECT count(incident.anomaly_id) AS anomaly_count
        FROM public_location
        INNER JOIN item
            ON item.latitude = public_location.latitude
            AND item.longitude = public_location.longitude
        INNER JOIN incident
            ON incident.item_id = item.id
        GROUP BY public_location.location_name
    );

-- Regular User with the most reported anomalies
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
    HAVING count(anomaly.id) >= all (
        SELECT count(anomaly.id) AS anomaly_count
            FROM anomaly
            INNER JOIN translation_anomaly
                ON anomaly.id = translation_anomaly.id
            INNER JOIN incident
                ON incident.anomaly_id = anomaly.id
            INNER JOIN regular_user
                ON incident.user_email = regular_user.user_email
            WHERE tmstmp BETWEEN '2019-01-01' AND '2019-06-01'
            GROUP BY regular_user.user_email
    );