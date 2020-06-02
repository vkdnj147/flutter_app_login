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