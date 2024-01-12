import 'package:flutter/material.dart';
import 'package:mobimap/app/ui/android/home_page.dart';

class SplashArtPage extends StatelessWidget {
  const SplashArtPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: FutureBuilder(
      future: Future.delayed(const Duration(seconds: 2)),
      builder: (context, snapshot) {
        return HomePage();
      },
    ));
  }
}
