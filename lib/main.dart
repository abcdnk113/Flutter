import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/page/letspage.dart';
import 'package:weather/page/login.dart';
import 'package:weather/page/signuppage.dart';
import 'package:weather/provider/provider.dart';
import 'package:weather/services/auth_services.dart';
import 'package:weather/wrapper.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
      providers: [
        Provider<AuthService>(create: (_) => AuthService(),),
        ChangeNotifierProvider<MyAppState>(create: (_)=>MyAppState()),
        ChangeNotifierProvider<SignupState>(create: (_)=> SignupState())
      ],
      child:const MainApp()),);
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/':(context) => MyLoginPage(),
          '/login':(context) => MyLoginPage(),
          '/register':(context) => SignUpPage(),
          '/home':(context) => const LetsPage(),
        },
      )
    ;
  }
}
