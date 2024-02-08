import 'package:get/get.dart';
import 'package:mobimap/app/bindings/home_binding.dart';
import 'package:mobimap/app/bindings/login_binding.dart';
import 'package:mobimap/app/bindings/new_ap_binding.dart';
import 'package:mobimap/app/bindings/register_binding.dart';
import 'package:mobimap/app/bindings/reset_password_binding.dart';
import 'package:mobimap/app/bindings/splash_art_binding.dart';
import 'package:mobimap/app/routes/app_routes.dart';
import 'package:mobimap/app/ui/android/home_page.dart';
import 'package:mobimap/app/ui/android/login_page.dart';
import 'package:mobimap/app/ui/android/new_ap_page.dart';
import 'package:mobimap/app/ui/android/register_page.dart';
import 'package:mobimap/app/ui/android/reset_password_page.dart';
import 'package:mobimap/app/ui/android/splash_art_page.dart';
import 'package:mobimap/app/ui/android/veifiry_email_page.dart';

class AppPages {
  static final routes = [
    GetPage(
        name: Routes.INITIAL,
        page: () => const SplashArtPage(),
        bindings: [SplashArtBinding(), HomeBinding()]),
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      transition: Transition.leftToRight,
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.NEWAP,
      page: () => NewAPPage(),
      binding: NewAPBinding(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => RegisterPage(),
      binding: RegisterBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(name: Routes.VERIFYEMAIL, page: () => const VerifyEmailPage()),
    GetPage(
      name: Routes.RESETPASSWORD,
      page: () => const ResetPasswordPage(),
      binding: ResetPasswordBinding(),
      transition: Transition.rightToLeft,
    ),
  ];
}
