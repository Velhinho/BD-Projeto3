-- Public location with the most anomalies 1)
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

-- Regular User with the most reported anomalies 2)
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
            WHERE tmstmp BETWEEN '2019-01-01 0:00:00' AND '2019-06-01 0:00:00'
            GROUP BY regular_user.user_email
    );

--Utilizadores que registaram em 2019 incidencias em todos os locais publicos a norte de Rio Maior 3)
SELECT user_email
    FROM (SELECT DISTINCT user_email, item.longitude, item.latitude
        FROM public_location
            LEFT JOIN item
            ON public_location.longitude = item.longitude
            AND public_location.latitude = item.latitude
            JOIN incident
            ON item.id = incident.item_id
            JOIN anomaly
            ON anomaly.id = incident.anomaly_id
        WHERE item.latitude > 39.336775
            AND EXTRACT( YEAR FROM tmstmp) =2019
        GROUP BY user_email, item.longitude, item.latitude) a
    GROUP BY user_email
    HAVING count(*) = (
        SELECT count(*)
        FROM public_location
        WHERE latitude> 39.336775
    );


 --4)
SELECT DISTINCT user_email
    FROM qualified_user
    EXCEPT
    SELECT correction_proposal.user_email
        FROM qualified_user 
        INNER JOIN correction_proposal 
            ON correction_proposal.user_email = qualified_user.user_email 
        INNER JOIN correction 
            ON correction.nro = correction_proposal.nro 
        INNER JOIN anomaly 
            ON anomaly.id = correction.anomaly_id 
        INNER JOIN incident 
            ON incident.anomaly_id = anomaly.id 
        INNER JOIN item 
            ON item.id = incident.item_id
        WHERE item.latitude > 39.336775 
        AND EXTRACT(YEAR FROM anomaly.tmstmp) = date_part('year', CURRENT_DATE);