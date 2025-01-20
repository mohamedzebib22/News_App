import 'package:flutter/material.dart';
import 'package:news_app/screens/home_page.dart';
import 'package:news_app/screens/webview_screen.dart';

void main() {
  runApp(const News_App());
}

class News_App extends StatelessWidget {
  const News_App ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        WebviewScreen.id :(context) => WebviewScreen(), 
        HomePage.id : (context) => HomePage(),
      },
      home: HomePage(),
    );
  }
}

