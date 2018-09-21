
require('./bootstrap');

window.Vue = require('vue');


Vue.component('example-component', require('./components/ExampleComponent.vue'));

const app = new Vue({
    el: '#app'

    data:{
    	message:''
    },

    methods:{
    	send(){
    		if(this.message.length !=0){
    		console.log(this.message);
    		
    		}
    	}
    }
});
