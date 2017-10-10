import Vue from 'vue'
import Router from 'vue-router'
import CarList from '@/components/CarList'
//import CarItem from '@/components/CarItem'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'carList',
      component: CarList
    }
  ]
})
