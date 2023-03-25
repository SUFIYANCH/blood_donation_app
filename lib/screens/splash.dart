import 'dart:async';

import 'package:blood_donation_app/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 5), () {
      Navigator.pushNamed(context, '/skip');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDFDCD3),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.network(
                "https://assets10.lottiefiles.com/packages/lf20_LWQZg8blao.json"),
            // Image(
            //   image: AssetImage("lib/assets/blood-removebg-preview.png"),
            // ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Blood Donation",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffbe151c)),
            ),
            // Text(
            //   "Donation",
            //   style: TextStyle(
            //       fontSize: 50,
            //       fontWeight: FontWeight.bold,
            //       color: Color(0xffbe151c)),
            // )
          ],
        ),
      ),
    );
  }
}
