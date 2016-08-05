- view: restaurants_grades
  sql_table_name: public.restaurants_grades
  fields:

  - dimension: pk
    hidden: true
    primary_key: true
    type: string
    sql: ${TABLE}._id || '-' || ${TABLE}.grades_idx

  - dimension: address_building
    hidden: true
    type: string
    sql: ${TABLE}."address.building"

  - dimension: address_street
    hidden: true
    type: string
    sql: ${TABLE}."address.street"

  - dimension: address_zipcode
    hidden: true
    type: string
    sql: ${TABLE}."address.zipcode"

  - dimension: borough
    hidden: true
    type: string
    sql: ${TABLE}.borough

  - dimension: cuisine
    hidden: true
    type: string
    sql: ${TABLE}.cuisine

  - dimension_group: grades
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}."grades.date"

  - dimension: grades_grade
    hidden: true
    type: string
    sql: ${TABLE}."grades.grade"

  - dimension: grades_idx
    hidden: true
    type: number
    value_format_name: id
    sql: ${TABLE}.grades_idx

  - dimension: grades_score
    type: number
    sql: ${TABLE}."grades.score"

  - dimension: name
    hidden: true
    type: string
    sql: ${TABLE}.name

  - dimension: restaurant_id
    type: string
    sql: ${TABLE}.restaurant_id

  - measure: count
    type: count
    drill_fields: [name, restaurants.name, restaurants.restaurant_id]
    
  - measure: average_score
    type: avg
    sql: ${grades_score}

