import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:login/screens/login.dart';
import 'package:login/utils/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>{
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 150),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: RaisedButton(
                    elevation: 10,
                    onPressed: (){
                      logout();
                    },
                    color: Color(0xff01A0C7),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Text('Logout',
                      style: TextStyle(
                        color: Colors.white,
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
      );
    }

  void logout() async{
    var res = await Network().getData('/logout');
    var body = json.decode(res.body);
    if(body['success']){
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
}