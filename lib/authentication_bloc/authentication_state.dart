import 'package:flutter/cupertino.dart';

@immutable
class AuthenticationState {
  final bool isAuth;
  final bool isInit;
  final String username;

  AuthenticationState({
    @required this.isAuth,
    @required this.isInit,
    @required this.username,
  });

  factory AuthenticationState.uninitialized() {
    return AuthenticationState(
      isAuth: false,
      isInit: false,
      username: null,
    );
  }

/*
uninitialized — 앱이 시작될 때 사용자가 인증되었는지 여부를 기다리는 중입니다.
loading — 토큰 유지 / 삭제 대기
authenticated — 성공적으로 인증
unauthenticated — 인증되지 않음

이러한 각 상태는 사용자에게 표시되는 내용에 영향을 미칩니다.
예를 들면 다음과 같습니다.

인증 상태가 초기화되지 않은 경우 사용자에게 스플래시 화면이 표시 될 수 있습니다.
인증 상태가로드 중이면 사용자에게 진행률 표시기가 표시 될 수 있습니다.
인증 상태가 인증 된 경우 사용자에게 홈 화면이 표시 될 수 있습니다.
인증 상태가 인증되지 않은 경우 사용자에게 로그인 양식이 표시 될 수 있습니다.
구현에 뛰어 들기 전에 다양한 상태가 무엇인지 파악하는 것이 중요합니다.

AuthenticationState를 정의 했으므로 블록이 반응 할 AuthenticationEvents를 정의해야합니다.
 */

  factory AuthenticationState.unauthenticated() {
    return AuthenticationState(
      isAuth: true,
      isInit: false,
      username: null,
    );
  }

  factory AuthenticationState.authenticated() {
    return AuthenticationState(
      isAuth: true,
      isInit: true,
      username: null,
    );
  }

  AuthenticationState update({
    bool isAuthSuccess,
    bool isInit,
    String username,
  }) {
    return copyWith(
      isAuth: false,
      isInit: false,
      username: username,
    );
  }

  AuthenticationState copyWith({
    bool isAuth,
    bool isInit,
    String username,
  }) {
    return AuthenticationState(
      isAuth: isAuth ?? this.isAuth,
      isInit: isInit ?? this.isInit,
      username: username ?? this.username,
    );
  }

  @override
  String toString() {
    return '''AuthenticationState {
      isAuth: $isAuth,
      isInit: $isInit,
      username: $username,
      
    }''';
  }
}
