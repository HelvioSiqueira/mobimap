sealed class Result<S, E extends Exception> {
  const Result();
}

final class Success<S, E extends Exception> extends Result<S, E> {
  const Success(this.value);
  final S value;
}

final class Failure<S, E extends Exception> extends Result<S, E> {
  const Failure(this.exception);
  final E exception;
}

final class NoVerifyUser<S, E extends Exception> extends Result<S, E> {
  const NoVerifyUser(this.value);
  final S value;
}