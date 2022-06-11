import 'package:expenses_tracking_app/ui/screens/login_screen.dart'; 
import 'package:flutter/material.dart'; 

 
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}