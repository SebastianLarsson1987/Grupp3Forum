// code from our Firebase console 
// Import the functions you need from the SDKs you need
// https://firebase.google.com/docs/web/setup#available-libraries
import { initializeApp } from "firebase/app";
import { getAuth, signInWithEmailAndPassword, createUserWithEmailAndPassword, signOut, deleteUser, sendPasswordResetEmail } from "firebase/auth";

// Your web app's Firebase configuration
const firebaseConfig = {
    apiKey: "AIzaSyBWnqs4fGVQ7b1h_3cIbmvq6jdCEAspW9E",
    authDomain: "grupp3forum.firebaseapp.com",
    projectId: "grupp3forum",
    storageBucket: "grupp3forum.appspot.com",
    messagingSenderId: "544976868582",
    appId: "1:544976868582:web:c2742c1d0a63e0af0c9727"
};

// Initialize Firebase
const firebaseApp = initializeApp(firebaseConfig);
const auth = getAuth(firebaseApp);

// Register
const register = async (regEmail, username, password) => {

    try {
      let user = await createUserWithEmailAndPassword(auth, regEmail, password)
        console.log("user" , user)
        await fetch("https://localhost:44362/api/User/AddUser", {
            method: 'POST',
            headers:{
            'Accept': 'application/json',
            'Content-Type': "application/json"
          },
            body: JSON.stringify({email: user.email, userName: user.name})
        })
        alert("Successfully registered!");
    } catch (err) {
        console.error(err);
        alert(err);
    }
};

// Reset password
const resetPassword = async (email) => {
    try {
        await sendPasswordResetEmail(auth, email);
        alert("Password reset link sent!");
    }
    catch (error) {
        console.error(error);
        alert(error.message);
    }

}

// Log in
const logIn = async (newEmail, username, password) => {
    try {
        await signInWithEmailAndPassword(auth, newEmail, password);
    } catch (err) {
        console.error(err);
        alert(err.message);
    }
};

// Log out
const logOut = () => {
    signOut(auth);
}

// Remove
const remove = async () => {
    try {
        const user = auth.currentUser;
        await deleteUser(user);
        let url = new URL("/api/user/remove");
        let param = new URLSearchParams(`email=${user.email}`);
        url.searchParams = param;
        const removeFromDb = await fetch(url);
        console.log(removeFromDb.status);
    } catch (err) {
        console.error(err);
        alert(err.message);
    }
}

export {
    auth,
    register,
    remove,
    logIn,
    logOut,
    resetPassword
}