import 'package:flutter/material.dart';
import 'survey_list.dart';
import 'form.dart';
import 'login.dart';

class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  String mainProfilePicture =
      "https://venngage-wordpress.s3.amazonaws.com/uploads/2016/04/survey.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Survey System"),
        backgroundColor: Colors.blueAccent,
      ),
      drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName:  Text("SurveySystem",style: TextStyle(color: Colors.blueAccent),),
                accountEmail: Text("surveysystem@gmail.com",style: TextStyle(color: Colors.blueAccent),),
              //currentAccountPicture: GestureDetector(child: CircleAvatar(backgroundImage: NetworkImage("https://flutter.dev/images/flutter-logo-sharing.png"),),),
              //otherAccountsPictures: <Widget>[
              //  GestureDetector(
              //    onTap: () => print("This is other flutter"),
              //      child: CircleAvatar(backgroundImage: NetworkImage("https://flutter.dev/images/flutter-logo-sharing.png"),),
              //   )
              // ],
                decoration: BoxDecoration(
                // Image.asset("assets/survey.png")
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(mainProfilePicture),
                  ),
                )),
                ListTile(
                  title: Text("View Existed Survey"),
                  leading: Icon(Icons.control_point_duplicate),                
                  onTap: () => {
                    Navigator.of(context).pop(),
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SurveyList()))
                  },),
                ListTile(
                  title: Text("Create Survey"),
                  leading: Icon(Icons.create), //leading in front
                  // trailing: Icon(Icons.create), //trailing behind
                  onTap: () => {
                    Navigator.of(context).pop(),
                    Navigator.push(context, MaterialPageRoute(builder: (context) => FormPage()))
                  },),
                Divider(),
                ListTile(
                  title: Text("Logout"),
                  leading: Icon(Icons.exit_to_app),
                  // onTap: ()=> Navigator.of(context).pop(),
                  onTap: () => {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()))
                  },),
        ],
      )),
      body: Center(
        child: Text("SURVEY SYSTEM"),
      ),
    );
  }
}
