- view: restraunt_location
  derived_table:
    sql_trigger_value: select 1
    indexes: [restaurant_id]
    sql: |
      SELECT 
         idx0.restaurant_id
        ,idx1."address.coord" AS lat
        ,idx0."address.coord" AS lng
      FROM 
        public.restaurants_address_coord_fdw idx0
        LEFT JOIN public.restaurants_address_coord_fdw idx1 ON (
                                                                  idx0.restaurant_id = idx1.restaurant_id
                                                                    )
      WHERE
            idx0."address.coord_idx" = 0
        AND idx1."address.coord_idx" = 1

  fields:

  - dimension: restaurant_id
    type: string
    sql: ${TABLE}.restaurant_id

  - dimension: location
    type: location
    sql_latitude: ${TABLE}.lat
    sql_longitude: ${TABLE}.lng

  sets:
    detail:
      - restaurant_id
      - lat
      - lng
      - location

