import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobimap/app/bindings/home_binding.dart';
import 'package:mobimap/app/routes/app_pages.dart';
import 'package:mobimap/app/routes/app_routes.dart';

import 'app/translations/app_translations.dart';
import 'app/ui/theme/color_schemes.dart';
import 'firebase_options.dart';

void main() async {
  runApp(const MyApp());

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mobimap',
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme, fontFamily: "OpenSans"),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      initialBinding: HomeBinding(),
      getPages: AppPages.routes,
      initialRoute: Routes.INITIAL,
      locale: const Locale('pt', 'BR'),
      translationsKeys: AppTranslations.translations,
    );
  }
}
