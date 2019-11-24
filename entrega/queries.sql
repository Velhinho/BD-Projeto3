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