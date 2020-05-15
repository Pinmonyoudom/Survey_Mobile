import 'package:flutter/material.dart';
import 'package:login/screens/survey_page.dart';

class SurveyList extends StatefulWidget {
  @override
  _SurveyListState createState() => _SurveyListState();
}

class _SurveyListState extends State<SurveyList>{
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<String> _listViewData = [
    "Test Survey 1",
    "Test Survey 2",
    "Test Survey 3",
    "Test Survey 4",
    "Test Survey 5",
  ];

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Existed Survey'),
        ),
        body: ListView(
          padding: EdgeInsets.all(10.0),
          children: _listViewData
            .map((data) => ListTile(
              leading: Icon(Icons.book),
              title: Text(data),
              onTap: () {
                Navigator.push(context, new MaterialPageRoute(
                  builder: (context) => SurveyPage()));
              }
            ))
          .toList(),
        ),
      );
    }
}