import 'package:designthinking/cat.dart';
import 'package:designthinking/loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MyPage extends StatefulWidget {
  // ignore: deprecated_member_use
  final FirebaseUser user;

  MyPage(this.user);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Design Thinking App',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: _myBody(),
    );
  }

  Widget _myBody() {
    return Padding(
      padding: EdgeInsets.all(30.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: <Widget>[
                SizedBox(
                  width: 100.0,
                  height: 100.0,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(widget.user.photoUrl),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
            ),
            Text(widget.user.displayName,
                textAlign: TextAlign.center, style: TextStyle(fontSize: 20.0)),
            Padding(
              padding: EdgeInsets.all(8.0),
            ),
            Text(widget.user.email,
                textAlign: TextAlign.center, style: TextStyle(fontSize: 20.0)),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            SizedBox(
              height: 35,
              width: 150,
              child: RaisedButton(
                onPressed: () {
                  _launchURL();
                },
                child: Text('내 위치 확인하기'),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(7.0),
            ),
            SizedBox(
              height: 35,
              width: 150,
              child: RaisedButton(
                onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) => Cat()));
                },
                child: Text('고양이'),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(7.0),
            ),
            SizedBox(
              height: 35,
              width: 150,
              child: RaisedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  _googleSignIn.signOut();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: Text('로그아웃'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchURL() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lat = position.latitude;
    var lng = position.longitude;
    var url = 'https://google.com/maps/search/?api=1&query=$lat,$lng';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
