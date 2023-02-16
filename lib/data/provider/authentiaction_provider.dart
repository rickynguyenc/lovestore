import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final tokenProvider = ChangeNotifierProvider<TokenNotifier>((ref) {
  return TokenNotifier();
});

class TokenNotifier extends ChangeNotifier {
  final box = Hive.box('tokenbox');
  bool get isAuthentication => box.get('isLogin') ?? false;
  Future<void> login(String email, String pass) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pass);

      box.put('isLogin', true);
      final _timer = Timer(Duration(hours: 24), () => logout());
    } catch (e) {
      print(e);
      // showSnackbar(message: 'Tài khoản hoặc mật khẩu không đúng !');
    }
  }

  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      box.delete('isLogin');
    } catch (e) {
      //: TODO
    }
  }
}
