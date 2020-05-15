import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'survey_list.dart';
import 'survey_create_form.dart';
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
                decoration: BoxDecoration(
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
                  leading: Icon(Icons.create),
                  onTap: () => {
                    Navigator.of(context).pop(),
                    Navigator.push(context, MaterialPageRoute(builder: (context) => FormPage()))
                  },),
                Divider(),
                ListTile(
                  title: Text("Logout"),
                  leading: Icon(Icons.exit_to_app),
                  onTap: () => {
                    logout()
                  },),
        ],
      )),
      body: Center(
        child: Text("SURVEY SYSTEM"),
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
