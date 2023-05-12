importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-messaging.js");

const firebaseConfig = {
    apiKey: "AIzaSyAoJY5WdXlwbbh7QqXuhyu6DxUUysEVGrM",
    authDomain: "weather-c864b.firebaseapp.com",
    projectId: "weather-c864b",
    storageBucket: "weather-c864b.appspot.com",
    messagingSenderId: "278876406126",
    appId: "1:278876406126:web:47cf81158f863fabbd017f",
    measurementId: "G-2HDYK2KTG4"
  };

firebase.initializeApp(firebaseConfig);

const messaging = firebase.messaging();

// Optional:
messaging.onBackgroundMessage((message) => {
  console.log("onBackgroundMessage", message);
});