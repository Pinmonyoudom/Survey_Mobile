import 'package:flutter/material.dart';
import 'package:login/screens/survey_main.dart';
import 'navigation_drawer.dart';

class FinishSurvey extends StatefulWidget {
  @override
  _FinishSurveyState createState() => _FinishSurveyState();
}

class _FinishSurveyState extends State<FinishSurvey> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xff01A0C7),
        child: Stack(
          children: <Widget>[
            Positioned(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Text('Form Submitted!',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 35),
                      ), 
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: FlatButton(
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: 15, bottom: 15, left: 20, right: 20),
                          child: Text('Return to Survey Menu',
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                              color: Color(0xFF000000),
                              fontSize: 20.0,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        color: Colors.white,
                        disabledColor: Colors.grey,
                        shape: new RoundedRectangleBorder(
                          borderRadius:
                          new BorderRadius.circular(32.0)),
                        onPressed: () {
                          Navigator.push(context, new MaterialPageRoute(
                          builder: (context) => NavigationDrawer()));
                        }
                      )   
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}