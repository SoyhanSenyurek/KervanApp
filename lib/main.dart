import 'package:flutter/material.dart';
import 'package:kervan_app/pages/detail.dart';
import 'package:kervan_app/pages/root.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primaryColor: Colors.white),
    color: Colors.white,
    home: RootApp(),
    routes: {'/detail': (BuildContext context) => DetailScreen()},
  ));
}
