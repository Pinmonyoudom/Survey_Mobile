import 'dart:async';
import 'package:flutter/material.dart';
import 'package:login/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  String mainProfilePicture = "https://venngage-wordpress.s3.amazonaws.com/uploads/2016/04/survey.png";
  final Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List of Survey"),
        backgroundColor: Colors.blueAccent,
      ),
      drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName:  Text("name",style: TextStyle(color: Colors.blueAccent),),
                accountEmail: Text("name@gmail.com",style: TextStyle(color: Colors.blueAccent),),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(mainProfilePicture),
                  ),
                )),
                Divider(),
                ListTile(
                  title: Text("Logout"),
                  leading: Icon(Icons.exit_to_app),
                  onTap: () => {
                    logout()
                  },),
        ],
      )),
      body: WebView(
        initialUrl: "https://survey-system-1.herokuapp.com",
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
      )
    );
  }

  void logout() async{
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.remove('user');
    localStorage.remove('token');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context)=>HomePage()
      )
    );
  }
}
