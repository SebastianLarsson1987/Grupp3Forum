<template>
    <div class="row d-flex justify-content-center">
        <div class="col-md-8 mt-5">
            <h5 class="card-header"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-person-plus-fill" viewBox="0 0 16 16">
  <path d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
  <path fill-rule="evenodd" d="M13.5 5a.5.5 0 0 1 .5.5V7h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V8h-1.5a.5.5 0 0 1 0-1H13V5.5a.5.5 0 0 1 .5-.5z"/>
</svg>
Register</h5>
            <br>
            <form @submit.prevent="onSubmit">
                <div class="form-group mb-3">
                    <label><strong>UserName</strong></label>
                    <input
                        type="text"
                        class="form-control form-control-lg"
                        v-model="user.name"
                    />
                </div>

                <div class="form-group mb-3">
                    <label><strong>Email</strong></label>
                    <input
                        type="email"
                        class="form-control form-control-lg"
                        v-model="user.email"
                    />
                </div>

                <div class="form-group mb-3">
                    <label><strong>Password</strong></label>
                    <input
                        type="password"
                        class="form-control form-control-lg"
                        v-model="user.password"
                    />
                </div>

                <div class="d-grid">
                    <input
                        type="submit"
                        class="btn btn-primary btn-lg btn-block"
                        value="Register User"
                    />
                </div>
            </form>

            <div style="position:absolute;"  >
 
                <router-link style="color:black;"  class="nav-link link-light" to="/gdpr">
                     <div class="form-check">
                    <input class="form-check-input" type="radio" name="flexRadioDisabled" id="flexRadioCheckedDisabled" checked disabled>
                    <label  class="form-check-label" for="flexRadioCheckedDisabled">
                    By clicking submit you agree to the privacy policy. Read more - GDPR
                </label>
                </div>
                </router-link>
            </div>

        </div>
    </div>
</template>

<script>
import firebase from 'firebase';
import router from '../../router';
import { register, resetPassword } from "../../assets/js/firebase";
// import store from '../../store';

export default {
    data() {
        return {
            uid: "",
            user: {
                name: '',
                email: '',
                password: '',
                
            },
            
        };
    },
    methods: {
        onSubmit() {
            
            let credential = {email: this.user.email, name: this.user.name};
            firebase
                .auth()
                .createUserWithEmailAndPassword(
                    this.user.email,
                    this.user.password,
                    
                )
                .then(function(data){
                    let guid = data.user.uid
                    this.uid = guid
                    console.log("cred", credential)
                    console.log("success")
                    router.push('/dashboard')
                    this.addNewUser(credential)
                    
                    
                })
                .catch((error)=>{
                    console.log(error.code)
                    alert(error.message)
                })
                
               
        },
        registerUser() {
      register(this.user.email, this.user.userName, this.user.password);
    },
    reset() {
      resetPassword(this.passwordReset);
    },
        async addNewUser(credentials){
        console.log("metod", credentials)
        console.log('id', this.uid)
        
        await fetch("https://localhost:44362/api/User/AddUser", {
            method: 'POST',
            headers:{
            'Accept': 'application/json',
            'Content-Type': "application/json"
          },
            body: JSON.stringify({email: credentials.email, userName: credentials.name, Id:credentials.uid})
        })
        

    }
        
    },
    
};
</script>
