- view: restaurants
  sql_table_name: public.restaurants
  fields:

  - dimension: restaurant_id
    primary_key: true
    type: string
    sql: ${TABLE}.restaurant_id

  - dimension: _id
    type: string
    sql: ${TABLE}._id

  - dimension: address_building
    type: string
    sql: ${TABLE}."address.building"

  - dimension: address_street
    type: string
    sql: ${TABLE}."address.street"

  - dimension: address_zipcode
    type: string
    sql: ${TABLE}."address.zipcode"

  - dimension: borough
    type: string
    sql: ${TABLE}.borough

  - dimension: cuisine
    type: string
    sql: ${TABLE}.cuisine

  - dimension: name
    type: string
    sql: ${TABLE}.name

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - restaurant_id
    - name
    - restaurants_address_coord.count
    - restaurants_address_coord_fdw.count
    - restaurants_fdw.count
    - restaurants_grades.count
    - restaurants_grades_fdw.count

