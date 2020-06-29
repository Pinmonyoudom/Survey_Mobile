import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:login/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

Future<List<Survey>> _fetchSurvey() async {
  SharedPreferences localStorage = await SharedPreferences.getInstance();
  String token = localStorage.getString('acessToken');
  print("$token");
  final surveysListAPIUrl = 'http://survey-system-1.herokuapp.com/api/survey';
  final response = await http.get(surveysListAPIUrl,
  headers: {HttpHeaders.authorizationHeader: "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZTI1MWE5OGUxODUwNTQ3YjgyM2E5YTk4YmMzZTZjYmU2MDUwZjc2Y2FhYmY2NjdjYzU3OWI3YmUwN2M3OGViNTRmZTQ3N2I4NDZmZTM0ZjUiLCJpYXQiOjE1OTEwOTcyNDEsIm5iZiI6MTU5MTA5NzI0MSwiZXhwIjoxNjIyNjMzMjQxLCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.sJ0IvEeK3l3-jnw5tkozKT7QJDwaJYfOqN7eKLQC3jICuuOk7vAwSoX19zDfuUzraPVwMljDmNwHZknr_Py41vP_OUi23KSNDh2n4F4WzZvQ-8qqfjgDbQtP6ZsfOg5GDHb2HbuQjKNzzF52XxJ_4bZ0zz4YrUQ5OL0lI8v-CC7l5XPLqXkDaj2iGZ5QWnv1zkA6U4Ax-kARQ6gVm30r8IZg5nxhf-M0BdMSeh8o2YxW1vKCS_4CYDM25XrLx0AxAIcvF0ZZuAAvoIOa9BRL9fkqpF8JSowV5zoR8g_Y4YHjC1RK90Ll7Di_j3RlxyCSEltbHs8FMFo7BojAel99TqBpRecQMKDsR4fURtnOJB72wxifQo7bZUhpJtu3mPM8jOsT6o2Ixpj6o5AXBhRcowHeq_T8H-YTe8qn8a4OwlzKZir_PEf7cyh3rcFVkzg8Qw1T1UGV6AvbotsA6R2V4FgsSujfWujctKjL1LQkrcgNEVPo746Bhj6_C-1mOtk837y7MuwPpZAKYdAxklYoAyL75tnFKPHMNYIP0onZAg9J_HSgbUCaipt_jIz3UoMjdp0DokDfDR-DMqikIkavxBRkADuiN-lJ9E2xQiwox6luMqf55SmXRcjkl81Jb_8wUs561IxScXQrGQ-AD3DMCxbjqYVfQ1ASYQE99VvcGzw"},
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
      return _tile(data[index].title, data[index].description, Icons.arrow_right);
    }
  );
}

ListTile _tile(String title, String subtitle, IconData icon) => ListTile(
  title: Text(title,
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 20,
      )),
  subtitle: Text(subtitle),
  leading: Icon(
    icon,
    color: Colors.blue[500],
  ),
);

class Survey {
  final int id;
  final String title;
  final String description;

  Survey({this.id, this.title, this.description});

  factory Survey.fromJson(Map<String, dynamic> json) {
    return Survey(
      id: json['id'],
      title: json['title'],
      description: json['description'],
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
        child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailScreen(),),
          );
        },
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
      ),
    );
  }

  void logout() async{
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.remove('user');
    localStorage.remove('acessToken');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context)=>HomePage()
      )
    );
  }
}

class DetailScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text("Test"),
      ),
    );
  }
}