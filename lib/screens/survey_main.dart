import 'package:flutter/material.dart';
import 'package:login/screens/survey_create_form.dart';
import 'package:login/screens/login.dart';
import 'package:login/screens/survey_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Survey extends StatefulWidget {
  @override
  _SurveyState createState() => _SurveyState();
}

class _SurveyState extends State<Survey>{
  final _scaffoldKey = GlobalKey<ScaffoldState>();

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        key: _scaffoldKey,
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
                      padding: const EdgeInsets.all(10),
                      child: FlatButton(
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: 15, bottom: 15, left: 20, right: 20),
                          child: Text('View Existed Survey',
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
                          builder: (context) => SurveyList()));
                        }
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: FlatButton(
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: 15, bottom: 15, left: 20, right: 20),
                          child: Text('Create Survey',
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
                          builder: (context) => FormPage()));
                        },
                      )   
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: FlatButton(
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: 15, bottom: 15, left: 20, right: 20),
                          child: Text('Logout',
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
                          logout();
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
  
  void logout() async{
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.remove('user');
    localStorage.remove('token');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context)=>LoginPage()
      )
    );
  }
}