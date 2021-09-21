COPY trip.trip_information (
    trip_id,
    max_temperature
)
TO 'temp_n_trips_by_max_temperature.csv';


COPY trip.n_trips_by_max_temperature (
    max_temperature,
    trip_id
)
FROM 'temp_n_trips_by_max_temperature.csv';