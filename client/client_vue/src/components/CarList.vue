<template>
                   
        
        <div v-if="shortInfoCars">
          <table class="table">
            <tr v-for="car in cars">
              <td>
                <img alt="car" class="car-img"  :src="car.img" 
                    @click="autoInfo(car.id)"/>
              </td>
              <td>{{ car.brand }}</td>
              <td>{{ car.model }}</td>
            </tr>
          </table>
        </div>
     
  
</template>

<script>
import axios from 'axios';
export default {
  name: 'carList',
  data () {
    return {
      config: {
          headers: {'Content-Type': 'application/x-www-form-urlencoded'}
      },
     /* models : {},
      brands : {},
      colors: {},
      model : '-',
      brand: '-',
      color: '-',
      year_from: '-',
      year_to: '-',
      speed_from: '-',
      speed_to: '-',
      engine_capacity_from: '-',
      engine_capacity_to: '-',
      price_from: '-',
      price_to: '-',*/
      cars: {},
      carsAll: {}, 
      shortInfoCars: false,
      //self.fullInfoCarRedirect : false,
      err_year: "",
      err_work: "",
      err_param:"",
      error_str : "We apologize, we have temporary problems with the service. return to us later"
  }
},
  created(){
    var self = this
    
      axios.get('http://localhost:88/REST/client/api/cars/', this.config)
      // axios.get('http://192.168.0.15/~user15/REST/client/api/cars/', this.config)
            .then(function (response) {
              
              var data = response.data
                //console.log(data.cars)
                self.cars = data.cars
                //self.models = data.models
                //self.brands = data.brands
                //self.colors = data.colors
                //if( cars['status']== "200"){
                    self.carsAll = data.cars
                    self.shortInfoCars = true
                //}else{
                   // self.err_work = error_str
                   // self.is_not_err_work = false;
                //}
                
        console.log(response.data);
      })
      .catch(function (error) {
        console.log(error);
        self.err_work = self.error_str
        self.is_not_err_work = false;
      });
  },
  methods: {
    
        
  },
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.filter-form{
	margin-bottom:20px;
}

.filter-form label{
   font-weight: bold;
}

.centr{
	text-align:center;
}

.car-img{
   max-height:100px;
   max-width:100px;
   cursor:pointer;
}

.bold{
    font-weight: bold;
}

.panel_table td{
    text-align: left;
}


.left{
    text-align:left;
}

.add_bag_btn{
	background-color : black;
	color: white;
  width: 100%;
}

</style>
