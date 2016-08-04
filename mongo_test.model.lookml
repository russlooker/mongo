- connection: mongo

- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards

- explore: restaurants

- explore: restaurants_address_coord
  joins:
    - join: restaurants
      type: left_outer 
      sql_on: ${restaurants_address_coord.restaurant_id} = ${restaurants.restaurant_id}
      relationship: many_to_one


- explore: restaurants_address_coord_fdw
  joins:
    - join: restaurants
      type: left_outer 
      sql_on: ${restaurants_address_coord_fdw.restaurant_id} = ${restaurants.restaurant_id}
      relationship: many_to_one


- explore: restaurants_fdw
  joins:
    - join: restaurants
      type: left_outer 
      sql_on: ${restaurants_fdw.restaurant_id} = ${restaurants.restaurant_id}
      relationship: many_to_one


- explore: restaurants_grades
  joins:
    - join: restaurants
      type: left_outer 
      sql_on: ${restaurants_grades.restaurant_id} = ${restaurants.restaurant_id}
      relationship: many_to_one


- explore: restaurants_grades_fdw
  joins:
    - join: restaurants
      type: left_outer 
      sql_on: ${restaurants_grades_fdw.restaurant_id} = ${restaurants.restaurant_id}
      relationship: many_to_one


- explore: users

- explore: users_fdw

