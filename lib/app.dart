import 'package:expenses_tracking_app/ui/screens/helpers/home_screen.dart';
import 'package:expenses_tracking_app/ui/screens/login_screen.dart';
import 'package:expenses_tracking_app/ui/screens/main_screen.dart'; 
import 'package:flutter/material.dart'; 

 
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MainScreen(), // LoginScreen()
      debugShowCheckedModeBanner: false,
    );
  }
}