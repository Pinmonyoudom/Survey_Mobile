import 'package:flutter/material.dart';
import 'package:login/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'navigation_drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
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
                      child: Text('Survey System',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 45),
                      ), 
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: FlatButton(
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: 15, bottom: 15, left: 20, right: 20),
                          child: Text('Start',
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
                          builder: (context) => CheckAuth()));
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

class CheckAuth extends StatefulWidget {
  @override
  _CheckAuthState createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  bool isAuth = false;
  @override
  void initState() {
    _checkIfLoggedIn();
    super.initState();
  }

  void _checkIfLoggedIn() async{
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('acessToken');
    if(token != null){
      setState(() {
        isAuth = true;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    Widget child;
    if (isAuth) {
      child = NavigationDrawer();
    } else {
      child = LoginPage();
    }
    return Scaffold(
      body: child,
    );
  }
}