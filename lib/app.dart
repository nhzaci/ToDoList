import 'package:flutter/material.dart';
import './screens/notes/notes.dart';
import './screens/archives/archives.dart';

const NotesRoute = '/';
const ArchivesRoute = '/archives';

class MyApp extends StatelessWidget {

  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: _routes(),
      theme: _theme(),
    );
  }

  RouteFactory _routes() {
    return (settings) {
      final Map<String, dynamic> arguments = settings.arguments;
      Widget screen;
      switch (settings.name) {
        //set up routing here
        case NotesRoute:
          screen = Notes();
          break;
        case ArchivesRoute:
          screen = Archives();
          break;
        default:
          return null;
      }
      return MaterialPageRoute(builder: (BuildContext context) => screen);
    };
  }

  ThemeData _theme() {
    return ThemeData(

    );
  }
}