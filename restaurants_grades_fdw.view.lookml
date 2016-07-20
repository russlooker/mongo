- view: restaurants_grades_fdw
  sql_table_name: public.restaurants_grades_fdw
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

  - dimension_group: grades
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}."grades.date"

  - dimension: grades_grade
    type: string
    sql: ${TABLE}."grades.grade"

  - dimension: grades_idx
    type: number
    value_format_name: id
    sql: ${TABLE}.grades_idx

  - dimension: grades_score
    type: number
    sql: ${TABLE}."grades.score"

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

