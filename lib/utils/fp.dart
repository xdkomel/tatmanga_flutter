import 'package:fpdart/fpdart.dart';

ReturnType run<ReturnType>(ReturnType Function() operation) {
  return operation();
}

extension ScopeFunctionsForObject<T extends Object?> on T {
  ReturnType let<ReturnType>(ReturnType Function(T self) operationFor) =>
      operationFor(this);

  T also(void Function(T self) operationFor) {
    operationFor(this);
    return this;
  }
}

Either<(Object e, StackTrace st), T> throwable<T>(T Function() fun) {
  try {
    return right(fun());
  } catch (e, st) {
    return left((e, st));
  }
}

extension FunctionalNullable<A> on A? {
  T fold<T>(T Function() none, T Function(A) some) => switch (this) {
        null => none(),
        A a => some(a),
      };

  T? map<T>(T? Function(A) some) => fold(() => null, some);

  Option<T> toOption<T>(T Function(A) transform) => fold(
        () => const None(),
        (a) => Some(transform(a)),
      );
}

extension EitherAdditions<L, R> on Either<L, R> {
  A? toNullable<A>(A Function(R) transform) => fold(
        (_) => null,
        transform,
      );
}
