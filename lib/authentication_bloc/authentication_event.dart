import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  @override
  List<Object> get props => [];
}


class AppStarted extends AuthenticationEvent {}

class LoggedIn extends AuthenticationEvent {}

class LoggedOut extends AuthenticationEvent {}

/*
Flutter 애플리케이션이 처음로드 될 때 AppStarted가 전달됩니다.
기존 사용자가 있는지 여부를 결정해야한다고 블록에 알립니다.
로그인이 성공하면 LoggedIn이 발송됩니다. 블록에 사용자가 성공적으로 로그인했음을 알립니다.
성공적인 로그 아웃시 LoggedOut이 발송됩니다. 블록에 사용자가 성공적으로 로그 아웃했음을 알립니다.
인증과 관련된 이벤트 및 상태를 정의 했으므로 AuthenticationBloc을 만들 수 있습니다.
 */