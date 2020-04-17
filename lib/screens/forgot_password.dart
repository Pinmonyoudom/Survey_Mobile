import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController emailController = TextEditingController();
   final _scaffoldKey = GlobalKey<ScaffoldState>();

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
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Text('Forgot your password?',
                        style: TextStyle(
                            color: Color(0xff01A0C7),
                            fontWeight: FontWeight.bold,
                            fontSize: 35),
                      ), 
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Text('Enter your Email here and we will send you a reset.',
                        style: TextStyle(
                            color: Color(0xff01A0C7),
                            fontWeight: FontWeight.normal,
                            fontSize: 17),
                      ), 
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        style: TextStyle(color: Color(0xFF000000)),
                        cursorColor: Color(0xFF9b9b9b),
                        controller: emailController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.grey,
                          ),
                          hintText: "Email",
                          hintStyle: TextStyle(
                              color: Color(0xFF9b9b9b),
                              fontSize: 15,
                              fontWeight: FontWeight.normal),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
                        ),
                        validator: (emailValue) {
                          if (emailValue.isEmpty) {
                            return 'Please enter email';
                          }
                          emailController.text = emailValue;
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: FlatButton(
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: 15, bottom: 15, left: 20, right: 20),
                          child: Text('Submit',
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        color: Color(0xff01A0C7),
                        disabledColor: Colors.grey,
                        shape: new RoundedRectangleBorder(
                          borderRadius:
                          new BorderRadius.circular(32.0)),
                        onPressed: () {

                        },
                      )   
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Text('--Unfinished--',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
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
}






      