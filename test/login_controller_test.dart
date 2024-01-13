import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {
  @override
  Future<UserCredential> signInWithEmailAndPassword(
      {required String email, required String password}) {
    return super.noSuchMethod(
        Invocation.method(#signInWithEmailAndPassword, [email, password]),
        returnValue: Future.value(MockUserCredential()));
  }
}

class MockUserCredential extends Mock implements UserCredential {}

void main() {
  var credentialsToTest = {'email': 'helvio@gmail.com', 'password': '123456'};
  MockFirebaseAuth auth = MockFirebaseAuth();

  test('should return true if email is valid', () async {
    when(
      auth.signInWithEmailAndPassword(
          email: credentialsToTest['email']!,
          password: credentialsToTest['password']!),
    ).thenAnswer((_) async => MockUserCredential());
    var result = await auth.signInWithEmailAndPassword(
        email: credentialsToTest['email']!,
        password: credentialsToTest['password']!);
    expect(result, isA<MockUserCredential>());
  });
}
