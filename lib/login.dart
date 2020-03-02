import 'package:flutter/material.dart';
import 'package:login/forget_password.dart';
import 'register.dart';

class LoginPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                child: Text(
                  'Login Page',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User name or email',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            Container(
                height: 50,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: Text('Login'),
                  onPressed: () {
                    print(nameController.text);
                    print(passwordController.text);
                  },
                )),
            FlatButton(
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ForgetPasswordPage()));
              },
              textColor: Colors.blue,
              child: Text('Forgot Password'),
            ),
            Container(
                child: Row(
              children: <Widget>[
                Text('Does not have account?'),
                FlatButton(
                  textColor: Colors.blue,
                  child: Text(
                    'Sign Up',
                  ),
                  onPressed: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => RegisterPage()))
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ))
          ],
        ),
      ),
    );
  }
}
