import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/page/letspage.dart';
import 'package:weather/page/login.dart';
import 'package:weather/page/signup.dart';
import 'package:weather/provider/login_provider.dart';
import 'package:weather/provider/mood_provider.dart';
import 'package:weather/provider/signup_provider.dart';
import 'package:weather/services/auth_services.dart';
import 'firebase_options.dart';

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
      ChangeNotifierProvider<MoodState>(create: (_) => MoodState())
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
