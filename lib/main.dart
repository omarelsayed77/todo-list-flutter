import 'package:finaltodo/dataprovider.dart';
import 'package:finaltodo/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => dataprovider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: homescreen(),
      ),
    );
  }
}
