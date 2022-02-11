// code from our Firebase console 
// Import the functions you need from the SDKs you need
// https://firebase.google.com/docs/web/setup#available-libraries
import { initializeApp } from "firebase/app";
import { getAuth, signInWithEmailAndPassword, createUserWithEmailAndPassword, signOut, deleteUser, sendPasswordResetEmail, updateProfile, updateEmail } from "firebase/auth";

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
        const id = user.uid;
        const response = await fetch(`https://localhost:44362/api/User/DeleteUser?uid=${id}`, {
            method: "DELETE",
            headers: {
                'Accept': 'application/json',
                'Content-Type': "application/json"
            }

        });
        if (response.ok) {
            await deleteUser(user);
            logOut();
        }
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

const editEmail = async (email) => {
    try {

        const user = auth.currentUser;
        await updateEmail(user, email);
        return user;
    } catch (err) {
        console.log(err);
        alert(err.message);
    }
}

export {
    auth,
    register,
    remove,
    logIn,
    logOut,
    resetPassword,
    updateUser,
    editEmail
}