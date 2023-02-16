import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final tokenProvider = ChangeNotifierProvider<TokenNotifier>((ref) {
  return TokenNotifier();
});

class TokenNotifier extends ChangeNotifier {
  bool _isAuthentication = false;
  bool get isAuthentication => _isAuthentication;
  Future<void> login(String email, String pass) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pass);
      _isAuthentication = true;
      final _timer = Timer(Duration(hours: 24), () => logout());
    } catch (e) {
      print(e);
      // showSnackbar(message: 'Tài khoản hoặc mật khẩu không đúng !');
    }
  }

  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      _isAuthentication = false;
    } catch (e) {
      //: TODO
    }
  }
}
