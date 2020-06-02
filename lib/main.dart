import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kicksonapp/signin/signin_detail.dart';
import 'package:kicksonapp/signin/signin_screen.dart';
import 'package:kicksonapp/simple_bloc_delegate.dart';
import 'package:kicksonapp/splash_screen.dart';
import 'package:kicksonapp/user_repository.dart';

import 'authentication_bloc/bloc.dart';
import 'authentication_bloc/authentication_bloc.dart';
import 'home/home_screen.dart';

/*

이제 HomePage 및 LoginPage 위젯에있는 <AuthenticationBloc> (context)의 BlocProvider.of가 더 의미가 있어야합니다.
MaterialApp을 BlocProvider <AuthenticationBloc> 내에 래핑 했으므로
BlocProvider.of <AuthenticationBloc> (BuildContext context) 정적 메소드를 사용하여
 AuthenticationBloc 인스턴스에 액세스 할 수 있습니다.

다시, 우리는 현재 AuthenticationState를 기반으로 SplashPage, LoginPage 또는 HomePage를
사용자에게 표시 할 수 있도록 AuthenticationState의 변경에 대응하기 위해 BlocBuilder를 사용하고 있습니다.
블록 사용의 또 다른 보너스는 한 곳에서 모든 전환에 액세스 할 수 있다는 것입니다. 대규모 애플리케이션에서는
애플리케이션 상태의 다른 부분을 관리하는 많은 블록을 갖는 것이 일반적입니다.
모든 트랜지션에 대한 응답으로 무언가를하고 싶다면 SimpleBlocDelegate라는 자체 BlocDelegate를 만들면됩니다.
SimpleBlocDelegate를 사용하려면 BlocSupervisor의 델리게이트를 SimpleBlocDelegate 인스턴스로 설정하기 위해
기본 기능을 조정하면됩니다.
 */

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final UserRepository userRepository = UserRepository();
  final Dio dio = Dio(BaseOptions(receiveTimeout: 5000, connectTimeout: 5000));

  runApp(
    BlocProvider(
      create: (context) => AuthenticationBloc(
        userRepository: userRepository,
        dio: dio,
      )..add(AppStarted()),
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  App({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is Unauthenticated) {
            return SigninScreen();
          }
          if (state is Authenticated) {
            return HomeScreen();
          }
          return SplashScreen();
        },
      ),
    );
  }
}