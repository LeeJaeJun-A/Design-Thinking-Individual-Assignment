import 'package:designthinking/mypage.dart';
import 'package:flutter/material.dart';

class Cat extends StatefulWidget {
  @override
  _CatState createState() => _CatState();
}

class _CatState extends State<Cat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 300,
                height: 300,
                child: Image.asset('images/cutecat.png', fit: BoxFit.cover),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
              ),
              Text('고양이는 매우 귀엽습니다', style: TextStyle(fontSize: 15.0),)
              ,Padding(
                padding: EdgeInsets.all(5.0),
              ),
              Text('저는 강아지보다 고양이가 더 좋습니다', style: TextStyle(fontSize: 15.0),),
              Padding(
                padding: EdgeInsets.all(5.0),
              ),
              Text('맞습니다 그냥 하는 말이에요', style: TextStyle(fontSize: 15.0),),
              Padding(
                padding: EdgeInsets.all(15.0),
              ),
              SizedBox(
                height: 35,
                width: 150,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pop(context, '뒤로가기');
                  },
                  child: Text('뒤로가기'),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
