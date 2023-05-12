import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:weather/page/letspage/letspage.dart';
import 'package:weather/page/loginpage/login.dart';
import 'package:weather/page/mappage/map_provider.dart';
import 'package:weather/page/navigationpage/bottomnavigation.dart';
import 'package:weather/page/navigationpage/navigation_provider.dart';
import 'package:weather/page/settingpage/setting_provider.dart';
import 'package:weather/page/signuppage/signup.dart';
import 'package:weather/page/loginpage/login_provider.dart';
import 'package:weather/page/moodpage/mood_provider.dart';
import 'package:weather/page/signuppage/signup_provider.dart';
import 'package:weather/services/auth_services.dart';
import 'services/firebase_options.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'messages',
  'Messages',
  description: 'This is for flutter firebase',
  importance: Importance.max,
);

void createChannel(AndroidNotificationChannel channel) async {
    final FlutterLocalNotificationsPlugin plugin =
        FlutterLocalNotificationsPlugin();
    await plugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  print('Handling a background message ${message.messageId}');
  print('Notification Message: ${message.data}');

  flutterLocalNotificationsPlugin.show(
    message.notification.hashCode,
    message.notification?.title,
    message.notification?.body,
    NotificationDetails(
      android: AndroidNotificationDetails(channel.id, channel.name,
          channelDescription: channel.description,
          icon: message.notification?.android?.smallIcon),
    ),
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  createChannel(channel);
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  try {
    final token = await messaging.getToken(
        vapidKey:
            "BN3F4iuYQYzcUVK9Na4xSIcSDswzTnc3KxHIu48i2R-me7UXgcyyEHGo2oyJkSCcLmSMG8TJ1Vz82TJCfim7Gpw");    
    print(token);    
  } catch (e) {};

  //FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(
    MultiProvider(providers: [
      Provider<AuthService>(create: (_) => AuthService()),
      ChangeNotifierProvider<LoginState>(create: (_) => LoginState()),
      ChangeNotifierProvider<SignupState>(create: (_) => SignupState()),
      ChangeNotifierProvider<MoodState>(create: (_) => MoodState()),
      ChangeNotifierProvider<BottomNavigationBarProvider>(
          create: (_) => BottomNavigationBarProvider()),
      ChangeNotifierProvider<TempratureProvider>(
          create: (_) => TempratureProvider()),
      ChangeNotifierProvider<PlacesProvider>(create: (_) => PlacesProvider()),
      ChangeNotifierProvider(
      create: (context) => TopicSubscriptionModel()),
    ], child: const MainApp()),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();

    FirebaseMessaging.instance.subscribeToTopic("mess");

    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings darwinInitializationSettings =
        DarwinInitializationSettings();

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: androidInitializationSettings,
      iOS: darwinInitializationSettings,
    );

    createChannel(channel);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);

    FirebaseMessaging.onMessage.listen(
      (RemoteMessage event) {               
        final notification = event.notification;
        final android = event.notification?.android;
        if (notification != null && android != null) {
          flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(channel.id, channel.name,
                  channelDescription: channel.description,
                  icon: android.smallIcon),
            ),
          );
        }
      },
    );
  }
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const LetsPage(),
        '/login': (context) => const MyLoginPage(),
        '/register': (context) => const SignUpPage(),
        '/home': (context) => bottomNavigationBar(),
      },
    );
  }
}



