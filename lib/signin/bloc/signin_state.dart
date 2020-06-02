import 'package:meta/meta.dart';

@immutable
class SigninState {
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;

  SigninState({
    @required this.isSubmitting,
    @required this.isSuccess,
    @required this.isFailure,
  });
/*
LoginInitial은 LoginForm의 초기 상태입니다.
LoginLoading은 자격 증명을 확인할 때 LoginForm의 상태입니다.
LoginFailure는 로그인 시도가 실패한 경우 LoginForm의 상태입니다.
LoginState가 정의되었으므로 LoginEvent 클래스를 살펴 보겠습니다.
 */
  factory SigninState.empty() {
    return SigninState(
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  factory SigninState.loading() {
    return SigninState(
      isSubmitting: true,
      isSuccess: false,
      isFailure: false,
    );
  }

  factory SigninState.failure() {
    return SigninState(
      isSubmitting: false,
      isSuccess: false,
      isFailure: true,
    );
  }

  factory SigninState.success() {
    return SigninState(
      isSubmitting: false,
      isSuccess: true,
      isFailure: false,
    );
  }

  SigninState copyWith({
    bool isSubmitting,
    bool isSuccess,
    bool isFailure,
  }) {
    return SigninState(
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
    );
  }

  @override
  String toString() {
    return '''SigninState {
      isSubmitting: $isSubmitting,
      isSuccess: $isSuccess,
      isFailure: $isFailure,
    }''';
  }
}
