import 'package:flutter/material.dart';
import 'package:to_do_list/style.dart';
import './screens/notes/notes.dart';
//import './screens/archives/archives.dart';

const NotesRoute = '/';
const ArchivesRoute = '/archives';

class MyApp extends StatelessWidget {

  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Notes(),
      theme: _theme(),
    );
  }

  ThemeData _theme() {
    return ThemeData(
      appBarTheme: AppBarTheme(textTheme: TextTheme(title: TitleTextStyle)),
      textTheme: TextTheme(
        title: TitleTextStyle,
        body1: Body1TextStyle,
      )
    );
  }
}