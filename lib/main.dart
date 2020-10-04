import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "News Buddy",
      home: Scaffold(
        appBar: AppBar(
          title: Text("News Buddy"),
        ),
        body: Text("Daily news will be shown here"),
      ),
    );
  }
}
