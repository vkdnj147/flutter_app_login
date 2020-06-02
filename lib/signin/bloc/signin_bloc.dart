import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:kicksonapp/authentication_bloc/authentication_bloc.dart';
import 'package:kicksonapp/signin/bloc/signin_state.dart';
import 'package:meta/meta.dart';

import 'bloc.dart';
/*
LoginBloc은 초기 상태를 LoginInitial로 정의합니다.
항상 그렇듯이 LoginBloc은 mapEventToState를 구현해야합니다.
LoginBloc은 사용자 이름과 비밀번호가 지정된 사용자를 인증하기 위해
UserRepository에 종속됩니다. 또한 LoginBloc은 사용자가 유효한 자격 증명을 입력했을 때
AuthenticationState를 업데이트하기 위해 AuthenticationBloc에 종속됩니다.
 */
class SigninBloc extends Bloc<SigninEvent, SigninState> {
  final AuthenticationBloc _authenticationBloc;

  SigninBloc({
    @required AuthenticationBloc authenticationBloc,
  })  : assert(authenticationBloc != null),
        _authenticationBloc = authenticationBloc;

  @override
  SigninState get initialState => SigninState.empty();

  @override
  Stream<SigninState> mapEventToState(SigninEvent event) async* {
    if (event is SigninWithCredentialsPressed) {
      yield* _mapSigninWithCredentialsPressedToState(
        email: event.email,
        password: event.password,
      );
    }
  }

  Stream<SigninState> _mapSigninWithCredentialsPressedToState({
    String email,
    String password,
  }) async* {
    yield SigninState.loading();
    try {
      final basicToken =
          'Basic ' + base64.encode(utf8.encode('$email:$password'));
      final response =
          await _authenticationBloc.basicAuth('/auth/v1/signin', basicToken);
      yield SigninState.success();
    } catch (error) {
      yield SigninState.failure();
    }
  }
}
