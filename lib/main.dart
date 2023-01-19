import 'package:flutter/material.dart';
import 'package:gtagapp/main_menu/maintenance_report_page_post.dart';
import 'package:gtagapp/main_menu/wreckage_report_post.dart';
import 'package:gtagapp/screen/main_menu.dart';
import 'package:gtagapp/screen/sign_in_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignInPage(),
    );
  }
}
