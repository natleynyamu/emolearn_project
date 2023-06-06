import 'dart:async';
import 'loading.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // The splash screen redirects to the loading screen 
    Timer(const Duration(seconds: 2), ((() {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: ((context) => const LoadingScreen())));
    })));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor:Color.fromRGBO(62, 20, 82, 1.0),
      body: Center(child: Text("Emolearn", style: TextStyle(color: Colors.white, fontSize: 40.0))),
    );
  }
}
