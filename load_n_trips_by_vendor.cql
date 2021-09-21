COPY trip.trip_information (
    vendor_id,
    trip_id
)
TO 'temp_n_trips_by_vendor.csv';


COPY trip.n_trips_by_vendor (
    vendor_id,
    trip_id
)
FROM 'temp_n_trips_by_vendor.csv';