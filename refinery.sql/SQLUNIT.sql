USE refinery_db;

SELECT unit_id,
       SUM(feed_processed_tonnes) AS total_feed,
       SUM(total_energy_gj) AS total_energy,
       ROUND(SUM(total_energy_gj) / SUM(feed_processed_tonnes), 3) AS energy_intensity
FROM refinery
GROUP BY unit_id
ORDER BY energy_intensity DESC;