<template>

<div class="container">
  <div class="row">
    <div class="col-sm">
      <br>
      <br>
       <h5 class="card-header">
      <svg
        xmlns="http://www.w3.org/2000/svg"
        width="20"
        height="20"
        fill="currentColor"
        class="bi bi-house-fill"
        viewBox="0 0 16 16"
      >
        <path
          fill-rule="evenodd"
          d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293l6-6zm5-.793V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z"
        />
        <path
          fill-rule="evenodd"
          d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z"
        />
      </svg>
      Forum
    </h5>

<div class="card-body">

<p>Välkommen till forumet {{ user.displayName }}!</p> 
<p>Besök gärna någon av forumets underkategorier.</p>

<a href="/#Resor">Resor</a> |
<a href="/#Träning">Träning</a> |
<a href="/#Bilar">Bilar</a> |
<a href="/#Ekonomi">Ekonomi</a> |
<a href="/#IT/Datorer">IT/Datorer</a> 

</div>

 
  <br>

 
    <div class="col-sm">
          <h5 class="card-header">
      <svg
        xmlns="http://www.w3.org/2000/svg"
        width="20"
        height="20"
        fill="currentColor"
        class="bi bi-house-fill"
        viewBox="0 0 16 16"
      >
        <path
          fill-rule="evenodd"
          d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293l6-6zm5-.793V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z"
        />
        <path
          fill-rule="evenodd"
          d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z"
        />
      </svg>
      Profil
    </h5>
    </div>


    
    <div class="card-body">
      <p>Du kan ändra dina profilinställningar på profilsidan.</p>
      <p class="card-text"><strong>Användarnamn:</strong> {{ user.displayName }}</p>
      <p class="card-text"><strong>E-Post: </strong>{{ user.email }}</p>
      <router-link class="btn btn-primary"  :to="`/profilesettings/${uid}`">Profil</router-link> 
      <br>
    </div>
    <br>
    <h5 class="card-header">
      <svg
        xmlns="http://www.w3.org/2000/svg"
        width="20"
        height="20"
        fill="currentColor"
        class="bi bi-house-fill"
        viewBox="0 0 16 16"
      >
        <path
          fill-rule="evenodd"
          d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293l6-6zm5-.793V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z"
        />
        <path
          fill-rule="evenodd"
          d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z"
        />
      </svg>
      FAQ , GDPR & Regler
    </h5>
    
    <div class="card-body">
    <p>Vill du läsa mera om: FAQ, GDPR & Regler kan du göra det här.</p>
    <a href="/FAQ">FAQ</a> |
    <a href="/GDPR">GDPR</a> |
    <a href="/Regler">Regler</a> |
    
    </div>

  
    <br>
    <h5 class="card-header">
      <svg
        xmlns="http://www.w3.org/2000/svg"
        width="20"
        height="20"
        fill="currentColor"
        class="bi bi-house-fill"
        viewBox="0 0 16 16"
      >
        <path
          fill-rule="evenodd"
          d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293l6-6zm5-.793V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z"
        />
        <path
          fill-rule="evenodd"
          d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z"
        />
      </svg>
      Logga Ut
    </h5>
    
    <div class="card-body">
    <p>Vill du logga ut från forumet?</p>
    <a href="#" class="btn btn-primary" @click="signOut()">Logga ut</a>
    </div>

  </div>
  

</div>
    
  
</div>
 


  
 
 
  
</template>

<script>
// import firebase from "firebase";

import { auth, logOut } from "../../assets/js/firebase";

export default {
  data() {
    return {
      user: '',
    };
  },
  created() {
    auth.onAuthStateChanged((user) => {
      if (user) {
        this.user = user;
      } else {
        this.user = '';
      }
    });
  },
  methods: {
    signOut() {
      logOut();
      this.$router.push("/")
    }
  }
};
</script>

