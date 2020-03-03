import 'package:flutter/material.dart';

class ForgetPasswordPage extends StatefulWidget {
  @override
  _ForgetPasswordPageState createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            child: Text(
              'Forgot your password?',
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                  fontSize: 30),
            )),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            child: Text('Enter your Email here and we will send you a reset.')),
          Container(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your email',
              ),
            ),
          ),
          Container(
            height: 50,
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: RaisedButton(
              textColor: Colors.white,
              color: Colors.blue,
              child: Text('Send Request'),
              onPressed: () {
                print(emailController.text);
              },
            ),
          ),
        ]),
      ),
    );
  }
}