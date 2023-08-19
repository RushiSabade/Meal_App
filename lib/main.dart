import 'package:flutter/material.dart';
import 'package:meal_app_project/screens/categories.dart';
import 'package:meal_app_project/screens/tabs.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
  textTheme: Typography.dense2014,
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const TabsScreen(),
      // const MealsScreen(title:' Some category',
      //     meals: dummyMeals) ,
    );
  }
}
