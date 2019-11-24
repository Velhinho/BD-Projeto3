-- public locations and anomalies
SELECT public_location.location_name, incident.anomaly_id
    FROM public_location
    NATURAL JOIN item
    INNER JOIN incident
        ON incident.item_id = item.id;

-- number of anomalies per location in descending order
SELECT public_location.location_name,
        count(incident.anomaly_id) AS anomaly_count
    FROM public_location
    NATURAL JOIN item
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
            NATURAL JOIN item
            INNER JOIN incident
                ON incident.item_id = item.id
            GROUP BY public_location.location_name
    ) AS anomalies_per_location;
