sealed class Result {
  const Result();

  factory Result.success() => Success();
  factory Result.error() => Error();
}

class Success extends Result {}

class Error extends Result {}
