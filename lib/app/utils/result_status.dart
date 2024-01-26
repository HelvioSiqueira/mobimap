sealed class Result<S extends String, E extends String> {
  const Result();
}

final class Success<S extends String, E extends String> extends Result<S, E> {
  const Success(this.value);
  final S value;
}

final class Failure<S extends String, E extends String> extends Result<S, E> {
  const Failure(this.exception);
  final E exception;
}