import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobimap/app/ui/android/home_page.dart';
import 'package:mobimap/app/ui/android/login_page.dart';



class SplashArtPage extends StatelessWidget {
  const SplashArtPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomePage();
        } else {
          return LoginPage();
        }
      },
    ));
  }
}
