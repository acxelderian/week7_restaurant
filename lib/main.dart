import 'package:flutter/material.dart';
import 'package:restaurant/restaurant_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant App',

      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: RestaurantScreen.routeName,
      routes: {
        RestaurantScreen.routeName: (context)=>const RestaurantScreen(),
      },
    );
  }
}