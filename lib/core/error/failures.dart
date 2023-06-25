abstract class Failures {
  String message;

  Failures(this.message);

  @override
  String toString() {
    return message;
  }
}

class ServerFailures extends Failures {
  ServerFailures(super.message);
}

class CachedFailures extends Failures {
  CachedFailures(super.message);
}
