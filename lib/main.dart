import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/page/letspage/letspage.dart';
import 'package:weather/page/loginpage/login.dart';
import 'package:weather/page/mappage/map_provider.dart';
import 'package:weather/page/navigationpage/navigation_provider.dart';
import 'package:weather/page/settingpage/setting_provider.dart';
import 'package:weather/page/signuppage/signup.dart';
import 'package:weather/page/loginpage/login_provider.dart';
import 'package:weather/page/moodpage/mood_provider.dart';
import 'package:weather/page/signuppage/signup_provider.dart';
import 'package:weather/services/auth_services.dart';
import 'services/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(providers: [
      Provider<AuthService>(create: (_) => AuthService()),
      ChangeNotifierProvider<LoginState>(create: (_) => LoginState()),
      ChangeNotifierProvider<SignupState>(create: (_) => SignupState()),
      ChangeNotifierProvider<MoodState>(create: (_) => MoodState()),
      ChangeNotifierProvider<BottomNavigationBarProvider>(create: (_)=>BottomNavigationBarProvider()),
      ChangeNotifierProvider<TempratureProvider>(create: (_)=>TempratureProvider()),
      ChangeNotifierProvider<PlacesProvider>(create: (_)=>PlacesProvider())
    ], child: const MainApp()),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const LetsPage(),
        '/login': (context) => const MyLoginPage(),
        '/register': (context) => const SignUpPage(),
        '/home': (context) => const LetsPage(),
      },
    );
  }
}
