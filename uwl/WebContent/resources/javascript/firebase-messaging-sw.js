importScripts('https://www.gstatic.com/firebasejs/5.9.2/firebase-app.js');
importScripts('https://www.gstatic.com/firebasejs/5.9.2/firebase-messaging.js');

/*firebase.initializeApp({
	messagingSenderId : "379855395449"
});*/

var config = {
		apiKey: "AIzaSyCP7-9lifICjBrXx38qVaYolWTYChiy9nU",
	    authDomain: "webuwl.firebaseapp.com",
	    databaseURL: "https://webuwl.firebaseio.com",
	    projectId: "webuwl",
	    storageBucket: "webuwl.appspot.com",
	    messagingSenderId: "379855395449",
	    appId: "1:379855395449:web:ef47774cfc1627f914d2a8",
	    measurementId: "G-YJ4JNNVF8T"
};
firebase.initializeApp(config);

const messaging = firebase.messaging();
messaging.setBackgroundMessageHandler(function(payload) {
	const title = 'Hello World';
	const options = {
			body : payload.data.status
	};
	return self.registration.showNotification(title, options);
})