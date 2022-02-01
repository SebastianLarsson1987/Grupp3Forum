// code from our Firebase console 
// Import the functions you need from the SDKs you need
// https://firebase.google.com/docs/web/setup#available-libraries
import { initializeApp } from "firebase/app";
import { getAuth, signInWithEmailAndPassword, createUserWithEmailAndPassword, signOut, deleteUser, sendPasswordResetEmail, updateProfile, onAuthStateChanged, browserLocalPersistence, setPersistence} from "firebase/auth";
import store from '../../store/index'

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
(async () => {
    await setPersistence(auth, browserLocalPersistence);
})();


// Register
const register = async (regEmail, username, password) => {
    try {
        await createUserWithEmailAndPassword(auth, regEmail, password);
        const user = await updateUser({ displayName: username, photoURL: null })
        console.log("register.userResponse", user)
        const body = JSON.stringify({ email: user.email, userName: user.displayName, uid: user.uid })
        console.log("AddUserBody", body)
        fetch("https://localhost:44362/api/User/AddUser", {
            headers: {
                "Accept": "application/json",
                "Content-Type": "application/json"
            },
            method: "POST",
            body: body
        }).then(r => console.log(r.json()));
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
        console.log(auth)
        console.error(error.code);
        alert(error.message);
    }

}

// Log in
const logIn = async (email, password) => {
    try {
        
            await signInWithEmailAndPassword(auth, email, password);
            const user = auth.currentUser
            store.commit('setUser', user)
            setPersistence(auth, browserLocalPersistence)
        
    } catch (err) {
        console.log(auth)
        console.error(err.code);
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
const updateUser = async (userInfo) => {
    try {
        const user = auth.currentUser;
        await updateProfile(user, userInfo);
        return auth.currentUser;
    } catch (err) {
        console.error(err);
        alert(err.message);
    }

}

onAuthStateChanged(auth, (user)=>{
    if(user){
        console.log(user)
    }else{
        console.log('hello world')
    }
})
export {
    auth,
    register,
    remove,
    logIn,
    logOut,
    resetPassword,
    updateUser,
    
}