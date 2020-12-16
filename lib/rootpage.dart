import 'package:designthinking/loginpage.dart';
import 'package:designthinking/mypage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return StreamBuilder<FirebaseUser>(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      if (snapshot.hasData) {
        return MyPage(snapshot.data);
      } else {
        return LoginPage();
      }
    });
  }
}
