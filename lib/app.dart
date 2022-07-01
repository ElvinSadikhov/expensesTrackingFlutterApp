import 'package:expenses_tracking_app/app_themes.dart';  
import 'package:expenses_tracking_app/providers/theme_state.dart'; 
import 'package:expenses_tracking_app/ui/screens/login_screen.dart';
import 'package:expenses_tracking_app/ui/screens/main_screen.dart'; 
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';  

 
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeState>(
      builder: (context, ThemeState themeState, _) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: AppThemes.lightTheme.copyWith(textTheme: AppThemes.getTextTheme(isDark: themeState.isDark())),
          darkTheme: AppThemes.darkTheme.copyWith(textTheme: AppThemes.getTextTheme(isDark: themeState.isDark())),
          themeMode: themeState.themeMode,
          home: const MainScreen(), // LoginScreen()
          debugShowCheckedModeBanner: false,
        );
      }, 
    );
  }
} 

