<template>
  <div id="app">
    <!--img src="./assets/logo.png"-->
     <div class="carlist container centr">
    <p class="bg-danger" id="err">{{err_work}}</p>
      <div class="row"> 

    <div class="col-sm-4 col-md-4">
          <div class="filter_selection  filter-form">
            <div class="form-group">
              <label>Year (obligatory):</label>
                <div class="row">
                  <p class="bg-danger" id="err" style="width: 100%">{{err_year}}</p>
                  <div class="col-sm-6 col-md-6">
                    <input type="text" class="form-control"placeholder="from"  v-model.trim="year_from">   
                  </div> 
                  <div class="col-sm-6 col-md-6">
                    <input type="text" class="form-control" placeholder="to" v-model.trim="year_to" @blur="changeSelect()">
                  </div>
                </div>
              </div>
            <div class="form-group">
              <select id="brands" class="form-control"  v-model="brand" @change="changeSelect()">
                <option value="-">brands</option>
                <option v-for="brand in brands" :value="brand.id">
                  {{brand.name}}
                </option>
              </select>
            </div>
            <div class="form-group">
              <select id="models" class="form-control"  v-model="model" @change="changeSelect()">
                <option value="-">models</option>
                <option v-for="model in models" :value="model.id">
                  {{model.name}}
                </option>
              </select>
            </div>
  
            <div class="form-group">
              <label>Engine capacity:</label>
              <div class="row">
                <div class="col-sm-6 col-md-6">
                  <input type="text" class="form-control"placeholder="from"  v-model.trim="engine_capacity_from">   
                </div> 
                <div class="col-sm-6 col-md-6">
                  <input type="text" class="form-control" placeholder="to" v-model.trim="engine_capacity_to" @blur="changeSelect()">
                </div>
              </div>
            </div>
            <div class="form-group">
              <label>Speed:</label>
              <div class="row">
                <div class="col-sm-6 col-md-6">
                  <input type="text" class="form-control"placeholder="from" v-model.trim="speed_from">   
                </div> 
                <div class="col-sm-6 col-md-6">
                  <input type="text" class="form-control" placeholder="to" v-model.trim="speed_to" @blur="changeSelect()">
                </div>
              </div>
            </div>
            <div class="form-group">
              <label>Price:</label>
              <div class="row">
                <div class="col-sm-6 col-md-6">
                  <input type="text" class="form-control"placeholder="from" v-model.trim="price_from">   
                </div> 
                <div class="col-sm-6 col-md-6">
                   <input type="text" class="form-control" placeholder="to" v-model.trim="price_to" @blur="changeSelect()">
                </div>
              </div>
            </div>
            <div class="form-group">
              <select id="color" v-model="color" class="form-control" @change="changeSelect()">
                <option value="-">colors</option>
                <option  v-for="color in colors" :value="color.id">
                  {{color.name}}
                </option>
              </select>
            </div> 
            <button class="btn add_bag_btn large" @click="changeSelect()">Filter</button>
           <button class="btn add_bag_btn large" @click="clearFilter()" style="margin-top:10px;">Clear filter</button>
        </div>
      </div>


      <div class="col-sm-8 col-md-8">
    <router-view/>
     </div>

      </div>
  </div>

  </div>
</template>

<script>
import axios from 'axios';
export default {
  name: 'app',
 data () {
    return {
      config: {
          headers: {'Content-Type': 'application/x-www-form-urlencoded'}
      },
      models : {},
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
      price_to: '-',
      //cars: {},
      //carsAll: {}, 
      //shortInfoCars: false,
      //self.fullInfoCarRedirect : false,
      err_year: "",
      err_work: "",
      err_param:"",
      error_str : "We apologize, we have temporary problems with the service. return to us later"
  }
},
  created(){
var self = this
     // axios.get('http://localhost:88/REST/client/api/cars/', this.config)
       axios.get('http://192.168.0.15/~user15/REST/client/api/cars/', this.config)
            .then(function (response) {
              
              var data = response.data
                //console.log(data.cars)
                //self.cars = data.cars
                self.models = data.models
                self.brands = data.brands
                self.colors = data.colors
                //if( cars['status']== "200"){
                    //self.carsAll = data.cars
                    //self.shortInfoCars = true
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
  methods:{
    changeSelect(){
        if(this.fullInfoCarRedirect == true)this.cars =  this.carsAll 
          if(this.year_from!='-' && this.year_to=='-') 
              this.year_to = this.year_from
          this.shortInfoCars = true
          var self = this          
          if(this.year_to == "-" || this.year_from == "-") this.err_year = "this parameter is required"
            else{
              this.err_year = ""
              if(this.speed_from!='-' && this.speed_to=='-') 
                 this.speed_to = this.speed_from
              if(this.price_from!='-' && this.price_to=='-') 
                 this.price_to = this.price_from
                
              if(this.engine_capacity_from!='-' && this.engine_capacity_to=='-') 
                 this.engine_capacity_to = this.engine_capacity_from

              var req_str = this.year_from+"/"+this.year_to+"/"
                +this.model+"/"+this.brand +"/"+this.engine_capacity_from+"/"+this.engine_capacity_to
                +"/"+this.speed_from+ "/"+this.speed_to+"/"+this.price_from+"/"+this.price_to+"/"+this.color+"/"

              axios.get("http://localhost:88/REST/client/api/cars/"+req_str, this.config)
              // axios.get('http://192.168.0.15/~user15/REST/client/api/cars/'+req_str, this.config)
                .then(function (response) {
                  var data = response.data
                       //if( data['sucess']== "1"){
                         self.cars = data//['cars']
                         //self.fullInfoCarRedirect = false
                      /* }else{
                        if(data['error']!=""){
                           //self.err_param = "The search has not given any results"
                           self.err_year = data['error']
                           //self.is_not_err_param = false;
                       }else{
                        self.err_work = error_str
                         self.is_not_err_work = false;
                        }*/
                       
                       //}
                  })
              .catch(function (error) {
                self.err_work = self.error_str
                self.is_not_err_work = false;
                console.log(error);
              });
            }
            
        },
        clearFilter(){
            this.model = '-'
            this.brand = '-'
            this.color = '-'
            this.year_from = '-'
            this.year_to = '-'
            this.speed_from = '-'
            this.speed_to = '-'
            this.engine_capacity_from = '-'
            this.engine_capacity_to = '-'
            this.price_from = '-'
            this.price_to = '-' 
            this.err_year = ''
            this.cars =  this.carsAll 
        }
  }
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}

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
