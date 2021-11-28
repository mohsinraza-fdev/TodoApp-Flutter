import 'package:app/ItemList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'HomePage.dart';
import 'providers/time_provider.dart';
import 'providers/list_provider.dart';
import 'AddPage.dart';

void main() {
  runApp(MultiProvider(providers: [
        ChangeNotifierProvider(create: (_) => Time()),
        ChangeNotifierProvider(create: (_) => listitems())
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
        '/add': (context) => AddPage()
      },
    );
  }
}


