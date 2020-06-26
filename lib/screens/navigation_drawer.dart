import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:login/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

Future<List<Survey>> _fetchSurvey() async {
  final surveysListAPIUrl = 'http://survey-system-1.herokuapp.com/api/survey';
  final response = await http.get(surveysListAPIUrl,
  headers: {HttpHeaders.authorizationHeader: 'token'},
  );

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((survey) => new Survey.fromJson(survey)).toList();
  } else {
    throw Exception('Failed to load surveys from API');
  }
}

ListView _surveyListView(data) {
  return ListView.builder(
    itemCount: data.length,
    itemBuilder: (context, index) {
      return _tile(data[index].title, Icons.arrow_right);
    }
  );
}

ListTile _tile(String title, IconData icon) => ListTile(
  title: Text(title,
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 20,
      )),
  leading: Icon(
    icon,
    color: Colors.blue[500],
  ),
);

class Survey {
  final int id;
  final String title;

  Survey({this.id, this.title});

  factory Survey.fromJson(Map<String, dynamic> json) {
    return Survey(
      id: json['id'],
      title: json['title'],
    );
  }
}

class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  String mainProfilePicture = "https://venngage-wordpress.s3.amazonaws.com/uploads/2016/04/survey.png";

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
      body: Center(
          child: FutureBuilder<List<Survey>>(
          future: _fetchSurvey(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Survey> data = snapshot.data;
              return _surveyListView(data);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        )
      ),
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
