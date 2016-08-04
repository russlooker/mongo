- view: users_fdw
  sql_table_name: public.users_fdw
  fields:

  - dimension: _id
    type: string
    sql: ${TABLE}._id

  - dimension: age
    type: number
    sql: ${TABLE}.age

  - dimension: name
    type: string
    sql: ${TABLE}.name

  - dimension: status
    type: string
    sql: ${TABLE}.status

  - measure: count
    type: count
    drill_fields: [name]

