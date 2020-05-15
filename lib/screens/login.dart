import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:login/screens/forgot_password.dart';
import 'package:login/screens/register.dart';
import 'navigation_drawer.dart';
import 'package:login/utils/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  _showMsg(msg) {
    final snackBar = SnackBar(
      content: Text(msg),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          // Some code to undo the change!
        },
      ),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            Positioned(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 25),
                      child: Text('Login',
                        style: TextStyle(
                            color: Color(0xff01A0C7),
                            fontWeight: FontWeight.bold,
                            fontSize: 40),
                      ), 
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextFormField(
                                style: TextStyle(color: Color(0xFF000000)),
                                cursorColor: Color(0xFF9b9b9b),
                                controller: usernameController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                  prefixIcon: Icon(
                                    Icons.insert_emoticon,
                                    color: Colors.grey,
                                  ),
                                  hintText: "Username",
                                  hintStyle: TextStyle(
                                      color: Color(0xFF9b9b9b),
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
                                ),
                                validator: (usernameValue) {
                                  if (usernameValue.isEmpty) {
                                    return 'Please enter your username';
                                  }
                                  usernameController.text = usernameValue;
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextFormField(
                                style: TextStyle(color: Color(0xFF000000)),
                                cursorColor: Color(0xFF9b9b9b),
                                controller: passwordController,
                                keyboardType: TextInputType.text,
                                obscureText: true,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                  prefixIcon: Icon(
                                    Icons.vpn_key,
                                    color: Colors.grey,
                                  ),
                                  hintText: "Password",
                                  hintStyle: TextStyle(
                                    color: Color(0xFF9b9b9b),
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal),
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
                                ),
                                validator: (passwordValue) {
                                  if (passwordValue.isEmpty) {
                                    return 'Please enter your password';
                                  }
                                  passwordController.text = passwordValue;
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: FlatButton(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: 8, bottom: 8, left: 10, right: 10),
                                  child: Text(
                                    _isLoading? 'Proccessing...' : 'Login',
                                    textDirection: TextDirection.ltr,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.0,
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                color: Color(0xff01A0C7),
                                disabledColor: Colors.grey,
                                shape: new RoundedRectangleBorder(
                                  borderRadius:
                                  new BorderRadius.circular(32.0)),
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    _login();
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ), 
                    Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, new MaterialPageRoute(
                          builder: (context) => ForgotPasswordPage()));
                        },
                        child: Text(
                          'Forgot password?',
                          style: TextStyle(
                            color: Color(0xff01A0C7),
                            fontSize: 15.0,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, new MaterialPageRoute(
                          builder: (context) => RegisterPage()));
                        },
                        child: Text(
                          'Create new Account',
                          style: TextStyle(
                            color: Color(0xff01A0C7),
                            fontSize: 15.0,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
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

  void _login() async{
    setState(() {
      _isLoading = true;
    });
    var data = {
      'username' : usernameController.text,
      'password' : passwordController.text
    };

    var res = await Network().authData(data, '/login');
    var body = json.decode(res.body);
    if(body != null){
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['token']));
      localStorage.setString('user', json.encode(body['user']));
      Navigator.push(context, new MaterialPageRoute(
          builder: (context) => NavigationDrawer()
        ),
      );
    }else{
      _showMsg(body['message']);
    }

    setState(() {
      _isLoading = false;
    });
  }
}