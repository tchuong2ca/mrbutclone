

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localize/lang_code.dart';
import 'package:localize/localize.dart';
import 'package:mrbutclone/ui/authentication.dart';
import 'ui/profile.dart';
import 'ui/questions.dart';
import 'package:splashscreen/splashscreen.dart';

import 'ui/classes.dart';
import 'ui/courses.dart';
import 'ui/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Translate().withDefaultLocale(LangCode.vi);
  //true if allow
  await Translate().setAcceptMissingKey(false);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity

      ),
      home: animation(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class animation extends StatelessWidget {
  const animation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Icons.flutter_dash_rounded,
        nextScreen: homee(),
        duration: 2,
        splashTransition: SplashTransition.scaleTransition
    );
  }
}


class homee extends StatefulWidget {

  @override
  State<homee> createState() => _homeeState();

}

class _homeeState extends State<homee> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  final List<Widget> _widgetOptions = <Widget>[
    Home(),
    Authentication(),
    Questions(),
    Classes(),
    Profile()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
       toolbarHeight: 0,
      ),
      body:
      Container(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(

        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.lightBlueAccent,
        items:   <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'home'.localize,
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.book_circle),
            label: 'course'.localize,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_answer),
            label: 'Q&A'.localize,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.class_),
            label: 'class'.localize,
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_alt_circle_fill),
            label: 'profile'.localize,
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}


