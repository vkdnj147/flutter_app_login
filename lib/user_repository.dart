import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';


//사용자 데이터관리를 위해 만듬

//우리의 사용자 저장소는 단순성을 위해 모든 다른 구현을 모방하고 있지만
// 실제 응용 프로그램에서는 HttpClient 및 Flutter Secure Storage와 같은 것을 주입하여
// 토큰을 요청하고 키 저장소 / 키 체인에 읽거나 쓸 수 있습니다.

class UserRepository {
  Future<void> persistToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('accessTokenCola', token);
    return;
  }

  Future<String> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('accessTokenCola');
    return accessToken;
  }

  Future<void> signOut() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("accessTokenCola");
    return;
  }

  Future<bool> isSignedIn() async {
    final prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('accessTokenCola');
    if (accessToken != null) {
      return true;
    } else {
      return false;
    }
  }
}

