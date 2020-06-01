import 'package:flutter/material.dart';
import 'package:login/utils/survey_class.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'detailScreen.dart';
import 'login.dart';

class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  String mainProfilePicture =
    "https://venngage-wordpress.s3.amazonaws.com/uploads/2016/04/survey.png";
  List<Todo> todos = List<Todo>.generate(20, (i) => Todo(
      'Survey $i',
      'A page for Survey $i',
    ),
  );

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
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todos[index].title),
            onTap: () {
              Navigator.push(context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(),
                  settings: RouteSettings(
                    arguments: todos[index],
                  ),
                ),
              );
            },
          );
        },
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
