import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'HomePage.dart';
import 'providers/time_provider.dart';

void main() {
  runApp(MultiProvider(providers: [
        ChangeNotifierProvider(create:  (_) => Time())
      ],
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        '/': (context) => MyHomePage(),
      },
    );
  }
}

