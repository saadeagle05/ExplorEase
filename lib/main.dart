import 'package:flutter/material.dart';
import 'loging.page.dart';

void main() {
  runApp(ExploreaseApp());
}

class ExploreaseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Explorease',
      theme: ThemeData.light(),
      home: LoginPage(),
    );
  }
}
