- connection: mongo

- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards

- explore: restaurants
  joins:
    - join: restraunt_location
      type: left_outer
      relationship: one_to_one
      sql_on: ${restaurants.restaurant_id} = ${restraunt_location.restaurant_id}
      
    - join: restaurants_grades
      type: left_outer 
      sql_on: ${restaurants.restaurant_id} = ${restaurants_grades.restaurant_id} 
      relationship: one_to_many


- explore: users


- explore: locations

- explore: journey