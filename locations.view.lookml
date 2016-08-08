- view: locations
  sql_table_name: public.locations_locations

  fields:
  - measure: count
    type: count
    drill_fields: detail*

  - dimension: _id
    type: string
    sql: ${TABLE}._id

  - dimension: locations_accuracy
    type: number
    sql: ${TABLE}."locations.accuracy"

  - dimension: locations_altitude
    type: number
    sql: ${TABLE}."locations.altitude"

  - dimension: locations_heading
    type: number
    sql: ${TABLE}."locations.heading"

  - dimension: locations_latitude_e7
    type: number
    sql: ${TABLE}."locations.latitudeE7"

  - dimension: locations_longitude_e7
    type: number
    sql: ${TABLE}."locations.longitudeE7"

  - dimension: lat
    type: number
    sql: ${locations_latitude_e7}*1.0/10000000

  - dimension: lng
    type: number
    sql: ${locations_longitude_e7}*1.0/10000000

  - dimension: location
    type: location
    sql_latitude: ${lat}
    sql_longitude: ${lng}

  - dimension_group: locations_timestamp_ms
    type: time
    timeframes: [year, month, week, date, hour, time, hour_of_day]
    sql: to_timestamp(${TABLE}."locations.timestampMs"::bigint/1000)

  - dimension: locations_velocity
    type: number
    sql: ${TABLE}."locations.velocity"
    
  - measure: average_velocity
    type: avg
    sql: ${locations_velocity}

  - dimension: locations_vertical_accuracy
    type: number
    sql: ${TABLE}."locations.verticalAccuracy"

  - dimension: locations_idx
    type: number
    sql: ${TABLE}.locations_idx

  sets:
    detail:
      - _id
      - locations_accuracy
      - locations_altitude
      - locations_heading
      - locations_latitude_e7
      - locations_longitude_e7
      - locations_timestamp_ms
      - locations_velocity
      - locations_vertical_accuracy
      - locations_idx

