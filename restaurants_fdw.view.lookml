- view: restaurants_fdw
  sql_table_name: public.restaurants_fdw
  fields:

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

  - dimension: restaurant_id
    type: string
    # hidden: true
    sql: ${TABLE}.restaurant_id

  - measure: count
    type: count
    drill_fields: [name, restaurants.name, restaurants.restaurant_id]

