
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobimap/app/utils/auth_manager_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

class MockAuthManager extends Mock implements AuthManagerImpl{}

class AuthManagerTests{

  @GenerateMocks([MockAuthManager])
  Future<void> main() async {}
}