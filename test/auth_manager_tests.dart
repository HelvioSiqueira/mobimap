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

  setUpAll(() {
    authManager = MockAuthManagerTest();
  });

  test('should return Success', () async {
    late Result<String, String> result;
    var email = "helvio@gmail.com";
    var password = "123";

    provideDummyBuilder<Result<String, String>>((parent, invocation) {
      if (invocation.positionalArguments[0] == "helvio@gmail.com" &&
          invocation.positionalArguments[1] == "123") {
        result = const Success("success");
        return const Success("success");
      } else if (invocation.positionalArguments[0] == "helvio@gmail.com" &&
          invocation.positionalArguments[1] != "123") {
        result = const Failure(ErrorsLogin.invalidCredential);
        return const Failure(ErrorsLogin.invalidCredential);
      } else if (invocation.positionalArguments[0] == "pedro@gmail.com" &&
          invocation.positionalArguments[1] == "123") {
        result = const Failure(ErrorsLogin.userNotFound);
        return const Failure(ErrorsLogin.userNotFound);
      } else {
        result = const Failure("other");
        return const Failure("other");
      }
    });
    when(authManager.doLogin(email, password)).thenAnswer((_) async => result);

    final login = await authManager.doLogin(email, password);

    expect(login, const Success("success"));
  });

  test('should return Failure as invalidCredential', () async {
    late Result<String, String> result;
    var email = "helvio@gmail.com";
    var password = "123abc";

    provideDummyBuilder<Result<String, String>>((parent, invocation) {
      if (invocation.positionalArguments[0] == "helvio@gmail.com" &&
          invocation.positionalArguments[1] == "123") {
        result = const Success("success");
        return const Success("success");
      } else if (invocation.positionalArguments[0] == "helvio@gmail.com" &&
          invocation.positionalArguments[1] != "123") {
        result = const Failure(ErrorsLogin.invalidCredential);
        return const Failure(ErrorsLogin.invalidCredential);
      } else if (invocation.positionalArguments[0] == "pedro@gmail.com" &&
          invocation.positionalArguments[1] == "123") {
        result = const Failure(ErrorsLogin.userNotFound);
        return const Failure(ErrorsLogin.userNotFound);
      } else {
        result = const Failure("other");
        return const Failure("other");
      }
    });
    when(authManager.doLogin(email, password)).thenAnswer((_) async => result);

    final login = await authManager.doLogin(email, password);

    expect(login, const Failure(ErrorsLogin.invalidCredential));
  });
}
