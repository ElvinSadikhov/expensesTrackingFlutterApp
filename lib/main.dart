import 'package:expenses_tracking_app/app.dart';
import 'package:expenses_tracking_app/providers/bottom_navigation_bar_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomNavigationBarState()),

      ],
      child: const MyApp(),
    ), 
  );
}

