import 'package:blood_donation_app/screens/add.dart';
import 'package:blood_donation_app/screens/home.dart';
import 'package:blood_donation_app/screens/skip_page.dart';
import 'package:blood_donation_app/screens/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blood Donation',
      debugShowCheckedModeBanner: false,
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/skip': (context) => const SkipPage(),
        '/': (context) => const HomePage(),
        '/add': (context) => const AddUser(),
      },
      initialRoute: '/',
    );
  }
}
