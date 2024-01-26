import 'package:flutter_test/flutter_test.dart';
import 'package:mobimap/app/utils/auth_manager.dart';
import 'package:mobimap/app/utils/errors/errors_login.dart';
import 'package:mobimap/app/utils/result_status.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_manager_tests.mocks.dart';

class AuthManagerTest extends Mock implements AuthManager {}

@GenerateMocks([AuthManagerTest])
Future<void> main() async {
  late AuthManagerTest authManager;

  var email = "helvio@gmail.com";
  var password = "123";

  setUpAll(() {
    authManager = MockAuthManagerTest();

    provideDummyBuilder<Result<String, String>>((parent, invocation){

      if (email == "helvio@gmail.com" && password == "123") {
        return const Success("success");
      } else if (email == "helvio@gmail.com" && password != "123") {
        return const Failure(ErrorsLogin.invalidCredential);
      } else if (email == "pedro@gmail.com" && password == "123") {
        return const Failure(ErrorsLogin.userNotFound);
      } else {
        return const Failure("other");
      }
    });
  });

  test('should return Success', () async {
    const success = Success("success");
    email = "helvio@gmail.com";
    password = "123";

    when(authManager.doLogin(email, password)).thenAnswer((_) async => success);

    final login = await authManager.doLogin("helvio@gmail.com", "123");

    expect(login, success);
  });

  test('should return Failure as invalidCredential', () async {
    const result = Failure(ErrorsLogin.invalidCredential);
    email = "helvio@gmail.com";
    password = "123abc";

    when(authManager.doLogin(email, password)).thenAnswer((_) async => result);

    final login = await authManager.doLogin(email, password);

    expect(login, result);
  });
}
