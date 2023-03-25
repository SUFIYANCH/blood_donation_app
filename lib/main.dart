import 'package:blood_donation_app/screens/add.dart';
import 'package:blood_donation_app/screens/home.dart';
import 'package:blood_donation_app/screens/skipPage.dart';
import 'package:blood_donation_app/screens/splash.dart';
import 'package:blood_donation_app/screens/update.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(brightness: Brightness.light),
      // darkTheme: ThemeData(brightness: Brightness.dark),
      // themeMode: ThemeMode.system,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/skip': (context) => const SkipPage(),
        '/': (context) => const HomePage(),
        '/add': (context) => const AddUser(),
        '/update': (context) => const UpdateUser(),
      },
      initialRoute: '/splash',
    );
  }
}
