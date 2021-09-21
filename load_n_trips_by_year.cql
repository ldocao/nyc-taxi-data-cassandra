COPY trip.trip_information (
    EXTRACT_YEAR(CAST(pickup_datetime AS TEXT)) AS year,
    trip_id
)
TO 'temp_n_trips_by_year.csv';


COPY trip.n_trips_by_year (
    year,
    trip_id
)
FROM 'temp_n_trips_by_year.csv';