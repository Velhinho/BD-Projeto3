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
            WHERE tmstmp BETWEEN '2019-01-01 0:00:00' AND '2019-06-01 0:00:00'
            GROUP BY regular_user.user_email
    );


--Utilizadores que registaram em 2019 incidencias em todos os locais publicos a norte de Rio Maior
SELECT user_email
    FROM (
        SELECT user_email, latitude, longitude 
            FROM incident 
            JOIN item 
                ON item.id = incident.item_id 
            GROUP BY user_email, longitude, latitude
        ) AS u
    GROUP BY u.user_email
    HAVING count(u.user_email) = (SELECT count(*) 
        FROM public_location 
        WHERE latitude > 39.3);

--A todos os users que registaram incidencias, tiramos os que apresentaram proposta de correcao.
--A parte do ano não sei como se faz
--STILL NOT WORKING, MAS ON THE WORKS
SELECT user_table.user_email
    FROM user_table
    JOIN qualified_user
        ON user_table.user_email = qualified_user.user_email
    JOIN incident
        ON incident.user_email = qualified_user.user_email
    JOIN item 
        ON incident.id = item.id
    WHERE NOT EXISTS(
        SELECT user_table.user_email
        FROM user_table
        JOIN qualified_user
            ON user_table.user_email = qualified_user.user_email
        JOIN incident
            ON incident.user_email = qualified_user.user_email
        JOIN correction_proposal
            ON correction_proposal.user_email = qualified_user.user_email
    ) 
    AND longitude < 39.336775
;

SELECT *
    FROM user_table
    JOIN qualified_user
        ON user_table.user_email = qualified_user.user_email
    JOIN incident
        ON incident.user_email = qualified_user.user_email
    JOIN item 
        ON incident.item_id = item.id
    
    
