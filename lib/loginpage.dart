import 'package:designthinking/mypage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatelessWidget {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 100.0,
              child: Image.asset('images/Logo.png'),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            Text('Design Thinking App',
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
            Padding(
              padding: EdgeInsets.all(20.0),
            ),
            SignInButton(
              Buttons.Google,
              onPressed: () {
                _SignIn().then((user) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => MyPage(user)));
                });
              },
            )
          ],
        ),
      ),
    );
  }

  Future<FirebaseUser> _SignIn() async {
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    FirebaseUser user = await _auth.signInWithCredential(
        GoogleAuthProvider.getCredential(
            idToken: googleAuth.idToken, accessToken: googleAuth.accessToken));
    return user;
  }
}
