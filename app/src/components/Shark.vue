<template>
    <div>
        <button type="button" class = "btn btn-primary">{{ msg }}</button>
    </div>
</template>


<script>
import axios from 'axios';
export default {
    name:'Shark',
    data() {
        return {
            msg : ""
        };
    },
    methods : {
        getReponse(){
            const path = 'http://139.162.28.246:5002/person/';
            axios.get(path)
            .then ((res) => { 
                console.log(res.data)
                this.msg = res.data;
            }) 
            .catch ((err) => {
                console.error(err);
            });
        },
    },
    created(){
        this.getReponse();
    }
}
</script>