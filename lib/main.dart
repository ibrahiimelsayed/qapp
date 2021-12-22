import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskcpl/answers.dart';
import 'package:taskcpl/firstquestion.dart';
import 'package:taskcpl/result.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Answers(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          Questions.routeNamed: (_) => const Questions(),
          Results.routeNamed: (context) => const Results()
        },
        home: const Questions(),
      ),
    );
  }
}
