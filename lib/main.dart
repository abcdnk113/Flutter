import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:weather/page/letspage.dart';
import 'package:weather/page/login.dart';
import 'firebase_options.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: //MainPage(),
      //FirebaseAuth.instance.currentUser != null ? const MyLoginPage(): const LetsPage(),      
      MyLoginPage(),
    );
  }
}


// ignore: use_key_in_widget_constructors
class MainPage extends StatelessWidget {  
  @override
  Widget build(BuildContext context) => Scaffold(
    body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context,snapshot){
        if (snapshot.hasData){
          return const LetsPage();
        }else{
          return const MyLoginPage();
        }
      }),
  );   
  
}