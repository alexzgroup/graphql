```{
     set_city(name:"Omsk",phone: 777888999){
       name
     }
   }
   
   
   {
     get_city(id:1){
       id
       name
       phone
       stations{
         id
         name
       }
     }
   }
   
   {
     set_station(name:"Station 1",city_id:1){
       name
     }
   }
   
   {
     get_station(id:1){
       id
       name
       city_id
     }
   }`