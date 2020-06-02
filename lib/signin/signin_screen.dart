import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kicksonapp/authentication_bloc/authentication_bloc.dart';
import 'bloc/bloc.dart';
import 'signin.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({
    Key key,
  }) : super(key: key);
  /*
앱에는 AuthenticationProvider가 삽입되어 있으며,
이는 BlocProvider 위젯을 사용하여 전체 위젯 트리에서 사용할 수 있습니다.
BlocProvider는 BlocProvider.of (context)를 통해 자식들에게 블록을 제공하는 Flutter 위젯입니다.
블록의 단일 인스턴스가 서브 트리 내의 여러 위젯에 제공 될 수 있도록 DI 위젯으로 사용됩니다.
   */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider<SigninBloc>(
        create: (context) => SigninBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context)),
        child: SigninDetail(),
      ),
    );
  }
}

/*
LoginForm은 사용자 입력 (로그인 버튼 누름)을 처리해야하고
비즈니스 로직 (주어진 사용자 이름 / 암호에 대한 토큰 가져 오기)이 필요하므로 LoginBloc을 만들어야합니다.
AuthenticationBloc과 마찬가지로 LoginState 및 LoginEvents를 정의해야합니다. LoginState부터 시작하겠습니다.
 */