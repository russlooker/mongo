- view: journey
  derived_table:
    sql_trigger_value: select current_date
    indexes: [id]
    sql: |
      SELECT
        row_number() as id
        ,to_timestamp(L."locations.timestampMs"::bigint/1000) AS current_time
        ,L."locations.velocity"
        ,L."locations.latitudeE7"*1.0/10000000 AS current_lat
        ,L."locations.longitudeE7"*1.0/10000000 AS current_lng
        ,lag(to_timestamp(L."locations.timestampMs"::bigint/1000)) over (order by to_timestamp(L."locations.timestampMs"::bigint/1000)) as previous_time
        ,lag(L."locations.latitudeE7"*1.0/10000000) over (order by to_timestamp(L."locations.timestampMs"::bigint/1000))as previous_lat
        ,lag(L."locations.longitudeE7"*1.0/10000000) over (order by to_timestamp(L."locations.timestampMs"::bigint/1000)) as previous_lng
        
      FROM
        public.locations_locations L

  fields:
  - measure: count
    type: count
    drill_fields: detail*

  - dimension: current_time
    type: time
    timeframes: [year, month, date]
    sql: ${TABLE}."current_time"

  - dimension: current_lat
    type: number
    sql: ${TABLE}.current_lat

  - dimension: current_lng
    type: number
    sql: ${TABLE}.current_lng

  - dimension: current_location
    type: location
    sql_longitude: ${current_lng}
    sql_latitude:  ${current_lat}
    
  - dimension: previous_location
    type: location
    sql_longitude: ${previous_lng}
    sql_latitude: ${previous_lat}

  - dimension: previous_time
    type: time
    timeframes: [year, month, date, hour, time]
    sql: ${TABLE}.previous_time

  - dimension: previous_lat
    type: number
    sql: ${TABLE}.previous_lat

  - dimension: previous_lng
    type: number
    sql: ${TABLE}.previous_lng

  - dimension: locations_velocity
    type: number
    sql: ${TABLE}."locations.velocity"

  - measure: average_velocity
    type: avg
    sql: ${locations_velocity}

  sets:
    detail:
      - current_time
      - current_lat
      - current_lng
      - previous_time
      - previous_lat
      - previous_lng

